Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3DEC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 16:05:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E8D64EB8
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 16:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E8D64EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=molDYjf64K8sfX1lhmFQ5fY9XXZWsqRsWzCmwJnq4Yk=; b=YMB95mNtWKQdm1g2NtvY/p3C2
	2JogcWSn7cbd8wamOkjZxFhwjYUGhGi3DaaTRlFOBtWZEES3e33gVUwR4yUG+Wfp2LMJVqvF96ep+
	J+r84mfDYp0AMlR//qxPYo5Gs8AeDDNx7Y94f2LLeN2MGNxaIQeGgbb73cdQwI4BixVPqzsZWG94B
	9v8nYT+1+vhKcAZOFq3xIlsO1LgNo6w39Vpn/xnM/GpEUOUdIZkTTfior4ZTroYveuUq3uylwC8Va
	daJJloXQ1tucY4/QKDdBekYXw8Nkl7nkH5lik2hZepaTHUhinSHP11ulE7E54wyUPDlerFXp+9111
	OQHf33v1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9VVQ-0004KE-8W; Tue, 09 Feb 2021 16:04:48 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9VVN-0004Jg-Ox
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 16:04:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D8CA36083276;
 Tue,  9 Feb 2021 17:04:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pxadgr_i0awx; Tue,  9 Feb 2021 17:04:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 850A76083272;
 Tue,  9 Feb 2021 17:04:44 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5xN4CfVrl8hV; Tue,  9 Feb 2021 17:04:44 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5DDC3608A38F;
 Tue,  9 Feb 2021 17:04:44 +0100 (CET)
Date: Tue, 9 Feb 2021 17:04:44 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Luca Risolia <luca.risolia@studio.unibo.it>
Message-ID: <1517729157.378701.1612886684264.JavaMail.zimbra@nod.at>
In-Reply-To: <b2424246-d42b-d0bc-8951-8cefdf5b681d@studio.unibo.it>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
 <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
 <b2424246-d42b-d0bc-8951-8cefdf5b681d@studio.unibo.it>
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: f2FpF8PjrUPpHHP0V+KyAUAhV15RfQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_110446_011900_EA1D0B6D 
X-CRM114-Status: UNSURE (   5.20  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Miklos Szeredi <miklos@szeredi.hu>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Ron Minnich <rminnich@google.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven <sven@narfation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IGZvciBleGFtcGxlLCBtYW55IGV4aXN0
aW5nIHZpZGVvIGFwcGxpY2F0aW9ucyB1c2UgbW1hcCgpIHRvIG1hcCB0aGUKPiBkZXZpY2UgbWVt
b3J5IHRvIHVzZXJzcGFjZSBtZW1vcnkuIEFkZGluZyBzdXBwb3J0IGZvciBtbWFwKCkgdG8gQ1VT
RQo+IHdvdWxkIGFsbG93IHRoZXNlIGFwcHMgdG8gd29yayB3aXRob3V0IGFueSBtb2RpZmljYXRp
b25zIHdpdGggQ1VTRS1iYXNlZAo+ICAgZGV2aWNlIGRyaXZlcnMgb3RoZXIgdGhhbiBrZXJuZWwg
ZHJpdmVycy4KClNvIHlvdSB3YW50IHRvIGFjY2VzcyBkZXZpY2UgbWVtb3J5IHZpYSBDVVNFPwpX
ZSBoYXZlIHBsZW50eSBvZiBtZWNoYW5pc21zIGluIExpbnV4IHRvIGFsbG93IHVzZXJzcGFjZSBh
Y2Nlc3NpbmcgZGV2aWNlIG1lbW9yeS4KRS5nLiAvZGV2L21lbSwgVUlPLCBWRklPLgoKQSBzaW1w
bGUgKGJ1dCB1Z2x5ISkgYXBwcm9hY2ggd291bGQgYmUgcmVkaXJlY3RpbmcgbW1hcCgpIHJlcXVl
c3RzIG9uIENVU0UgZGV2aWNlcyB0byAvZGV2L21lbS4KaG1tPwoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
