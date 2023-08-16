Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C62C001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 13:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J10tecAQqTjNKK+H9PD8TU9xjhlJRL4zbqT9qYiHRfE=; b=AeY9++KHW9lrk7
	/gAGBWJRabWdCzGWcu4mDkp7GCmVrepKXYMhtVe7bdVzJsselvtfX0vUQYSdtScygMi5uZJyLj0Ui
	QNxVy8lk4iOJCX6G+but/6BxGfzwUHddy4fouCX9lj33sPPYFWNAa4ppkmxaTv69jx6QM59S2X9iG
	/fUcFV6k5dF5TinBIUmQ/cjI07kdgjlSE97RXywx1c+J2fpa/QpUopsRXRh+LnJjnXUhMr08QBWU5
	fvi5oae4gJx7paVNU4sBzQR5QbL5o+2fHd1Dm9j5b/Hay1DzXR0U7ahm3qhfS0tNvo1RoXhb2fKad
	IicRpCe434niKzf0eSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWGSA-004G5l-2a;
	Wed, 16 Aug 2023 13:20:50 +0000
Received: from soggy.cloud ([2a01:7e00:e000:151::1] helo=iam.tj)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWGS7-004G1M-03
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 13:20:49 +0000
Received: from [IPV6:2a01:7e00:e001:ee80:145d:5eff:feb1:1df1] (unknown [IPv6:2a01:7e00:e001:ee80:145d:5eff:feb1:1df1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	by iam.tj (Postfix) with ESMTPSA id 7288C347B9
	for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 14:13:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=iam.tj; s=2019;
	t=1692191628; bh=BlCwEQpBwpD65fqcqNcRLwluHof01vT+97XTsyHqH6w=;
	h=Date:From:Subject:To:From;
	b=XUQHTXN+jr1oFzxde8FKmvFgjf8PYAz6hhJAaZ/pQI95Dh8KpSRvJMJUq8WbhttjN
	 Ft8E0SR7U5gnNwNQhnTstHnx7tp8FQ0T+F9f8J/PX962rzv9I20TNf4Wm8rtQBbCNE
	 DfNO/4+aKz2ekibnzsg6lSbQER/AkBgdzqXlLVdTPwFRxYM7dAOudpjxK9xrpxqlB9
	 vr7jFCtdQwwDXdB6pD2wI5IrG/xPfNpepaLXRPkLCJL2MrUXXmpbq4uq+xX4TB+h3k
	 sxSIiG8OjdR9MlxW+8ZUi93YfGncJLoPLgJdAsf+4fUzg+5cDRaJfVYanfPHy8fB4Y
	 0FocgXNFT/hHA==
Message-ID: <5fc2f8f3-b420-6f16-43a0-fae4e619108f@iam.tj>
Date: Wed, 16 Aug 2023 14:13:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Tj <linux@iam.tj>
Subject: [PATCH] mtd: pcmcia: add ID for SEIKO EPSON LWB257SX20 256KB RAM
 device
Content-Language: en-GB
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_062047_244949_1716502A 
X-CRM114-Status: UNSURE (   9.89  )
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

This card is used in some spectrum analysers and prior to this commit
could not be accessed by Linux but could by MS Windows. Usually contains
a FAT12 file-system.

It is a RAM device so needs:

options pcmciamtd mem_type=1

root@debian:/tmp# lsmtd
DEVICE MAJ:MIN NAME                     TYPE SIZE
mtd0    90:0   SEIKO EPSON LWB257SX20   ram  256K

Signed-off-by: Tj <linux@iam.tj>
---
  drivers/mtd/maps/pcmciamtd.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/pcmciamtd.c b/drivers/mtd/maps/pcmciamtd.c
index 2ac79e1cedd94..330b5be5c7e06 100644
--- a/drivers/mtd/maps/pcmciamtd.c
+++ b/drivers/mtd/maps/pcmciamtd.c
@@ -702,6 +702,7 @@ static const struct pcmcia_device_id pcmciamtd_ids[] = {
  	PCMCIA_DEVICE_PROD_ID12("PRETEC", "  4MB SRAM CARD", 0xebf91155, 0x20b6bf17),
  	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB101EN20", 0xf9876baf, 0xad0b207b),
  	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "WWB513EN20", 0xf9876baf, 0xe8d884ad),
+	PCMCIA_DEVICE_PROD_ID12("SEIKO EPSON", "LWB257SX20", 0xf9876baf, 0xf1f9f36b),
  	PCMCIA_DEVICE_PROD_ID12("SMART Modular Technologies", " 4MB FLASH Card", 0x96fd8277, 0x737a5b05),
  	PCMCIA_DEVICE_PROD_ID12("Starfish, Inc.", "REX-3000", 0x05ddca47, 0xe7d67bca),
  	PCMCIA_DEVICE_PROD_ID12("Starfish, Inc.", "REX-4100", 0x05ddca47, 0x7bc32944),
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
