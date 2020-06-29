Return-Path: <SRS0=cYNo=AK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361ACC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 10:53:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A5C23884
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2020 10:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eI18x7+G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S3WzZv61"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A5C23884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uIPquyhjQ9LhFxP7eV62N+/rAnf0RdgoOZJ2KHaY5aY=; b=eI18x7+GFksQvZbUGGsxK8D9o
	mpDLIAzi4VoyxJtfPwZThRY1tkEd/TZOLB0gwpUfE4fPQcG/UiLlgSnx78C45fJ36ufwANPHAhp6u
	20KpAxySS4f5SJDPSYbLmImDN6DPBqy3HJTUtwarjH75KcjVfd5aeLT0GjTxNXc5zu3JchsMoB5vN
	jtoRusMwKi4ceT9EqESzxYdUevskCuMROhWJfmNLtGWBMn6alPeAUtHZODOqgIDd6ERSfWlzZlDeK
	mOYjuU9rdfs8VC4mdf+bCr9YdzPVOs9LuShppGisIjmJtM1cmPFsZGAj/VXxTz/p3GylT6XsxDS1s
	hT88swIvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jprOv-0001N4-3F; Mon, 29 Jun 2020 10:52:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jprOs-0001Mt-P5
 for linux-mtd@merlin.infradead.org; Mon, 29 Jun 2020 10:52:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=nqET4AstVLEtv4VPoGqGhUZJcRM6rsSmSY+/NjIg2z4=; b=S3WzZv61E5XGxLbi16/VHG1E1z
 fM0+Vlu0j+iGdMYHidxtKpOxOUGxYLAgSot6w07f95akC9tlWjZHzv/WBX6zgIqCdvkb29r8QUwgo
 p39UI6GGLuako21dKA1RpIz+0bOoDVymWAzf52xjO23fmswYp1a8mbJVd8mW5/tJt6EKnJrUfpQmf
 Q6MJDPjmUMR7IhTcPBV+6LGg9ZEksxE1GvfwTPyLu5/ML64PdtEsAnqn+VFkvMtUwIYo4Ri7TnuWA
 fPxG4DRueLeS6PxhA5B2+TzrUPnAUf0Zv9S6tx+GLb6FJqQ4D2hBkN6RuB7VqoeafsTZYyl7I3+KZ
 O0uYC89A==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jprOp-0006FY-6o
 for linux-mtd@lists.infradead.org; Mon, 29 Jun 2020 10:52:33 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 110D8607400F;
 Mon, 29 Jun 2020 12:52:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ELcXX4DXovUL; Mon, 29 Jun 2020 12:52:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id AA3766074029;
 Mon, 29 Jun 2020 12:52:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1IqchU5qp0YY; Mon, 29 Jun 2020 12:52:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 86EBE607400F;
 Mon, 29 Jun 2020 12:52:28 +0200 (CEST)
Date: Mon, 29 Jun 2020 12:52:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <833138471.71381.1593427948494.JavaMail.zimbra@nod.at>
In-Reply-To: <20200629085300.GA17241@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <20200626112907.13201-5-torben.hohn@linutronix.de>
 <1273452738.62169.1593174441367.JavaMail.zimbra@nod.at>
 <20200629085300.GA17241@linutronix.de>
Subject: Re: [PATCH v2 4/4] ubifs: prevent remounting rw when no hmac key
 was given
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: prevent remounting rw when no hmac key was given
Thread-Index: 1Cb0VoVjD5EH9ODSjPJ9Zo/ABZ5ZiQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_115231_813788_00970648 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: bigeasy <bigeasy@linutronix.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 tglx <tglx@linutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VG9yYmVuLAoKLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiAKPj4gQnV0IHRoZSBj
YXNlIHRoYXQgb25lIHJlbW91bnRzIHJ3IGFuZCBwcm92aWRlcyBhIEhBTUMgaXMgaGFuZGxlZD8K
PiAKPiBOby4gQW5kIGkgYW0gbm90IHN1cmUsIHdoZXRoZXIgdGhhdHMgYSB0aGluZywgd2Ugd2Fu
dCB0byBzdXBwb3J0Lgo+IEkgd291bGQgc3VnZ2VzdCwgd2UgY2xhcmlmeSB0aGF0IGluIHRoZSBt
ZXNzYWdlLgoKWWVhaC4KIAo+IAo+IE9uZSB3b3VsZCBuZWVkIHRvIGNoZWNrLCB3aGV0aGVyIGMt
PmF1dGhfa2V5X25hbWUgaXMgc2V0IG5vdywKPiBhbmQgdGhlbiBpbnN0YW50aWF0ZSBjLT5oYXNo
X3RmbS4KPiAKPiB1Ymlmc19pbml0X2F1dGhlbnRpY2F0aW9uIGlzIG5vdCBjYWxsZWQgdXBvbiBy
ZW1vdW50Lgo+IHNvIGEgcmVtb3VudCB3aXRoIGEgY2hhbmdlZCBhdXRoX2tleV9uYW1lIGlzIG5v
dCBzdXBwb3J0ZWQgZWl0aGVyLgoKQmVjYXVzZSBpdCBpcyB0ZWNobmljYWxseSBub3QgcG9zc2li
bGUuIFdlJ2QgbmVlZCBib3RoIGtleXMgdGhlbi4KQnV0IEkgYWdyZWUgd2Ugc2hvdWxkIHJlamVj
dCBpdC4gUmVtb3VudGluZyBpcyB0cmlja3kuLi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
