Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B08C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:08:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3888613CD
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3888613CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n4fqZ1/Cmy+VQl0yQ9DnjYxAp4M1xitMT3H/JNIHULw=; b=fKOu1US3UIvXk77gWJ5CTqJOV
	c7C+CUAfvK3vFBASZZpgaWrCk9Lgp6BNaIdXh0MA29n688iDbEgBpQq3uPsg85h6RQNByiJXxKFln
	Iimj0jeDw2wkW8oh6rahmuER8zL34nZ23vFRFPPDRzed54NFgqc4K5bEwUUZoHuEOZtaTYV/W6TBR
	9iDG+BR6zGimy/8JlmoSFLpDVM4cVSWwbp+6Anjg9RstmTAhT65XFyaUfZQvnauKbKjBuKhAhJUya
	WiecP08Bf/wDPNyMfU4v+qS63TkLgVwskXl9j3vOD1Jv0sZO8S5ACWQMmoOPyMWLQRehNWMHO1nfz
	tqUkh89Tw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2pO-00DsPU-RJ; Mon, 10 May 2021 10:07:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2kB-00DrHH-VL
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=qVvkhfdwZIIC5NM4dyQI7OLAYxvzznjiNASvYSFr7e0=; b=lDoz1rRgeR4BDmK5h+W3lW737P
 NYaM1pnM2kGLmfP7v3IVaAteXPpt+KlZugvBZfGqxrUCT3I9880ts9K9hR3YY69QEFHqTxIfv4wTx
 rbyzlUpDuGxWx+JT4ufCy0SSjmbFHkeHDOuzMux1TgmFXEhra5Pu7mr8tqDdv7HjyWC7p4kkG3MHk
 ChLYeGWVQ7ez5UWP2pqfgS9hircRO9xlK/QLgtrIUhAh28lBq2ISNjjPcel1bIkbjvstAtzC04fGe
 35aPV3USXbcHE/66KiG2mDSEh464X4SRSyZPhgrvYC8AwoBHgEX//1sEiX0pwP4EcaaqmRT0qkxBz
 w9XRWH3Q==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2k8-008VPR-Rx
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:02:30 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 70102240012;
 Mon, 10 May 2021 10:02:22 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4] dt-bindings: mtd: brcm,
 brcmnand: convert to the json-schema
Date: Mon, 10 May 2021 12:02:21 +0200
Message-Id: <20210510100221.6737-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210423050536.29504-1-zajec5@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'27736ddd24cb99b9bef2b36b42381eb41da15958'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_030229_066197_68FBC88E 
X-CRM114-Status: UNSURE (   9.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIxLTA0LTIzIGF0IDA1OjA1OjM2IFVUQywgPT91dGYtOD9iP1VtRm1ZY1dDSUUx
cHhZSmxZMnRwPz0gd3JvdGU6Cj4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tp
LnBsPgo+IAo+IFRoaXMgaGVscHMgdmFsaWRhdGluZyBEVFMgZmlsZXMuCj4gCj4gQ2hhbmdlcyB0
aGF0IHJlcXVpcmUgbWVudGlvbmluZzoKPiAxLiBQcm9wZXJ0eSAiY2xvY2siIHdhcyByZW5hbWVk
IHRvICJjbG9ja3MiCj4gMi4gRHVwbGljYXRlZCBwcm9wZXJ0aWVzIChkZWZpbmVkIGluIG5hbmQt
Y29udHJvbGxlci55YW1sKSB3ZXJlIGRyb3BwZWQKPiAzLiBDb21wYXRpYmxlICJicmNtLG5hbmQt
YmNtNjMxNjgiIHdhcyBhZGRlZAo+IDQuIFNvQyBzcGVjaWZpYyAiY29tcGF0aWJsZSIgY2FzZXMg
Z290IGxpbWl0ZWQgY29udHJvbGxlciB2ZXJzaW9ucwo+IAo+IEV4YW1wbGVzIGNoYW5nZXM6Cj4g
MS4gTm9kZXMgIm5hbmQiIHdlcmUgcmVuYW1lZCB0byAibmFuZC1jb250cm9sbGVyIgo+IDIuIE5v
ZGVzICJuYW5kY3MiIHdlcmUgcmVuYW1lZCB0byAibmFuZCIKPiAzLiBEcm9wcGVkIHBhcnRpdGlv
bnMgYXMgdGhleSB3ZXJlIHVzaW5nIG9sZCBzeW50YXggYW5kIGFyZSB3ZWxsCj4gICAgZG9jdW1l
bnRlZCBlbHNld2hlcmUgYW55d2F5Cj4gCj4gVGhpcyByZXdyaXR0ZW4gYmluZGluZyB2YWxpZGF0
ZXMgY2xlYW5seSB1c2luZyB0aGUgImR0X2JpbmRpbmdfY2hlY2siLgo+IFNvbWUgTGludXggc3Rv
cmVkIERUUyBmaWxlcyB3aWxsIHJlcXVpcmUgdXBkYXRpbmcgdG8gbWFrZSAiZHRic19jaGVjayIK
PiBoYXBweS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IEJyaWFuIE5vcnJpcyA8Y29tcHV0ZXJzZm9ycGVhY2VAZ21haWwuY29tPgoKQXBw
bGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9t
dGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKTWlxdWVsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
