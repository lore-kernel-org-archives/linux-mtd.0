Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED208C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 16:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF3986105A
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 16:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF3986105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kubicz.engineer
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=cg3For6iGrXx7UDtvECqtOlKARs3pjrjOqlrOBL7Cy0=; b=OlO
	ZsNLGHAhuTYOpAj/BwG/3gUJUy37LeFEAmRSAKp99VrGc+NmLlgaL4iB9vGf9Gb0vjjzZbOcqUL7A
	/Rl0+EApooXivHWNkxPDZo5DDou9XnV8c48Gri4TMabZDvXdgmHF+tcfZDgPPlzWXNJyKTjnV5AhP
	o7+G8g79PJZi5r90txKmViJ/6cOAh3HVdpgsw2n8x+lUvywX6WZBS+p3peg6rC0zB07I5uI55cnHm
	5f7LleAlrQOv9bDK7OPtJngJHHh6ptsswrYMU03NBLdB1CV2IhwvNC9loz3tYp5Ylk9mfEPORguzY
	5PO103Sbz2KO8Tcty8SYEe1P5i3BrJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mON7J-00AMlB-VL; Thu, 09 Sep 2021 16:41:38 +0000
Received: from sender4-of-o51.zoho.com ([136.143.188.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mON7F-00AMk1-7p
 for linux-mtd@lists.infradead.org; Thu, 09 Sep 2021 16:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1631205691; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k6k/9BwUCZ3w5LBXWfrOUcYNaKfcbH6TTc0HBZEWr5IO5B0wc0WWEWUQUVS0R3WbZ6AdKzBJhUwbyI86qdg1kgG4AloE2VuclcJLz4WRgezvmcwIiaN+XijDTJzyV+Gcdu0OtzQ/e+qGxgxNE4Tg6MjhVU3OFdro+IQ+hqvF9Fc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1631205691;
 h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=kIHsT2IAiQUEIqPFDHTJ11rIRMxwqenbMmVLIx8Je7Q=; 
 b=G/p7kbnCKwMEU6Q1Oo0psgHKd7KhlepeUAgUQEj15bUyng6WWOD/+kcCCAt/PqW+kG0EfpHkmCcMPuYMBPQwTBCJksZPVoujjGFJaTadU2xshzjER7VQ22HhoCxdxbL0/XNMHpMhIkDLxxGVFWgF36KoFojIRrVevsEX94/95co=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=kubicz.engineer;
 spf=pass  smtp.mailfrom=filip@kubicz.engineer;
 dmarc=pass header.from=<filip@kubicz.engineer>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631205691; 
 s=zoho; d=kubicz.engineer; i=filip@kubicz.engineer;
 h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=kIHsT2IAiQUEIqPFDHTJ11rIRMxwqenbMmVLIx8Je7Q=;
 b=B2jy87U9CZvtG/9EGEV0nnQoQaxrxb0Gz656fd+lahLUpNKygTBC5jVfGhLWBfLG
 wMug//t3+EyrLVRjfNzpf0jEyhgAz5qD6U1B7j8GqEvL2B6UYN42RJBRjkMTZwVMgHx
 scf6uvd8VWM+/gqsi+R3XghzC5JWVNENDn/OM778=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1631205684137463.7319730030856;
 Thu, 9 Sep 2021 09:41:24 -0700 (PDT)
Date: Thu, 09 Sep 2021 18:41:24 +0200
From: Filip Kubicz <filip@kubicz.engineer>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Message-ID: <17bcb6f7393.103451039732021.7530952965250426754@kubicz.engineer>
In-Reply-To: 
Subject: MLC NAND support in ubifs
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_094133_379208_CC12585E 
X-CRM114-Status: GOOD (  12.17  )
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

Hi!

I would like to ask about MLC NAND support in UBIFS.

I was recently bringing up a device with IMX6ULL and raw MLC NAND flash. I have built Linux 5.4 kernel, u-boot and rootfs (using buildroot), flashed them to my device with MLC NAND flash, and learned from dmesg error that MLC is unsupported by ubifs. Support removed in this commit: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b5094b7f135be

Then I followed the story from Richard and Boris and watched the talk where they explain the issues with MLC, and propose an alternative: https://www.youtube.com/watch?v=9j2pOIiJqYw&ab_channel=TheLinuxFoundation
Alternative available since Linux 5.8: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.8-NAND-MLC-SLC-Emulate

My questions:
1. Is NAND MLC (+ubifs) reliable to use with SLC emulate mode introduced in kernel 5.8? Or should I rather switch to eMMC for this design? SLC NAND is too costly at my required size.

2. If the MLC NAND is not supported, can you update these pages:
- http://www.linux-mtd.infradead.org/doc/ubifs.html
- https://www.kernel.org/doc/html/latest/filesystems/ubifs.html
- http://www.linux-mtd.infradead.org/faq/ubifs.html
Each of the documentation pages mention MLC, so you can get an idea that it is supported. But it looks like the MLC NAND flash is not supported by UBIFS.

Kind regards,
Filip Kubicz

filip@kubicz.engineer
tel. (+48) 697 088 078




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
