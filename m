Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A92BC4361B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 15:57:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495CC22509
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 15:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 495CC22509
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TVdtRlXbFHcDWoRd1VXh2lq3N78YRaQwdM0Tra8/9ZU=; b=ee96AyasHq+TgukCLlI6nQh3q
	GA3wb8oQezX6bDHPcf1ShT0oYxIGw76UBvavVR5cWLkp2lER06YOc0H9BVWREZctN396jQKdzMbFy
	HiyH0jhsjAJykThA2pLzGuE0DZR6pqZbuusnkSR0/rGqMDeUOmuVN1kxnSLV9aD1luVHFcj2/e9Cp
	nxXv8MQH8aywQ41BWA8GV/M/1nhx5a5mjgoRX4TYA4PEZfgNQzBWBRw6M/ilO3/i2j8g6RpXFiI/3
	4yYfWvdoRq25OU6n8eRVFDf1Bh3mPdQV1FiyJymZe5V04OcAhWXKQ0hJRJZ1/2xYUICeJhSDR1CrG
	HnhbNejPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpCgu-0004XA-K1; Tue, 15 Dec 2020 15:56:44 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpCgr-0004V0-2M
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 15:56:41 +0000
Received: from xps13 (lfbn-tou-1-1326-205.w90-89.abo.wanadoo.fr
 [90.89.139.205]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7417B200015;
 Tue, 15 Dec 2020 15:56:37 +0000 (UTC)
Date: Tue, 15 Dec 2020 16:56:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Schaefer <david.tillmann.schaefer@gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
Message-ID: <20201215165636.41d69087@xps13>
In-Reply-To: <CAK+FTGhhFCVM4wazP5epp9E9kPf7=iAYRCmwZECXmszBmRERzw@mail.gmail.com>
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
 <CAK+FTGhhFCVM4wazP5epp9E9kPf7=iAYRCmwZECXmszBmRERzw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_105641_214706_2D233112 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRGF2aWQsCgpEYXZpZCBTY2hhZWZlciA8ZGF2aWQudGlsbG1hbm4uc2NoYWVmZXJAZ21haWwu
Y29tPiB3cm90ZSBvbiBUdWUsIDE1IERlYwoyMDIwIDE2OjUwOjM0ICswMTAwOgoKPiBXZWxsLCBJ
IG5vdyB3YXMgYnJhdmUgZW5vdWdoIHRvIHRyeSB0byB3cml0ZSB0byB0aGUgYmxvY2sgZGV2aWNl
cyB3aXRoCj4gdGhlIGxhc3Qga2VybmVsIGFuZCBpdCBmYWlsZWQsIGlvIGVycm9yLgoKSSBzYXcg
c3VjY2Vzc2Z1bCBsb2dzIGluIHlvdXIgcHJldmlvdXMgZS1tYWlsLiBXYXMgSSBtaXN1bmRlcnN0
YW5kaW5nCnNvbWV0aGluZz8KCkFsc28gdGhlcmUgaXMgYWJzb2x1dGVseSBub3RoaW5nIHdlIGNh
biBkbyB3aXRob3V0IHRoZSBsb2dzIChpbmNsdWRpbmcKYm9vdCkuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
