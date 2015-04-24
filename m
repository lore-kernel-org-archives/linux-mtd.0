Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlkSX-0001jb-Hm
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 20:44:26 +0000
Received: from dovecot03.posteo.de (unknown [185.67.36.28])
 by mx02.posteo.de (Postfix) with ESMTPS id 7871E25B17F3
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:44:01 +0200 (CEST)
Received: from mail.posteo.de (localhost [127.0.0.1])
 by dovecot03.posteo.de (Postfix) with ESMTPSA id 3lYSCP19Ylz5vN2
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:43:58 +0200 (CEST)
Received: from nzxt.fritz.box (nzxt.localdomain [192.168.178.46])
 (Authenticated sender: joerg.krause@embedded.rocks)
 by embedded.rocks (Postfix) with ESMTPSA id 0AF54980384
 for <linux-mtd@lists.infradead.org>; Fri, 24 Apr 2015 22:43:57 +0200 (CEST)
Message-ID: <1429908237.1945.72.camel@embedded.rocks>
Subject: Re: [PATCH 2/3] Makefile: fix build against musl
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: linux-mtd@lists.infradead.org
Date: Fri, 24 Apr 2015 22:43:57 +0200
In-Reply-To: <1429827173-1739-2-git-send-email-joerg.krause@embedded.rocks>
References: <1429827173-1739-1-git-send-email-joerg.krause@embedded.rocks>
 <1429827173-1739-2-git-send-email-joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fr, 2015-04-24 at 00:12 +0200, Jörg Krause wrote:
> Fix undefined reference to 'libintl_gettext'.
> 
> Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index eade234..36bb700 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -105,7 +105,7 @@ $(call _mkdep,lib/,libmtd.a)
>  obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
>       hashtable/hashtable.o hashtable/hashtable_itr.o
>  LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
> -LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
> +LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -lintl
>  $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
>  
>  #

It turned out that this is unrelated to mtd. Reject this.
