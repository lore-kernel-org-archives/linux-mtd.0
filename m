Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8BEC87FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 21:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOvJtsH0BZbIgnhrzDllbqmRoC56XUrUwsUCXu/qvC0=; b=yj2lc3T5MJBV5n
	YRr9z7M+3P4GvtjhBvuBd8Dv0Va6O1sbymkCtyPsswXnXrkox3te8hIKK/chfPa2Ojg9T0iTEX/OU
	33viA9j6ZNnMi8uqxBlGb8ytOzlAlyecPwZsWFVjD/p1yaVQb5J7AFvmjFhdBNdX+XuhLPHWbYWun
	SNnbHRpWkMc9rVrRGwmfTLg/6jpisVSiX0m4rNOXJIuoxdiLaEJO3tEAE3gr0fnM4zxGvDqC/p+tw
	TI3AuByIk7IMjVQNRLY9gBf8n/mYjylX4T/f/vthd05uy9l/YgmEide8qGEotmIDBA0TjPJ9Ylym5
	GmBe6+kuFqReTHGM0/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk85u-00000001Yuj-1spE;
	Thu, 07 Aug 2025 21:24:14 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk85r-00000001Yu7-0FTz
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 21:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1754601823; x=1755206623;
	i=markus.stockhausen@gmx.de;
	bh=yzhZJabjbfKgzMAhVoq0Ca9M6AhqzRGWdkFWGDruLBw=;
	h=X-UI-Sender-Class:From:To:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FTs1U8C+nt0+pHsvEpAJJnv/dB3QOy/2ENrNRj2XP2KUnW5vU6JSct7eWaBXXSfL
	 eOP+Xze+n7uKsq/dxtJ4OAqmT7WAPOfQPSdAxJS4pNQJaaBMSfrr67oWt216AmLcB
	 oKJi+1b/P4625YgROIBXphslIC32GHrK39/ZWHw6cuBIOsHiE69OogoE+wrNtv+cQ
	 w4bC6ZGVG73UTG8PhmAFTgaG2DND6Vs23pUmqvBC4mgU0fpFQYFUwbOg8KFG5uCo1
	 vZXNRVvb6jVORWLhpVrg8qgCSd6RDYarS6tMwTmpg66UTyAKIDc71eAE+oOADNx2F
	 +oPrmt1y9M42weiSXw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from colnote55 ([94.31.70.55]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhlV-1us8yW1k63-00BJTc; Thu, 07
 Aug 2025 23:23:43 +0200
From: <markus.stockhausen@gmx.de>
To: "'Chris Packham'" <Chris.Packham@alliedtelesis.co.nz>,
	<miquel.raynal@bootlin.com>,
	<vigneshr@ti.com>,
	<richard@nod.at>,
	<tudor.ambarus@linaro.org>,
	<linux-mtd@lists.infradead.org>
References: <118501dc07ae$3f6379a0$be2a6ce0$@gmx.de> <2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>
In-Reply-To: <2537e2a1-f958-4e9c-b346-b4fac2152a47@alliedtelesis.co.nz>
Subject: AW: NAND ECC errors
Date: Thu, 7 Aug 2025 23:23:41 +0200
Message-ID: <034f01dc07e1$8dd75dd0$a9861970$@gmx.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJ9JeHYku6FmVG1oRkuWaRQXLF5+AF1njpmswnHzYA=
Content-Language: de
X-Provags-ID: V03:K1:bD9hVefWvDxJivUi//Sm3yTRj6out+dyEhzMBPLt1+JZZaA1duD
 +RoPCk0cuXHhv2sHAluHRQCdj8YqG3C7HpcgA/3NVzq1Vv3OnAM5E8UyrdblTU8Wny3gnLN
 Hf0pVtXyB7fs83qGnJSAoP58xsWYpDLz+d72i3R0mZouy+vSf/qtaIlrX5N4K5r5sJpbESu
 kDzel2PRn4x6x32aMxFMg==
UI-OutboundReport: notjunk:1;M01:P0:1ZUnlq3Gl5E=;td1MDQQRG5B3WgZk8dquOf1l1V9
 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
 HBgS7IA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_142411_386104_45CD876E 
X-CRM114-Status: GOOD (  11.63  )
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

> Anyone good ideas what to do first from here?
>
> Probably depends. Blanking the NAND chip and reformatting it will 
> resolve the errors from and upstream point of view. That's obviously not 
> really going to be something you want to do if you expect to swap back 
> and forth between the stock firmware and an upstream kernel.
>
> You'll probably want to convince the mtd code to allow the on-die ECC to 
> be disabled and find whatever software BCH settings are needed that work 
> with the stock firmware. Then we could maybe look at using the ECC 
> controller to accelerate that.

Good direction. So assumption is: 
- vendor wrote BCH6 into OOB 
- This design is also active in his firmware (with Realtek ECC engine)
- now we read data with upstream kernel and on-die ECC
- Each read produces an on-die ECC error
- As soon as we write new data on-die ECC will be created 

But where is the ECC knob in between spi-realtek-nand, mtd and ubi?



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
