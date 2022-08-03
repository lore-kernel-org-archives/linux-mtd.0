Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBC6C19F2C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Aug 2022 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0AnRbcrNDCj6RX6TRCGIpZphDsvkXGihFdfEpLvyAw8=; b=FqS2Kc/Mu+SWgo
	sUH/Ibz9QYi3V5EEYIhHfsy5cWHKdyeNU7U+kCqrsP2GWPpVtdDaKpqFKhsrrpWyGDRUFrhT6+MD3
	LvCwXPSSPni0jSLJHAFXkK+RgjyPft/iOo2OxNIqpvbZGjgepGNnPoHzHH4I3x3Y5FkOqDF3pda+8
	wo1uoJXxvHJ9Fqw4ZPftLxO/jF1ETXdfNO+DueU8da5iugvR2FVDCeM/f3U6aIchZ7qkRSz1Apww5
	Od1D75qLg7TP0snm2EorU59o5iluhBH6xHNtapXkNP6RUwnsTFEuq4iZSipLXFjbklGs50pes849u
	Ef1B8lUB7fdVg2qQYJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJGhX-007IYj-25; Wed, 03 Aug 2022 15:54:27 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJGhH-007IUl-Lj
	for linux-mtd@lists.infradead.org; Wed, 03 Aug 2022 15:54:14 +0000
Received: by mail-qt1-x834.google.com with SMTP id d16so1519411qtw.8
        for <linux-mtd@lists.infradead.org>; Wed, 03 Aug 2022 08:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-stonybrook-edu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=PZWPUpVvF9cKIsgpwg6daHjxAiTOoYVGBnAYticzGhY=;
        b=OVc1n5/b/fmZ0C2vLRPLIuj9H9JCeO6s4H5Czk9eJYvj4bZqh3Q3MGft/isGv95E9w
         Zh7pNz9I2erpIO7d6us6AqnTRJhV618K3PJhm2AV97UrbEW/7LoOk+GscNm6HrwmGYca
         qEcz5f4h1D5PDbZTHO7lJ2kMXPyc5aCGy/CUACuW0EMuN4xmqSqAcPvU4v/UOhnJcqIw
         YvcaLOL2Zfm1e6YlDSwcLX4h/VlrEr38JG2OgZDmr6JpONPnvs/GeVWtcwS1vF9aePqC
         dncyS2P2GZ+fKAVFDHwrmyFD63bW3ya0su90k9uHVjtidXDlMRnhv7QIw+JxFbrznEPD
         gXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=PZWPUpVvF9cKIsgpwg6daHjxAiTOoYVGBnAYticzGhY=;
        b=zRPLi5ALLhnVWeZ2BP4mAEOlqFizx2NvWhMU6wH6Za/0/JzYG1MXRXegBTGI+XsNCa
         J/tic3BItCECdxz+yyah07YLmMKQ+swoeGEi+SoTzU3ueO4B9ZzI2JvDUzOhfDN/4GWM
         wlccQfyhs7atggkVVeUX2LCjuD8Zr/w1yQ9Svqqna5lWL29+XZ013gcm1KPDlLk3ha2M
         NdLr5uwy2T4phz6GaV3+aZPfGUwMp26oRFawNyYufPa2NCF8DvxsZiu6RS2I1LoJG1+d
         iAZ1xEq/t443KnR1El0iWHXbDH71ohl2X3yeOV10PnMHfYxdcSWp0XCLUsRRxdZ64WY8
         E/PA==
X-Gm-Message-State: AJIora8yl8LIsE0ob/yc6vGY898sgOFoWukp4tgia1HqOzQWb3Sjf3ow
	4NQuFWmQUttjzdjyvnTjaNAZMw==
X-Google-Smtp-Source: AGRyM1sWWba8NY7xWkmAVGphiUFqgi6FgQq65hLjbWLLtcK7DMOzBoMwpkOfIDf9+X1bRbU+Q2ApLg==
X-Received: by 2002:ac8:5e47:0:b0:31e:ed53:ba5a with SMTP id i7-20020ac85e47000000b0031eed53ba5amr22551176qtx.530.1659542049150;
        Wed, 03 Aug 2022 08:54:09 -0700 (PDT)
Received: from sgdp06.fsl.cs.sunysb.edu (sgdp6.fsl.cs.sunysb.edu. [130.245.126.123])
        by smtp.googlemail.com with ESMTPSA id x13-20020a05620a258d00b006b60e1cf2c2sm12589223qko.0.2022.08.03.08.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 08:54:08 -0700 (PDT)
