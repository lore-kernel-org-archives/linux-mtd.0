Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7756EC433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 13:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24BE96103A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Nov 2021 13:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24BE96103A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Oth3cen+8RdBFF/HgHQjhJ5MX7Tykf3yIaXP+EeQM0=; b=tu+zdxn9Qg5oBQ
	mD9+QNeeTAQhhi/QFvKM0nfa8U7YksTP/8wMLR6SyO8wVxWMk2RR2PIqR+/CWPDCz5lT9w0/57sVm
	hu8rEcz3JXJVR2SRZGr+5q8j0eV0OkRBbvZbQs9QlVb3kfa2klvBAloCeWO354h9B/NkWbnDLfecS
	r/31J9FJYhEVTIFKHyV2d1XJjTLF9fEf8BUOxxFkOhr0lQ5KnrsDcIxGFUl8vh/8sq1zycJOsr84d
	T7ii82/OTG8Z8CPh9IBzDqj3hq29+keZc4IY2oDEkrkS3Ivp3WxD9NO4o5XZRHnEwsUSfPJumxMby
	afbR+H4lLJuHcrwboBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjiX0-00EPJN-Ct; Sun, 07 Nov 2021 13:48:22 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjiWv-00EPFq-1P
 for linux-mtd@lists.infradead.org; Sun, 07 Nov 2021 13:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636292865;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=0iOoYrlW0W1dhedF3b0qomHYAYJFS+pAzW9ZnnfcvEM=;
 b=PsCDzRfKVtGOtujmTnNxjNWxdh5si21K1/0L3pjFbeDOtzzbquY26IRSsHOlz+g33M
 m+4jZNzQkrBVcyMt81/av2wJIa+xcb9Mxo5SQQBUf4aXT4fiS0d7eLEzEQdxvnw/H3kP
 o+yXXw1rembp92Ue3DbQbSbvGNCjRVkmCs4rJtsuU6umJEtJL2GuffpiUwu5BbZctWDc
 AEO2lok8oa3eI06aG0SsaY2lHi0A0iNB3lGMlgNfcR8TGTxi+Mw+pmuEDkmdQFEhz4sA
 SBLsBH1dRqYramJpqMvQyFDNnXYiDnX5SSxFVTX3I+Xos20aOhM8GATKkWSBTLStXd4M
 Brhw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7gpw91N5y2S3jcR+"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.34.1 DYNA|AUTH)
 with ESMTPSA id 902c63xA7DliFoQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Sun, 7 Nov 2021 14:47:44 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 0/3] mtd: Ingenic NAND fix for JZ4740
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20211009184952.24591-1-paul@crapouillou.net>
Date: Sun, 7 Nov 2021 14:47:43 +0100
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, list@opendingux.net,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mips <linux-mips@vger.kernel.org>,
 Riccardo Mottola <riccardo.mottola@libero.it>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Paul Boddie <paul@boddie.org.uk>
Message-Id: <968356A9-2A88-48B1-B31F-55C22BCE620E@goldelico.com>
References: <20211009184952.24591-1-paul@crapouillou.net>
To: Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_054817_283482_B13F9B5F 
X-CRM114-Status: GOOD (  18.05  )
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

Hi Paul,

> Am 09.10.2021 um 20:49 schrieb Paul Cercueil <paul@crapouillou.net>:
> 
> Hi,
> 
> Looks like NAND support has been broken on the JZ4740 SoC for a while;

Yes, I remember someone telling that something was fundamentally broken
and impossible to be fixed a while ago.

> it looks like it comes from the fact that the "hw_oob_first" mechanism
> was dropped from the NAND core and moved to the Davinci driver.
> 
> It turns out the JZ4740 SoC needs it too; I didn't notice it when
> writing the new ingenic-nand driver (to replace the old jz4740-nand
> driver) most likely because my Device Tree had the "nand-ecc-mode" set
> to "hw_oob_first".
> 
> I am not very sure about patch [1/3]; to me the original code does not
> make sense, and it didn't work out-of-the-box on the JZ4740 without it.
> By applying patch [1/3] the function nand_read_page_hwecc_oob_first()
> can be reused for the JZ4740 SoC as well. But I did not test patch [1/3]
> on Davinci.

would this also work for jz4780 NAND?

BR,
Nikolaus


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
