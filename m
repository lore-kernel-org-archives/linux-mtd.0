Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTocV-0001qC-MB
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:14:28 +0000
Received: by fxm14 with SMTP id 14so4183585fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:14:25 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307422886.11104.21.camel@localhost>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307384537-9607-4-git-send-email-vapier@gentoo.org>
	<1307422886.11104.21.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 7 Jun 2011 01:14:05 -0400
Message-ID: <BANLkTik0YrwYWFiQMZucSp83zD0cS+emgQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] flash_info: display MEMGETINFO and MEMISLOCKED
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

On Tue, Jun 7, 2011 at 01:01, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
>> I found the existing flash_info output to be a little lacking, so
>> add decoders for MEMGETINFO and MEMISLOCKED.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> =C2=A0flash_info.c | =C2=A0 98 +++++++++++++++++++++++++++++++++++++++++=
++++++++++------
>> =C2=A01 files changed, 87 insertions(+), 11 deletions(-)
>
> Pushed patches 1-3.
>
> WRT this patch - I think the sector map should be a separate option,
> because it outputs too much for a default option.

i'm adding regioninfo(-r)/sectormap(-s) as options to mtdinfo so users
get the extended info only when they ask for it

>> + =C2=A0 =C2=A0 for (i =3D 0; i < reginfo->numblocks; ++i) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 einfo.start =3D reginfo->off=
set + i * reginfo->erasesize;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(" %*i: %08x ", width,=
 i, einfo.start);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(fd, MEMISLOCKED, &=
einfo))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
printf("RO ");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
printf(" =C2=A0 ");
>
>
> MEMISLOCKED is quite new ioctl, so you should check for ENOTTY. E.g.,
> with my stock Fedora 14 + nandsim I see all sectors as RO, which is
> obviously not true.

i'll take care of this as i implement regioninfo/islocked in libmtd
-mike
