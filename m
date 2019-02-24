Return-Path: <SRS0=v7BG=Q7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5752DC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Feb 2019 08:04:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F201206BA
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Feb 2019 08:04:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJEYAVLO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="mjDaxmuz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F201206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:
	Subject:From:To:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=SKPrqPBBx+oMM0OcvaSnKd7AQnnmnguxxzIaxU+1+Fk=; b=CJE
	YAVLO3uQMRy2wjak86ss7POnuN3xXUXJkIGRYf0TOnQ7euVcH2XbT8Mgj4qwt/ENIJOumgwe+ILFC
	bsyG5dq2a44AV8rBWaI/adkyWc3+fve3+/yj5G1gYhzLUoV4jGouGN5hz+l6/8QfbrGWhINrFskuu
	rchqcaU/Nj2FN5PG+ATl24EbJpUBDy6h1Kwb0SgC0fFo+2p63CHAwzDzHh849SyS4JNYUUhX/k2/l
	0ETEQmmp8RUZ6EueeG63rjwxj1JnXkXFEIbHUptrdLp78qtmg8Bt9Xy0PdPaxduVSyodDN44En1AK
	LHJWG8Ip64u8ihVO14rRBGtEHwBeQkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxomG-0000EA-3f; Sun, 24 Feb 2019 08:04:48 +0000
Received: from mail-40130.protonmail.ch ([185.70.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxomD-0000Dt-JR
 for linux-mtd@lists.infradead.org; Sun, 24 Feb 2019 08:04:47 +0000
Date: Sun, 24 Feb 2019 08:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1550995483;
 bh=OdxBGlkEndXm7cPgFS4gXw5XApFR5wgYdOCLqi+nvsc=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=mjDaxmuzU38upKH8TX6ePnMISD02r2qtwJfZQvcc+rbswEfNY+2FJEOsMYIavZi3k
 KRTajiP4VF3+hcUUsAT3D0xEhp1Dvvgstas2bJKGSeS4Fx+wFK9Q4BqBKQ23Wtd5tl
 AbgqanAUh6oeHAl05drqpuu7tyeP4N7eqpn4OI+s=
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: coreassumption <coreassumption@protonmail.com>
Subject: securely wipe sensitive data from mtd?
Message-ID: <cMCf6e-7A9hCUl29t7xLtWy9cUfo7cj7Wr1L1i47ZnErTNqBquZ-tGlHbUNaL8L1MCId_0Ke0x9eV0tOfG-hN0ytN6m3lBb0XTxAOQFP8OQ=@protonmail.com>
Feedback-ID: jRIFQ-DVHPgl9q48H57BbZfbq7nzzkW-Qf83ZtFeM7q0lyiTsTH0KfISuZVzImhAJulPRcvw73KEfwxLZvax7g==:Ext:ProtonMail
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_000445_794480_46BEFEFB 
X-CRM114-Status: UNSURE (   3.80  )
X-CRM114-Notice: Please train this message.
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
Reply-To: coreassumption <coreassumption@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V2hhdCBpcyB0aGUgcHJvcGVyIHdheSB0byBjbGVhbiBhIG10ZCBvZiBhbnkgc2Vuc2l0aXZlIGRh
dGEgdGhhdCBtYXkgYmUgbG9jYXRlZCBvbiB0aGVtIChOT1IgYW5kIE5BTkQpPwoKV291bGQgZmxh
c2hpbmcgYSBuZXcgaW1hZ2UgdmlhIHVCb290IGJlIGVub3VnaD/CoCBPciB3b3VsZCB0aGUgd2Vh
ciBsZXZlbGluZyBtZWNoYW5pc20gcHJldmVudCB0aGlzIGZyb20gY2xlYXJpbmcgZXZlcnl0aGlu
Zz8KCldvdWxkIHdyaXRpbmcgMCdzIGZyb20gYSBydW5uaW5nIE9TJ3MgYmUgc3VmZmljaWVudD/C
oCBPciBpcyB0aGUgZGV2aWNlICdzbWFydCcgYW5kIG5vdCB3cml0ZSB6ZXJvIHN0cmVhbXM/CgpB
cmUgbXVsdGlwbGUgcGFzc2VzIG9mIHdyaXRpbmcgc3VnZ2VzdGVkIG9yIGlzIHRoaXMganVzdCBh
IGhvbGRvdmVyIGZyb20gbXl0aHMgb2YgbWFnbmV0aWMgbWVkaXVtcz8KClRoYW5rcyBmb3IgYW55
IGluc2lnaHRzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
