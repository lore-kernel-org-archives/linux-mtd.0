Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3F8C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F6C207E8
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2uj1tHFZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YuijGeIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F6C207E8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q//P/akeI+9Aj01YPZaGrEf/k2KR9/l5aKs+J42zeRU=; b=2uj1tHFZkf6lJbwf7lbjkq4p9
	ig6L7DBgTL199HDWWL7kaG1i8Fxk7Stcx46wOob+We7tDy3oKvB1JFeYgbW0o07h83wOn+2c7gcXb
	2SQ/fsjT+190Q2Ce/ka1pXR3cZ/ZM8iMTdlYBIXwV3bGfx32B80mUQUGFqfACXd8cRFEZvTyGrKHS
	L1aiu8MTophbz+ozMQkiPmEMGS9/b0leXrGmkCqO2+hzgsimmk8RIr4E5tZN5BTNJP2mrZ4tUcaPP
	6Kx18mRhqh5Yw+dEBSUbcffV1aLvLm20qz3/iY0hfxNbXup0kPbuWuTdC72PP6mbwAWhg8GIe6vu0
	QzX+kpBqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jonVL-0007gD-5S; Fri, 26 Jun 2020 12:30:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jonVG-0007ea-UR
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 12:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=36CsX4WuTBP5i9SOFe1qQ1h06gAVXGB1slWTDfzqx8M=; b=YuijGeIqoD50k7XnMS4rlXUHO5
 Q6z7dFcJSptm5x5T6JBvClT07khI5yCTXNyiECKMymhT4mxJTv683HyuZHpiMZHBUFnlxUWyZoYtH
 b2mNjGwAfVIvXVcCG7sDJAqhWuiZeYjigAOA2sJZ6SjD0/5w6PtKvvEFBvKPWj0vM/304laH89664
 EvnhFQ6vPV9jY8A5hORI3Fp7/PRNAxW1b4QywpJhyZqZOSJqGUrp2fLz8o/Pi5/kgXqLZlwdYnUoE
 OflYwpKVlfCNK/s183gWeguA29PLELEsI0+qyo/CqxuJx+a7AUi5tZAIZU+CIQLIImxLM68NPMfs/
 sqlU836w==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jonTA-0003Vz-I8
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 12:30:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 001C6607402C;
 Fri, 26 Jun 2020 14:27:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id A6Z212JMtu5A; Fri, 26 Jun 2020 14:27:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8BE8E607403C;
 Fri, 26 Jun 2020 14:27:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id k673v1frU-KB; Fri, 26 Jun 2020 14:27:21 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 6D600607402C;
 Fri, 26 Jun 2020 14:27:21 +0200 (CEST)
Date: Fri, 26 Jun 2020 14:27:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Torben Hohn <torben.hohn@linutronix.de>
Message-ID: <1273452738.62169.1593174441367.JavaMail.zimbra@nod.at>
In-Reply-To: <20200626112907.13201-5-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
 <20200626112907.13201-5-torben.hohn@linutronix.de>
Subject: Re: [PATCH v2 4/4] ubifs: prevent remounting rw when no hmac key
 was given
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: prevent remounting rw when no hmac key was given
Thread-Index: yPDt66/ApSlcLK6q6S3RMfoqKMsLEA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_132842_741763_734EFF26 
X-CRM114-Status: UNSURE (   9.02  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlRvcmJlbiBIb2huIiA8dG9y
YmVuLmhvaG5AbGludXRyb25peC5kZT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4K
PiBDQzogImJpZ2Vhc3kiIDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+LCAidGdseCIgPHRnbHhAbGlu
dXRyb25peC5kZT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4s
ICJTYXNjaGEKPiBIYXVlciIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Cj4gR2VzZW5kZXQ6IEZy
ZWl0YWcsIDI2LiBKdW5pIDIwMjAgMTM6Mjk6MDcKPiBCZXRyZWZmOiBbUEFUQ0ggdjIgNC80XSB1
YmlmczogcHJldmVudCByZW1vdW50aW5nIHJ3IHdoZW4gbm8gaG1hYyBrZXkgd2FzIGdpdmVuCgo+
IEFmdGVyIGFkZGluZyByZWFkb25seSBobWFjLWxlc3MgYXV0aGVudGljYXRpb24gc3VwcG9ydCwK
PiBwcmV2ZW50IHJlbW91bnRpbmcgdGhlIGZpbGVzeXN0ZW0gaW4gcncgbW9kZSwgd2hlbgo+IHRo
ZSBobWFjIGlzIG5vdCBhdmFpbGFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9yYmVuIEhvaG4g
PHRvcmJlbi5ob2huQGxpbnV0cm9uaXguZGU+Cj4gLS0tCj4gZnMvdWJpZnMvc3VwZXIuYyB8IDQg
KysrKwo+IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZnMvdWJpZnMvc3VwZXIuYyBiL2ZzL3ViaWZzL3N1cGVyLmMKPiBpbmRleCBiNDFjYTllZTU3NjMu
LjYyYmRlZjhmMWRkZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9zdXBlci5jCj4gKysrIGIvZnMv
dWJpZnMvc3VwZXIuYwo+IEBAIC0xOTk2LDYgKzE5OTYsMTAgQEAgc3RhdGljIGludCB1Ymlmc19y
ZW1vdW50X2ZzKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludAo+ICpmbGFncywgY2hhciAqZGF0
YSkKPiAJCQl1Ymlmc19tc2coYywgImNhbm5vdCByZS1tb3VudCBSL1cgLSBVQkkgdm9sdW1lIGlz
IFIvTyIpOwo+IAkJCXJldHVybiAtRVJPRlM7Cj4gCQl9Cj4gKwkJaWYgKHViaWZzX2F1dGhlbnRp
Y2F0ZWQoYykgJiYgIWMtPmhhc2hfdGZtKSB7Cj4gKwkJCXViaWZzX21zZyhjLCAiY2Fubm90IHJl
LW1vdW50IFIvVyBkdWUgdG8gbWlzc2luZyBobWFjIGtleSwgZm9yCj4gYXV0aGVudGljYXRpb24i
KTsKPiArCQkJcmV0dXJuIC1FUk9GUzsKPiArCQl9CgpCdXQgdGhlIGNhc2UgdGhhdCBvbmUgcmVt
b3VudHMgcncgYW5kIHByb3ZpZGVzIGEgSEFNQyBpcyBoYW5kbGVkPwoKVGhhbmtzLAovL3JpY2hh
cmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