From: Yifei Liu <yifeliu@cs.stonybrook.edu>
To: 
Cc: yifeliu@cs.stonybrook.edu,
	ezk@cs.stonybrook.edu,
	madkar@cs.stonybrook.edu,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Kyeong Yoo <kyeong.yoo@alliedtelesis.co.nz>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: correct logic when creating a hole in jffs2_write_begin
Date: Wed,  3 Aug 2022 15:53:12 +0000
Message-Id: <20220803155315.2073584-1-yifeliu@cs.stonybrook.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_085412_043710_402EF899 
X-CRM114-Status: GOOD (  18.47  )
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

Bug description and fix:

1. Write data to a file, say all 1s from offset 0 to 16.

2. Truncate the file to a smaller size, say 8 bytes.

3. Write new bytes (say 2s) from an offset past the original size of the
file, say at offset 20, for 4 bytes.  This is supposed to create a "hole"
in the file, meaning that the bytes from offset 8 (where it was truncated
above) up to the new write at offset 20, should all be 0s (zeros).

4. Flush all caches using "echo 3 > /proc/sys/vm/drop_caches" (or unmount
and remount) the f/s.

5. Check the content of the file.  It is wrong.  The 1s that used to be
between bytes 9 and 16, before the truncation, have REAPPEARED (they should
be 0s).

We wrote a script and helper C program to reproduce the bug
(reproduce_jffs2_write_begin_issue.sh, write_file.c, and Makefile).  We can
make them available to anyone.

The above example is shown when writing a small file within the same first
page.  But the bug happens for larger files, as long as steps 1, 2, and 3
above all happen within the same page.

The problem was traced to the jffs2_write_begin code, where it goes into an
'if' statement intended to handle writes past the current EOF (i.e., writes
that may create a hole).  The code computes a 'pageofs' that is the floor
of the write position (pos), aligned to the page size boundary.  In other
words, 'pageofs' will never be larger than 'pos'.  The code then sets the
internal jffs2_raw_inode->isize to the size of max(current inode size,
pageofs) but that is wrong: the new file size should be the 'pos', which is
larger than both the current inode size and pageofs.

Similarly, the code incorrectly sets the internal jffs2_raw_inode->dsize to
the difference between the pageofs minus current inode size; instead it
should be the current pos minus the current inode size.  Finally,
inode->i_size was also set incorrectly.

The patch below fixes this bug.  The bug was discovered using a new tool
for finding f/s bugs using model checking, called MCFS (Model Checking File
Systems).

Signed-off-by: Yifei Liu <yifeliu@cs.stonybrook.edu>
Signed-off-by: Erez Zadok <ezk@cs.stonybrook.edu>
Signed-off-by: Manish Adkar <madkar@cs.stonybrook.edu>
---
 fs/jffs2/file.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index ba86acbe12d3..0479096b96e4 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -137,19 +137,18 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
 	pgoff_t index = pos >> PAGE_SHIFT;
-	uint32_t pageofs = index << PAGE_SHIFT;
 	int ret = 0;
 
 	jffs2_dbg(1, "%s()\n", __func__);
 
-	if (pageofs > inode->i_size) {
-		/* Make new hole frag from old EOF to new page */
+	if (pos > inode->i_size) {
+		/* Make new hole frag from old EOF to new position */
 		struct jffs2_raw_inode ri;
 		struct jffs2_full_dnode *fn;
 		uint32_t alloc_len;
 
-		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
-			  (unsigned int)inode->i_size, pageofs);
+		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new position\n",
+			  (unsigned int)inode->i_size, (uint32_t)pos);
 
 		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
 					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
@@ -169,10 +168,10 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 		ri.mode = cpu_to_jemode(inode->i_mode);
 		ri.uid = cpu_to_je16(i_uid_read(inode));
 		ri.gid = cpu_to_je16(i_gid_read(inode));
-		ri.isize = cpu_to_je32(max((uint32_t)inode->i_size, pageofs));
+		ri.isize = cpu_to_je32((uint32_t)pos);
 		ri.atime = ri.ctime = ri.mtime = cpu_to_je32(JFFS2_NOW());
 		ri.offset = cpu_to_je32(inode->i_size);
-		ri.dsize = cpu_to_je32(pageofs - inode->i_size);
+		ri.dsize = cpu_to_je32((uint32_t)pos - inode->i_size);
 		ri.csize = cpu_to_je32(0);
 		ri.compr = JFFS2_COMPR_ZERO;
 		ri.node_crc = cpu_to_je32(crc32(0, &ri, sizeof(ri)-8));
@@ -202,7 +201,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 			goto out_err;
 		}
 		jffs2_complete_reservation(c);
-		inode->i_size = pageofs;
+		inode->i_size = pos;
 		mutex_unlock(&f->sem);
 	}
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
