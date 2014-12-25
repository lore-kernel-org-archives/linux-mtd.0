Received: from mx5.zte.com.cn ([63.217.80.70])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y3wsV-0001My-FS
 for linux-mtd@lists.infradead.org; Thu, 25 Dec 2014 01:06:13 +0000
In-Reply-To: <CAFLxGvw-0o3fMg2VCYT8_6=5zH879QQ8Xaza5vTC_tHcqt-dLA@mail.gmail.com>
References: <OFC9D6133D.097A1410-ON48257DB8.0008AFFC-48257DB8.0008ED1F@zte.com.cn>
 <CAFLxGvw-0o3fMg2VCYT8_6=5zH879QQ8Xaza5vTC_tHcqt-dLA@mail.gmail.com>
Subject: [PATCH]Re: fix spelling mistake in ubifs.h
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <OFE5169C5A.1E766A7F-ON48257DB9.0002ABF0-48257DB9.0005E4E5@zte.com.cn>
From: liu.song11@zte.com.cn
Date: Thu, 25 Dec 2014 09:05:15 +0800
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Richard.

Thanks for your suggestion. At first I was thought this spelling mistake is just a little mistake,
because we could easily know the right word by the context.However,little things should also be
taken seriously, then I revise the description of this patch.

Regards
-------------------------------------------------------------------------------------------------

When reading the code, I found there is a spelling mistake in ubifs.h, maybe we could fix it.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
---
 fs/ubifs/ubifs.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index a06e8d7..fe53006 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -157,7 +157,7 @@
 #define WORST_COMPR_FACTOR 2

 /*
- * How much memory is needed for a buffer where we comress a data node.
+ * How much memory is needed for a buffer where we compress a data node.
  */
 #define COMPRESSED_DATA_NODE_BUF_SZ \
 	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
--




From:	Richard Weinberger <richard.weinberger@gmail.com>
To:	liu.song11@zte.com.cn,
Cc:	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date:	2014-12-25 03:44
Subject:	Re: fix spelling mistake in ubifs.h



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
> ZTE Information Security Notice: The information contained in this mail (and any attachment transmitted herewith) is privileged and confidential and is intended for the exclusive use of the addressee(s).  If you are not an intended recipient, any disclosure, reproduction, distribution or other dissemination or use of the information contained is strictly prohibited.  If you have received this mail in error, please delete it and notify us immediately.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--
Thanks,
//richard


--------------------------------------------------------
ZTE Information Security Notice: The information contained in this mail (and any attachment transmitted herewith) is privileged and confidential and is intended for the exclusive use of the addressee(s).  If you are not an intended recipient, any disclosure, reproduction, distribution or other dissemination or use of the information contained is strictly prohibited.  If you have received this mail in error, please delete it and notify us immediately.
