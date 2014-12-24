Received: from mail-vc0-x231.google.com ([2607:f8b0:400c:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3rrG-0007CD-1r
 for linux-mtd@lists.infradead.org; Wed, 24 Dec 2014 19:44:35 +0000
Received: by mail-vc0-f177.google.com with SMTP id ij19so3051340vcb.22
 for <linux-mtd@lists.infradead.org>; Wed, 24 Dec 2014 11:44:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <OFC9D6133D.097A1410-ON48257DB8.0008AFFC-48257DB8.0008ED1F@zte.com.cn>
References: <OFC9D6133D.097A1410-ON48257DB8.0008AFFC-48257DB8.0008ED1F@zte.com.cn>
Date: Wed, 24 Dec 2014 20:44:10 +0100
Message-ID: <CAFLxGvw-0o3fMg2VCYT8_6=5zH879QQ8Xaza5vTC_tHcqt-dLA@mail.gmail.com>
Subject: Re: fix spelling mistake in ubifs.h
From: Richard Weinberger <richard.weinberger@gmail.com>
To: liu.song11@zte.com.cn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 24, 2014 at 2:38 AM,  <liu.song11@zte.com.cn> wrote:
>
> maybe there is a spelling mistake.fix it or ignore it seems both ok, lol.

This is not a valid patch description.

> ---
>  fs/ubifs/ubifs.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index a06e8d7..fe53006 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -157,7 +157,7 @@
>  #define WORST_COMPR_FACTOR 2
>
>  /*
> - * How much memory is needed for a buffer where we comress a data node.
> + * How much memory is needed for a buffer where we compress a data node.
>   */
>  #define COMPRESSED_DATA_NODE_BUF_SZ \
>         (UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
> --
>
> --------------------------------------------------------
> ZTE Information Security Notice: The information contained in this mail (=
and any attachment transmitted herewith) is privileged and confidential and=
 is intended for the exclusive use of the addressee(s).  If you are not an =
intended recipient, any disclosure, reproduction, distribution or other dis=
semination or use of the information contained is strictly prohibited.  If =
you have received this mail in error, please delete it and notify us immedi=
ately.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Thanks,
//richard
