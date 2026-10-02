Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8918BCA5FD4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 02:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEcClbOGQM6o9WOz5us6Zo+GrwgNo5KC4Ywy/9FABMs=; b=mOsiVCpO/nor4e
	hSMBxaOrpFdDQDi2e0Lnxo7BwpMA6O8OakCBpeHXTl2P36dlWwlXK9yE7sh4kQeO44V57Wb9LRNo9
	Zx1Wkb3olbQ053TaGvd5Xl4E598SLh4wfKs6+LDJNdRdeTwq0qo+DalEEPZ6DzyArD+t3UuA8ZuPb
	QgQK0tfp9P4tuuvtvIXKrsLYK6W7P2kYTdMwnIjRqogrWQrqjtaPBvAE1E9J2IOuEJ6CxfSaToYHX
	YPWjtI4Bxsocr7JUqueroVa2DebG2SIPYAZsd1tk6mTiCh86k4050YRRqnQnvFfPlBYSrDmVvhKNm
	3bxTA56OxwKATm/CryQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSur-0000000AVo9-0gZm;
	Fri, 02 Oct 2026 02:22:29 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSun-0000000AVnb-2G2l
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 02:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1K
	8FEs/DRSVKpmdn4t6jmIcu2yw2+e8Q7OBTLj7gUXs=; b=gAMySmqUIQe7909ZLF
	P7ojeK73iML+j7zI5AAqZ0TZT8r7NIQaEaQyWeWUTrIMznglm88ST5pNCq5//yeU
	t9f/8Izu0GVlXTazzS+pJebzpmnxiyiu4fIvKvkRqGqHmfYLIk+rSIE6GaEFYCS5
	81f8mugAvthWGa4DixbEQxRsE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3X4Y5Fb9qzjnACQ--.20757S2;
	Fri, 02 Oct 2026 10:21:47 +0800 (CST)
From: wang wei <a929244872@163.com>
To: sashiko-bot@kernel.org
Cc: a929244872@163.com,
	bbrezillon@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sashiko-reviews@lists.linux.dev,
	vigneshr@ti.com,
	wenyou.yang@microchip.com,
	yamada.masahiro@socionext.com
Subject: Re:Re: [PATCH V2] drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
Date: Fri,  2 Oct 2026 10:21:43 +0800
Message-Id: <20261002022143.7226-1-a929244872@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001130036.44E271F000FF@smtp.kernel.org>
References: <20261001130036.44E271F000FF@smtp.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgD3X4Y5Fb9qzjnACQ--.20757S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrWkJrW8tw4kCrW5trWDArb_yoW5CF18pF
	ykJay8Cw4DGF9rArW29a15Cr1rJ3Wvya18CFWrA34F93Zxury2vw15t34Y9Fy7AanYvF12
	vrs3Zr95C3ZYy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUtOzsUUUUU=
X-Originating-IP: [240e:390:6a3:2fd0:6949:c003:e98d:1ea]
X-CM-SenderInfo: jdzsmjiuuylji6rwjhhfrp/xtbCwRvdhGq-FTtmoQAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_192226_355735_845D869C 
X-CRM114-Status: GOOD (  16.56  )
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


>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] mtd: nandsim: address cycle mismatch for 256 MiB / 4096-byte page devices
>--
>
>commit d11867536ecbb0d0243c052069d60f5f1a2c4afe
>Author: wang wei <a929244872@163.com>
>
>drivers/mtd: rawnand: nandsim: Fix stale NAND_ROW_ADDR_3 with overridesize
>
>The commit fixes a stale NAND_ROW_ADDR_3 flag by re-evaluating it after
>changing the size of the simulated device when using the overridesize
>parameter. It updates the flag based on the core logic: chip_shift -
>page_shift > 16.
>
>> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
>> index fe968037f75a2..ac82dd7e18a93 100644
>> --- a/drivers/mtd/nand/raw/nandsim.c
>> +++ b/drivers/mtd/nand/raw/nandsim.c
>> @@ -2359,6 +2359,11 @@ static int __init ns_init_module(void)
>>  		targetsize = nanddev_target_size(&chip->base);
>>  		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
>>  		chip->pagemask = (targetsize >> chip->page_shift) - 1;
>> +
>> +		if (chip->chip_shift - chip->page_shift > 16)
>> +			chip->options |= NAND_ROW_ADDR_3;
>> +		else
>> +			chip->options &= ~NAND_ROW_ADDR_3;
>
>[Severity: Medium]
>Does this logic conflict with the address byte expectation in ns_init()?
>
>For a 256 MiB device with 4096-byte pages, chip_shift - page_shift evaluates
>to 28 - 12 = 16. This causes the code here to clear NAND_ROW_ADDR_3, so the
>core emits 4 address bytes.
>
>However, ns_init() has hardcoded logic expecting 5 address bytes for devices
>larger than 128 MiB:
>
>drivers/mtd/nand/raw/nandsim.c:ns_init() {
>    ...
>		if (ns->geom.totsz <= (128 << 20)) {
>			ns->geom.pgaddrbytes  = 4;
>			ns->geom.secaddrbytes = 2;
>		} else {
>			ns->geom.pgaddrbytes  = 5;
>			ns->geom.secaddrbytes = 3;
>		}
>    ...
>}
>
>Will this mismatch stall the nandsim state machine and fail operations due to
>an address cycle mismatch?
>
>Prior to this change, shrinking a 512 MiB device to 256 MiB left the stale
>flag set, which serendipitously matched nandsim's expectation of 5 bytes.

You are right, thanks for catching this. Re-evaluating the flag alone
would regress 4 KiB-page devices overridden into the 128-256 MiB
range: the row address still fits in 16 bits there (pgnum <= 65536),
so the core would correctly drop the third byte while ns_init()
keeps expecting it -- the stale flag used to match ns_init()'s
expectation serendipitously.

The inconsistent side is actually ns_init(): the hardcoded 128 MiB
threshold encodes a 2 KiB-page assumption, while the core (and ONFI)
keys the third row cycle on the row address being wider than 16
bits, ie. more than 65536 pages, regardless of the page size. The
small-page branch (32 MiB of 512-byte pages = exactly 65536 pages)
already matches that rule.

v3 derives ns_init()'s expectation from the page count as well, so
both sides agree on every geometry:

-	if (ns->geom.totsz <= (128 << 20)) {
+	if (ns->geom.pgnum <= (1 << 16)) {


>
>>  	}
>>  
>>  	ret = ns_setup_wear_reporting(nsmtd);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
