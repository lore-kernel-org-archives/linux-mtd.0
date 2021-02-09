Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9B2C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 16:30:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C26164EBA
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 16:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C26164EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikQtqr8GcH77h8oWnq9W1kVP78XKnuUf/k5k4nQL6LY=; b=gYtq8fENm5JV465K4Rnn0EZJL
	cKhXj9rA+l0c4LhskwkLu6JpBqXMtPEjsTs7CFXHAnH28O2vY/VlaQUUzd/JCUbWQBT2Z7BODoRm1
	aK1PcFhgzwtzS0SyRFJwRZxX+cmuHYQ0qU5YurZRgM7FNaE7+AywLu+KFMSLRASlpn0fO1jHGQ4wR
	hUa/r271FB/X6D5QaH8lsynF/AQiZTPf2UB8Avc07/Q4tq7JtNtRAjQeVadrfsLRHTAUfjzkP808b
	+DRqsQKr4x2Lsm7uVOxCAkgH3gFqx2go/vKmXW7+4eOhm7xDU0kYldzEJVOwut9QrPKAUTDq7qzey
	q5c/QT8BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9VtS-0007U3-TA; Tue, 09 Feb 2021 16:29:38 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9VtP-0007TE-Ou
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 16:29:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 771796083270;
 Tue,  9 Feb 2021 17:29:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id o3p66GI-atgJ; Tue,  9 Feb 2021 17:29:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2FAC16083272;
 Tue,  9 Feb 2021 17:29:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id P7xhnPf6_h9a; Tue,  9 Feb 2021 17:29:34 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0BE716083270;
 Tue,  9 Feb 2021 17:29:34 +0100 (CET)
Date: Tue, 9 Feb 2021 17:29:33 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Luca Risolia <luca.risolia@studio.unibo.it>
Message-ID: <231074135.378774.1612888173941.JavaMail.zimbra@nod.at>
In-Reply-To: <ad4fd822-016e-e11e-682c-077a1ced2a18@studio.unibo.it>
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
 <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
 <b2424246-d42b-d0bc-8951-8cefdf5b681d@studio.unibo.it>
 <1517729157.378701.1612886684264.JavaMail.zimbra@nod.at>
 <ad4fd822-016e-e11e-682c-077a1ced2a18@studio.unibo.it>
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: MUSE: Userspace backed MTD v3
Thread-Index: YaE/ufkj2BTsqe2+5i1CTYJXpKF+YQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_112935_942638_26FDB3A0 
X-CRM114-Status: UNSURE (   4.38  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiBBIHNpbXBsZSAoYnV0IHVnbHkhKSBh
cHByb2FjaCB3b3VsZCBiZSByZWRpcmVjdGluZyBtbWFwKCkgcmVxdWVzdHMgb24gQ1VTRQo+PiBk
ZXZpY2VzIHRvIC9kZXYvbWVtLgo+PiBobW0/Cj4gCj4gd2hhdCByZXF1ZXN0cyBhcmUgeW91IHRh
bGtpbmcgYWJvdXQgZ2l2ZW4gdGhhdCBhdCB0aGUgbW9tZW50IHRoZSBDVVNFCj4gY2xpZW50IGlu
dGVyZmFjZSAoY3VzZV9sb3dsZXZlbF9vcHMpIGRvZXMgbm90IGV4cG9zZSBtbWFwPwoKVGhlIG1t
YXAoKSBjYWxsIGl0c2VsZi4gT2YgY291cnNlIHlvdSBuZWVkIHRvIHRvdWNoIGNvZGUuCk1heWJl
IGp1c3QgY3VzZV9sb3dsZXZlbC5jLCBtYXliZSBrZXJuZWwgdG9vLgoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
