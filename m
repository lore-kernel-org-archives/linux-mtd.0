Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7BFC83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:03:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BA721973
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dePwe/+h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BA721973
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwlVueabCLU4kMQ3DjYfzm18GY/+lBxyYHceT7dzp0w=; b=dePwe/+hR3bNpk
	60EphD+bDjKEncGRnoIv6q8zihHwsW7c50PZBFiQs1TXFKmjJWh8Loq4lScU4Uy3nyiGARTuDqgwG
	hjDAthad2BbpAKKnWR6yJ91smcYLqR619/yEjNtFU8CpXFrIzwAznGGdccz7bPv63+7MiTTSvLDSL
	y9cW+pHIivo9b4p4rzO+JvmQtgiATg8gySZ/bGbKhtFx31xQzkm1xA+6ZzQ2M8qLu2CZuZOPkZuGi
	IRDRDtEWw0s+ioXR8FMACALnttDFsaAxtbnyC16simgkGirevRAgq/8jmCIaNeitm5dY9dteQGvgo
	JHsrNpEK1HLiMmTWyn8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jToFM-0005bU-NL; Wed, 29 Apr 2020 15:03:36 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jToFK-0005a7-LS
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 15:03:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id F3AD2609D2FA;
 Wed, 29 Apr 2020 17:03:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id lX7sjEyPFomq; Wed, 29 Apr 2020 17:03:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 740FF6075EB6;
 Wed, 29 Apr 2020 17:03:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 8Uf7_MeP4EgF; Wed, 29 Apr 2020 17:03:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5288660632C0;
 Wed, 29 Apr 2020 17:03:28 +0200 (CEST)
Date: Wed, 29 Apr 2020 17:03:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: John Ogness <john.ogness@linutronix.de>
Message-ID: <191182038.171422.1588172608162.JavaMail.zimbra@nod.at>
In-Reply-To: <875zdibasg.fsf@vostro.fn.ogness.net>
References: <20200119215233.7292-1-richard@nod.at>
 <875zdibasg.fsf@vostro.fn.ogness.net>
Subject: Re: [PATCH] ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: Fix ubifs_tnc_lookup() usage in do_kill_orphans()
Thread-Index: VZvOuEmGG52wsyHCwYg4ePnx4nCziw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_080334_843946_53937264 
X-CRM114-Status: UNSURE (   6.02  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gSm9obiwKCi0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiBWb246ICJKb2hu
IE9nbmVzcyIgPGpvaG4ub2duZXNzQGxpbnV0cm9uaXguZGU+Cj4gQW46ICJyaWNoYXJkIiA8cmlj
aGFyZEBub2QuYXQ+Cj4gQ0M6ICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFk
Lm9yZz4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IEdl
c2VuZGV0OiBNaXR0d29jaCwgMjkuIEFwcmlsIDIwMjAgMTY6NTY6MzEKPiBCZXRyZWZmOiBSZTog
W1BBVENIXSB1YmlmczogRml4IHViaWZzX3RuY19sb29rdXAoKSB1c2FnZSBpbiBkb19raWxsX29y
cGhhbnMoKQoKPiBIaSBSaWNoYXJkLAo+IAo+IENvdWxkIHlvdSBDQyB0aGlzIHBhdGNoIHRvIHN0
YWJsZT8gSXQgZml4ZXMgYSBzZXJpb3VzIHByb2JsZW0gdGhhdCBJIGFtCj4gc2VlaW5nIG9uIHJl
YWwgZGV2aWNlcyAoaS5lLiBMaW51eCBub3QgYmVpbmcgYWJsZSB0byBtb3VudCBpdHMgcm9vdAo+
IGZpbGVzeXN0ZW0gYWZ0ZXIgYSBwb3dlciBjdXQpLiBUaGFua3MuCgpJdCBoYXMgYSBGaXhlcy1U
YWcsIHNvIGl0IHNob3VsZCBtYWtlIGl0IGludG8gc3RhYmxlLgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
