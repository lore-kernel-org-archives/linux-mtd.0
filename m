Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F74FE63F25
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Feb 2026 03:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ECnFu2AWSi/0CXqLix/XZsuTO4JCrYtR9xXEE81ou0c=; b=n70KeoMlZ7deoA
	XNZuF4uFhafTIGvii0yrLiQcGZw7IWCfP/YU1YCbEQNvobOp9GmGDg8g75sf4wd8cTKnwKl29rDGL
	eQ27rpt46qc8J3OOWwtI824KzNStdcmpxR6NaTNQMCt5S35H6DUen2pU3Q1iknQuIrtSHDqq2IN0B
	jVqcoCQleQdvW5rYIRKDLaV8IRbB8A2FaSkN/elEYtLYVdfwlWZS5jk0SLb3Pa1oBYWiz7RvSy7Gp
	O2GtXziWqg/OQuw25dL1rR9/S5Q1iQI0gdHgCZORYO8cBF1kd3YwiGUsa0d+zkYgKUGIS55yVosvm
	/aU1c0UR501D19c2e8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrpan-00000005v2J-23qD;
	Mon, 16 Feb 2026 03:48:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrpak-00000005v2D-0a6R
	for linux-mtd@lists.infradead.org;
	Mon, 16 Feb 2026 03:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 206916013F;
	Mon, 16 Feb 2026 03:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B08C116C6;
	Mon, 16 Feb 2026 03:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771213688;
	bh=/NPRv+JQITdsPcw91sGKoR3MwuItH/IfrV7CAXxvdLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VL3XD3fbyw22MhDDqOFJdA+5mYO6/roW15CItSAIEQLzhRtQfPbWE7ul+2/9BjBL7
	 Ww9lnvmAgWCjAv8G1Oar+k8JAyRBS5g+Wd20y3uPKWkBK4ZaYeEjpNNmh15TSg5vhy
	 p4YXKpHsFbMfPadGW3yY6kHZMG9J/nCdCsN10TBeMaGSAvc2G8CsH5pfJCO68XJSJk
	 Iu7fP+5f0SUWSj28PrWyoR+IPnb+4WEjMa9R74QByK64ZoTxsMjytkuDeOIq9xGNql
	 WB/aO3tT4pddNr7qYP9svlNInez/SxOOfFlANHtOsei1dzdJKntdyVsZyH2OtbrKEy
	 Yyr/hx/6vlEwA==
Date: Sun, 15 Feb 2026 19:48:08 -0800
From: Kees Cook <kees@kernel.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miguel Ojeda <ojeda@kernel.org>, stable@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Avoid boot crash in RedBoot partition table parser
Message-ID: <202602151911.AD092DFFCD@keescook>
References: <92af570970aadee773f2b0b18179efef0f34be93.1771114891.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92af570970aadee773f2b0b18179efef0f34be93.1771114891.git.fthain@linux-m68k.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Feb 15, 2026 at 11:21:31AM +1100, Finn Thain wrote:
>     memcmp: detected buffer overflow: 15 byte read of buffer size 14
> [...]
> -		    !memcmp(names, "RedBoot config", 15) ||

The warning is saying that "names" is detected to be 14 bytes in size. It
is allocated here, and nulllen can be ignored (it is fixed size, either 0
or sizeof(nullstring), and skipped over):

        parts = kzalloc(sizeof(*parts) * nrparts + nulllen + namelen, GFP_KERNEL);
	...
        nullname = (char *)&parts[nrparts];
	...
        names = nullname + nulllen;

so "names" is pointing to the final "namelen" many bytes of the
allocation. Calculating "namelen" happens via an earlier for loop:

        buf = vmalloc(master->erasesize);
	...
        ret = mtd_read(master, offset, master->erasesize, &retlen,
                       (void *)buf);
	...
        numslots = (master->erasesize / sizeof(struct fis_image_desc));
	...
        for (i = 0; i < numslots; i++) {
		...
                namelen += strlen(buf[i].name) + 1;

So namelen could be basically any length at all. This fortify warning
looks legit to me -- this code used to be reading beyond the end of
the allocation.

Your patch looks technically correct, but why not just use strcmp? Both
arguments are NUL-terminated. The memcmp() calls were all including the
NUL byte, so they're effectively doing strcmp except that they weren't
stopping at the first NUL byte. So probably just better to do:

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index 3b55b676ca6b..c06ba7a2a34b 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -270,9 +270,9 @@ static int parse_redboot_partitions(struct mtd_info *master,
 
 		strcpy(names, fl->img->name);
 #ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
-		if (!memcmp(names, "RedBoot", 8) ||
-		    !memcmp(names, "RedBoot config", 15) ||
-		    !memcmp(names, "FIS directory", 14)) {
+		if (!strcmp(names, "RedBoot") ||
+		    !strcmp(names, "RedBoot config") ||
+		    !strcmp(names, "FIS directory")) {
 			parts[i].mask_flags = MTD_WRITEABLE;
 		}
 #endif


-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
