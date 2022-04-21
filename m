Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD656C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 21:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmUwC+nQRUlXLq08iEWkFCCFKRKxfXdg1iNSUZmD7zw=; b=jCVzKZf7infe5IC3IUweMHxOgJ
	kna0OnVweWx1yzSEM+nvUz8jGmOnwNT6saUzWOhf9v3piNQEvL1rlSX5LI8yQh5YrYM9FsmZwKrzH
	VXzoVhSqo0biBDJUjpCPK3BzHTWA1K6xHIOqefzUDKOLQw5uyVBR6bBD6b+hwXYjQ9SaQ+fsWofvm
	vuH2FhKYVRw3sDUEY2iwFxMoFAOOSdLQvRC33IRDYVO8annGyUy3G+AgusoBzvwhibyY5kNKJaoMi
	HLpICnaGFMeKZ1O7bA3PMCza4XGyXCz2xVt2maU3k+3MO5o5BGA3hV2f7KEenKN67Q/2CtGNGnyEy
	JNyZuHgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhefD-00F6aR-91; Thu, 21 Apr 2022 21:48:35 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhef9-00F6ZI-TH
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 21:48:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D0106221D4;
 Thu, 21 Apr 2022 23:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650577708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pwtletygDsJ+anOkVF0MdbWI7gPYL0brXB0zgaC73Fs=;
 b=tdxjoNuk5SVel4el0Pw2GsYvKS0keifuPS4XEjKm6k10FpVcUjM4k4cvvCxuZaFM52YXLh
 tJXqJnH6tebvin+VZcXvz3K034+za6PLB5wmG905U6SBX+eMPHG83f0vLz/b0v+zs6SelJ
 kpHBxFKIkYNCpWNSUPE4tVD/5Eh314c=
MIME-Version: 1.0
Date: Thu, 21 Apr 2022 23:48:27 +0200
From: Michael Walle <michael@walle.cc>
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_asutoshd@quicinc.com,
 quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
 quic_sartgarg@quicinc.com, quic_nitirawa@quicinc.com,
 quic_sayalil@quicinc.com
Subject: Re: [PATCH V8] mtd: spi-nor: winbond: add support for W25Q512NW-IM
In-Reply-To: <1648191975-1366-1-git-send-email-quic_c_sbhanu@quicinc.com>
References: <1648191975-1366-1-git-send-email-quic_c_sbhanu@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <9f9fcf2fcf9da3f1aa698892b5c7dfab@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_144832_136599_BCEB17B2 
X-CRM114-Status: UNSURE (   4.90  )
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

Am 2022-03-25 08:06, schrieb Shaik Sajida Bhanu:

> 0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
> 0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
> 0000020 6800 6c65 6f6c 7720 726f 646c ffff ffff
> 0000030 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
> 0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
> 00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
> 00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
> 00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
> 00000d0 0aff fff0 ff21 ffdc
> 00000d8

00000000  53 46 44 50 06 01 01 ff  00 06 01 10 80 00 00 ff  
|SFDP............|
00000010  84 00 01 02 d0 00 00 ff  ff ff ff ff ff ff ff ff  
|................|
00000020  00 68 65 6c 6c 6f 20 77  6f 72 6c 64 ff ff ff ff  |.hello 
world....|
00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
*
00000080  e5 20 fb ff ff ff ff 1f  44 eb 08 6b 08 3b 42 bb  |. 
......D..k.;B.|
00000090  fe ff ff ff ff ff 00 00  ff ff 40 eb 0c 20 0f 52  
|..........@.. .R|
000000a0  10 d8 00 00 33 02 a6 00  81 e7 14 d9 e9 63 76 33  
|....3........cv3|
000000b0  7a 75 7a 75 f7 bd d5 5c  19 f7 5d ff e9 70 f9 a5  
|zuzu...\..]..p..|
000000c0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
000000d0  ff 0a f0 ff 21 ff dc ff                           |....!...|

Hello World!

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
