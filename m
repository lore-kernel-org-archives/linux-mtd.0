Return-Path: <SRS0=5gbO=SZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD30C282DD
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 16:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E295121773
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Apr 2019 16:33:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WSNJOu5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E295121773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pF3f82rIHmu5y/091dTDarRHoq3PaYFbhlYM9T9ckoY=; b=WSNJOu5JC+DMJg
	+SGuBSY+1cdL+cDuZfAnCcniMwYzzGLc60Ite7sKkX4QCMfENt9PbsYnY8SBxlurLBj2ahFP9Z5A0
	gvg3knfPmRNXnJ0WOPoo1BoI9NhK3sUKE/SQkozYb3MoIsnM574LmVjdsjRdYTnG+dtLpdIo+qcsZ
	h5Y1gEgtgTJUszoOt/2mA6k1o1TcJxXEIb96HcJJ6XBFAl6FchSoM5H+bHKcTFxtA075B9aBKzJvB
	egSo8H+v/yQsdEa2pQSFBK68dzYeR9jk3S4p3Pzcp98C5Bzel11jf0IsEkPDMvP8Td1RR6s0kbU9B
	RisgbWLdW7s2RqRtV6Uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIyMV-0004ll-D8; Tue, 23 Apr 2019 16:33:39 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIyMS-0004kZ-NU
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2019 16:33:38 +0000
Received: from JKLETSKY-MBP15.local (184-23-190-250.vpn.dynamic.sonic.net
 [184.23.190.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 7E63D21B35;
 Tue, 23 Apr 2019 09:33:05 -0700 (PDT)
To: linux-mtd@lists.infradead.org
From: Jeff Kletsky <lede@allycomm.com>
Subject: spi-nand: GigaDevices Support; qca9560-spi Device-ID Byte-Shift
 Inconsistency
Message-ID: <5d6f2392-ac70-3192-bc16-ab3f7a88ca04@allycomm.com>
Date: Tue, 23 Apr 2019 09:33:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_093336_759704_66FB77E7 
X-CRM114-Status: GOOD (  15.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

I'm in the process of trying to use the spi-nand framework present in
Linux 4.19 with a QCA9563-based device that appears to use a
GigaDevices GD5F1GQ4UFxxG SPI NAND (GL.iNet AR750S) on the ath79 platform.

I've backported the two commits[1] I found on Linux 5.x related to the
GigaDevices SPI NAND but have two questions that I haven't been able
to resolve with only that single device in hand.


---


The first is that, at least with the SPI driver used by the QCA9563 on
that platform (`compatible = "qca,qca9560-spi", "qca,ar7100-spi";`)[2],
is that the results of the Read ID does not seem to need the byte
shift in `gigadevice.c`

    /*
     * For GD NANDs, There is an address byte needed to shift in before IDs
     * are read out, so the first byte in raw_id is dummy.
     */

`spi-nand spi0.1: unknown raw ID c8b148c8` is seen in dmesg. I have
confirmed the byte order. `c8:b1:48` matches the signature shown on
the datasheet[3] in Table 10-1 for the GD5F1GQ4UFxxG, without the byte
shift. Yes, I will need to implement the `b1` device variant, but
`gigadevice.c` is being short-circuted as `b1` is being checked
against the manufacturer's code, not `c8`.

While I can locally "hack" the code to not perform the byte shift, I
can't determine the extent of devices/drivers.

I did find a post to this list in February, 2017[4] that includes

   /*
    * read ID command format might be different for different manufactory
    * such as, Micron SPI NAND need extra one dummy byte after perform
    * read ID command but Giga device don't need.
[...]

so that this may have come up before.

Any additional information on this would be appreciated.


---


The second question relates to enabling the use of the GD5FxGQ4FxxG
series. It appears that I will need to implement

   _ooblayout_ecc()
   _ooblayout_free()

and the like. Though I've read through both the F-series data sheet[3]
as well as the E-series data sheet[5], it's not clear to me where the
ooblayout comes from.

Is this an implementation decision for Linux, or is there a section of
the two datasheets that could assist me in proper implementation of
the layout for the GD5F1GQ4UFxxG series?


(Information for _ecc_get_status() appears to be in the data sheet.)


Thanks,

Jeff




[1] linux$ git log --pretty=oneline -- drivers/mtd/nand/spi/gigadevice.c
c40c7a990a46 mtd: spinand: Add support for GigaDevice GD5F1GQ4UExxG
c93c613214ac mtd: spinand: add support for GigaDevice GD5FxGQ4xA

[2] ath79/dts/qca956x.dtsi

[3] <http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/>

[4] <http://lists.infradead.org/pipermail/linux-mtd/2017-February/072308.html>

[5] <http://www.gigadevice.com/datasheet/gd5f1gq4xexxg/>





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
