Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B361C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jan 2022 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a+S09CYo5wKx+ktYHDmsw6Cne3N/wrL1WInMmn/jl4A=; b=h8ZrcYVYu5PbVv
	JdeO7q2Nan2Qyc2W1TbvwqwR+TRpJ1nWZ+LLxxU2HThNJyl/HWcl2NX7VdAoSeF1rthrXESlPpYm1
	XMtyrKZl/OJE/ccNeC3cUqsu+MtLUp6saidcxCa+NZ3YNEJwfUtc4458jqzK7YQwmes2M/LtwK5Ve
	s+PG8rmzs4NLW5f269XD1aDNwIRUqOa9w2oSNFnH6pZUNV9GXE9zelL2Vcv9Rt3mdv9ckktyNFH+s
	OEW5O5XI6AxkhZHIm+b+YENyN6dn3XCAX/Z1IQANhfxed8RctdlHmKHtCtLiFC+hs58AoDNvGgnE/
	u9f1cOIURx3TlaBLXgyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n58Cb-00FAik-Fo; Wed, 05 Jan 2022 15:27:49 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n58CY-00FAhq-LI
 for linux-mtd@lists.infradead.org; Wed, 05 Jan 2022 15:27:48 +0000
Received: (Authenticated sender: info@smetnet.be)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPA id 4936CFF811
 for <linux-mtd@lists.infradead.org>; Wed,  5 Jan 2022 15:27:41 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 05 Jan 2022 16:27:41 +0100
From: info@smetnet.be
To: linux-mtd@lists.infradead.org
Subject: Western Digital My Cloud Mirror (Ex) MTD devices not detected on
 newer kernels.
Message-ID: <bda350e75e4a2bc743eddd56d476780b@smetnet.be>
X-Sender: info@smetnet.be
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_072746_891256_C901BE26 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,
I'd like to upgrade the kernel of my Western Digital My Cloud Mirror 
(same as My Cloud Ex, Armada-370 SoC). My /dev/mtd* devices are not 
showing on any kernel 4.16.1 or newer.

I noticed someone else had a very similar if not the same issue: 
https://yhbt.net/lore/all/CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com/ 
. Unfortunately I don't know how to hook in to this conversation and if 
I should or not.

As far as my understanding goes, at some point in time (4.16.1) 
CONFIG_MTD_NAND_PXA3xx was dropped in favor of CONFIG_MTD_NAND_MARVELL . 
But for some reason it does not work on my board. I use the same DTS 
file for both builds btw.


Basically, if I compile a 4.14.260 kernel with at least this set:

CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_PXA3xx=y

I get:

wannes@mcm:~$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 10000000 00020000 "pxa3xx_nand-0"
mtd1: 00500000 00020000 "u-Boot"
mtd2: 00500000 00020000 "uImage"
mtd3: 00500000 00020000 "ramdisk"
mtd4: 0c900000 00020000 "image.cfs"
mtd5: 00f00000 00020000 "rescue firmware"
mtd6: 01400000 00020000 "config"
mtd7: 00500000 00020000 "reserve"
wannes@mcm:~$ uname -r
4.14.260
wannes@mcm:~$

When I compile a newer kernel (5.16.rc8 for this example), I changed the 
config to this:

wannes@mcm:~/src/linux-stable$ grep NAND .config | grep -v not\ set
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_RAW_NAND=y
CONFIG_MTD_NAND_ORION=y
CONFIG_MTD_NAND_MARVELL=y
CONFIG_MTD_NAND_BRCMNAND=y
CONFIG_MTD_NAND_PLATFORM=y
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
CONFIG_MTD_NAND_ECC_SW_BCH=y

wannes@mcm:~/src/linux-stable$ cat /proc/mtd
dev:    size   erasesize  name
wannes@mcm:~/src/linux-stable$ dmesg | grep mtd
mtdoops: mtd device (mtddev=name/number) must be supplied
wannes@mcm:~/src/linux-stable$

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
