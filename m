Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNFU-00020R-EN
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:13:01 +0000
Received: by fxm14 with SMTP id 14so704531fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 11:12:59 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307536063.31223.67.camel@localhost>
References: <1307427548-29306-4-git-send-email-vapier@gentoo.org>
	<1307460482-3745-1-git-send-email-vapier@gentoo.org>
	<1307533966.31223.66.camel@localhost>
	<1307536063.31223.67.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Jun 2011 14:12:39 -0400
Message-ID: <BANLkTi=dFc4gh26QV67Gp4ijOo8-nPhc4Q@mail.gmail.com>
Subject: Re: [PATCH v2] libmtd: add helper funcs for getting regioninfo and
	locked info
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 08:27, Artem Bityutskiy wrote:
> On Wed, 2011-06-08 at 14:52 +0300, Artem Bityutskiy wrote:
>> On Tue, 2011-06-07 at 11:28 -0400, Mike Frysinger wrote:
>> > This extends the libmtd with the helper functions:
>> > =C2=A0 =C2=A0 mtd_regioninfo: interface to MEMGETREGIONINFO
>> > =C2=A0 =C2=A0 mtd_islocked: interface to MEMISLOCKED
>> >
>> > Users of these functions will follow shortly ...
>> >
>> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>>
>> Pushed with a small tweak, thanks!
>>
>> > +int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
>> > +{
>> > + =C2=A0 int ret;
>> > + =C2=A0 erase_info_t ei;
>> > +
>> > + =C2=A0 ei.start =3D eb * mtd->eb_size;
>> > + =C2=A0 ei.length =3D mtd->eb_size;
>> > +
>> > + =C2=A0 ret =3D ioctl(fd, MEMISLOCKED, &ei);
>> > + =C2=A0 if (ret < 0)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mtd_ioctl_error(mtd, eb, "=
MEMISLOCKED");
>> > +
>>
>> I've removed this error message - if we fail, better return an error
>> code silently. At least your next patch is built a way that it will keep
>> iterating and executing this function.
>>
>> We might as well print an error message if (!ENOTTY && !ENOTSUPP), but I
>> did not do this. I expect you to send a correction patch if you do not
>> like this :-)
>
> I've just pushed a correction patch on top of this:
>
> From 92a06994b7c3f146cbdb770b30780e32f021118f Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Wed, 8 Jun 2011 15:30:14 +0300
> Subject: [PATCH] libmtd: improve mtd_islocked interface
>
> This patch first of all, re-names 'mtd_islocked()' into 'mtd_is_locked()'=
 since
> this seems to be the name Mike wanted, and it looks a bit nicer.
>
> This patch also makes 'mtd_is_locked()' print an error message if it fail=
s. I'm
> not sure if it is good idea for a library to do so, but all functions do =
this,
> so it certainly _not_ a good idea to be inconsistent.
>
> However, for the special case, when the the "is locked" ioctl is not supp=
orted
> or is not valid for this device, we do not print an error message and ret=
urn
> ENOTSUPP error code.
>
> Thus, the user can distinguish between real errors and non-fatal "not
> supported" cases.
>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> =C2=A0include/libmtd.h | =C2=A0 =C2=A08 +++++---
> =C2=A0lib/libmtd.c =C2=A0 =C2=A0 | =C2=A0 13 +++++++++++--
> =C2=A02 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/include/libmtd.h b/include/libmtd.h
> index 7275246..9efccbc 100644
> --- a/include/libmtd.h
> +++ b/include/libmtd.h
> @@ -190,16 +190,18 @@ int mtd_erase(libmtd_t desc, const struct mtd_dev_i=
nfo *mtd, int fd, int eb);
> =C2=A0int mtd_regioninfo(int fd, int regidx, struct region_info_user *reg=
info);
>
> =C2=A0/**
> - * mtd_islocked - see if the specified eraseblock is locked.
> + * mtd_is_locked - see if the specified eraseblock is locked.
> =C2=A0* @mtd: MTD device description object
> =C2=A0* @fd: MTD device node file descriptor
> =C2=A0* @eb: eraseblock to check
> =C2=A0*
> =C2=A0* This function checks to see if eraseblock @eb of MTD device descr=
ibed
> =C2=A0* by @fd is locked. Returns %0 if it is unlocked, %1 if it is locke=
d, and
> - * %-1 in case of failure.
> + * %-1 in case of failure. If the ioctl is not supported (support was ad=
ded in
> + * Linux kernel 2.6.36) or this particular device does not support it, e=
rrno is
> + * set to @ENOTSUPP.
> =C2=A0*/
> -int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb);
> +int mtd_is_locked(const struct mtd_dev_info *mtd, int fd, int eb);
>
> =C2=A0/**
> =C2=A0* mtd_torture - torture an eraseblock.
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index 2573cc7..c34874e 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -900,14 +900,23 @@ int mtd_regioninfo(int fd, int regidx, struct regio=
n_info_user *reginfo)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> -int mtd_islocked(const struct mtd_dev_info *mtd, int fd, int eb)
> +int mtd_is_locked(const struct mtd_dev_info *mtd, int fd, int eb)
> =C2=A0{
> + =C2=A0 =C2=A0 =C2=A0 int ret;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0erase_info_t ei;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ei.start =3D eb * mtd->eb_size;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ei.length =3D mtd->eb_size;
>
> - =C2=A0 =C2=A0 =C2=A0 return ioctl(fd, MEMISLOCKED, &ei);
> + =C2=A0 =C2=A0 =C2=A0 ret =3D ioctl(fd, MEMISLOCKED, &ei);
> + =C2=A0 =C2=A0 =C2=A0 if (ret < 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (errno !=3D ENOTTY =
&& errno !=3D EOPNOTSUPP)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return mtd_ioctl_error(mtd, eb, "MEMISLOCKED");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 errno =3D EOPNOTSUPP;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> =C2=A0}

if you remove the new "islocked_supported" flag from my v3, this is
almost what i had already.  so i'll drop any further work here (and
focus on `mtdinfo`) since we've come to feature parity.
-mike
