Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oym07-0003tM-9O
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 13:38:15 +0000
Received: by fxm4 with SMTP id 4so1324565fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 06:38:14 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: clean up zlib.h usage a bit
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1285209176-30223-1-git-send-email-vapier@gentoo.org>
References: <1285209176-30223-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 23 Sep 2010 16:36:30 +0300
Message-ID: <1285248990.29268.127.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-22 at 22:32 -0400, Mike Frysinger wrote:
> Hide zlib's crc32 in compr_zlib.c and mkfs.ubifs/compr.c.
> 
> jffs2reader.c and mkfs.jffs2.c don't actually use zlib, so punt the
> include from the file.
> 
> mkfs.jffs2.c is implicitly using crc32 from zlib.h instead of the
> local mtd_crc32, so fix the local usage.  otherwise we get warnings
> about undefined crc32 because the file was redirecting the prototype.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
