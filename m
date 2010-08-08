Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiA27-0006Fm-JJ
	for linux-mtd@lists.infradead.org; Sun, 08 Aug 2010 17:51:40 +0000
Received: by qwe4 with SMTP id 4so7605978qwe.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Aug 2010 10:51:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281169577-18664-3-git-send-email-dedekind1@gmail.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
	<1281169577-18664-3-git-send-email-dedekind1@gmail.com>
Date: Sun, 8 Aug 2010 13:51:37 -0400
Message-ID: <AANLkTinexMZo_7aTx3cvs=Nk1freiH+jeuo2bYyMrXJu@mail.gmail.com>
Subject: Re: [PATCH 2/7] UBIFS: do not treat ENOSPC specially
From: Vitaly Wool <vitalywool@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Sat, Aug 7, 2010 at 4:26 AM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
>
> 'ubifs_garbage_collect_leb()' should never return '-ENOSPC', and if it
> does, this is an error. Thus, do not treat this error code specially.
> '-EAGAIN' is a special error code, but not '-ENOSPC'.
>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
> =A0fs/ubifs/gc.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index f89a422..29ce1b3 100644
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -677,7 +677,7 @@ int ubifs_garbage_collect(struct ubifs_info *c, int a=
nyway)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D ubifs_garbage_collect_leb(c, &lp);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret < 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN || r=
et =3D=3D -ENOSPC) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EAGAIN) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * These c=
odes are not errors, so we have to
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * return =
the LEB to lprops. But if the

(just passing by...) probably the comment should be updated as well?

Thanks,
   Vitaly
