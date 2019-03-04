Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0420C4360F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 08:44:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B7A20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 08:44:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKOsa0Mq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B7A20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bR/bRX/C1Df8kqvT2+HgG7CWGO5FnmERRhrpkVeIXC0=; b=NKOsa0MqGP0+32
	R3w9zTZWZO+qpFKI6SF4SGrFUE54W7/DBh9FSxSsZ0xk+CwVaWdsXqek0663gt2ObFEjIRXIZ3RkS
	9RE9fsvu1kJmHCKWv13vglLvgaawmXanS5c7xmSvCy7IuyUoRZ+ALiU2Z1SjQ0ewK+UDkTWTNuVOQ
	ISs3rGGjtwvQawdRRAvzfBhtx1FXjA+eLg4sKajGPPSycZipvhIs/SRdgRBX3qchlA7e2St6US+Jn
	1Ed79XNei/Y+MZkPMCkO3no5eDWsm9Hk7dJoXlD81wX6RnYE2OUPbF2wEq4bprH8reoStsm3g/Uzg
	RkR1nUf6nAjZ2BFE7azg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0jCh-0006Ex-Jr; Mon, 04 Mar 2019 08:44:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0jCd-0006Db-VX
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2019 08:44:05 +0000
X-Originating-IP: 90.88.147.150
Received: from xps13 (aaubervilliers-681-1-27-150.w90-88.abo.wanadoo.fr
 [90.88.147.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CDF63FF807;
 Mon,  4 Mar 2019 08:43:48 +0000 (UTC)
Date: Mon, 4 Mar 2019 09:43:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2 05/10] mtd: rawnand: denali: use more precise timeout
 for NAND_OP_WAITRDT_INSTR
Message-ID: <20190304094346.3b62e6cd@xps13>
In-Reply-To: <1549955582-30346-6-git-send-email-yamada.masahiro@socionext.com>
References: <1549955582-30346-1-git-send-email-yamada.masahiro@socionext.com>
 <1549955582-30346-6-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_004404_161687_2C020595 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIEZlYgoyMDE5IDE2OjEyOjU3ICswOTAwOgoKPiBDdXJyZW50
bHksIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpIGlzIGFsd2F5cyBwYXNzZWQgaW4gdGhl
Cj4gaGFyZC1jb2RlZCBtc2VjX3RvX2ppZmZpZXMoMTAwMCkuIFRoZXJlIGlzIG5vIHNwZWNpZmlj
IHJlYXNvbiBmb3IKPiAxMDAwIG1zZWMsIGJ1dCBpdCB3YXMgY2hvc2VuIHRvIGJlIGxvbmcgZW5v
dWdoLgo+IAo+IFdpdGggdGhlIGV4ZWNfb3AoKSBjb252ZXJzaW9uLCBOQU5EX09QX1dBSVRSRFlf
SU5TVFIgcHJvdmlkZXMgbW9yZQo+IHByZWNpc2UgdGltZW91dCB2YWx1ZSwgZGVwZW5kaW5nIG9u
IHRoZSBwcmVjZWRpbmcgY29tbWFuZC4gTGV0J3MgdXNlCj4gaXQgKCsgMTAwIG1zZWMpIHRvIGJh
aWwgb3V0IGVhcmxpZXIgaW4gZXJyb3IgY2FzZS4gVGhlIDEwMCBtc2VjIGV4dHJhCj4gaXMgaW4g
Y2FzZSB0aGUgaGVhdnkgbG9hZCBvbiB0aGUgc3lzdGVtLgo+IAo+IEkgYW0gc3RpbGwga2VlcGlu
ZyB0aGUgaGFyZC1jb2RlZCB2YWx1ZXMgZm9yIG90aGVyIGhpZ2hlciBsZXZlbCBob29rcwo+IHN1
Y2ggYXMgcGFnZV9yZWFkLCBwYWdlX3dyaXRlLCBldGMuIFdlIGtub3cgdGhlIHZhbHVlIG9mIHRS
LCB0UFJPRywgYnV0Cj4gd2UgaGF2ZSB1bmtub3dsZWRnZSBhYm91dCB0aGUgZGF0YSB0cmFuc2Zl
ciBzcGVlZCBvZiB0aGUgRE1BIGVuZ2luZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZ
YW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgoKSSByZWFsbHkgYW0gbm90IGNv
bnZpbmNlZCBieSB0aGlzIGNoYW5nZS4gUGxlYXNlIGp1c3QgZGVmaW5lIGEgdGltZW91dApiaWcg
ZW5vdWdoIGZvciBtb3N0IGNhc2VzICgxMDAwIGlzIG9rYXkpIGFuZCB1c2UgaXQgc3lzdGVtYXRp
Y2FsbHkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
