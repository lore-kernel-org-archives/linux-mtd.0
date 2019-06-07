Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC25BC2BCA1
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 20:27:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9085820868
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 20:27:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6d1c14f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuSDK9d/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9085820868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NpcFSc/ywTDYTZdZNBfZjPhq5tQSos9AGQqFeb8v6Us=; b=j6d1c14f2V9oEM
	FVU5qR5X1rvvUi8m93DCp8wQtKZCSTZn5O1R1o6kSehFzlRxoYXsm3MPFTj81ZkWShmj94ULcKp1v
	n5B3xuks6KWfIdTMTQ3rS5iTre9RUhN9xYvn3lRwBo9/JG84gygYpicjOEXjx8nMj8u/YqoR2nLiL
	i0d2vMsgIajSwH/fQ9sqD9T9guPkEzWnKSjgTBDQvYFwbF1Ay+h4UXWHNLdAUj4yMi+KTZcwVtRnC
	iTlgy5jDwuBGOvYfsptTPeGVGCmaQ0YTWPJC8PRzV5f9LHKLtKfLCTD2NQrA4exMJNJeacEcErBfb
	NeCKLRJ6q8XcX8FvTQqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZLSK-0008Hx-Pj; Fri, 07 Jun 2019 20:27:20 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZLSH-0008HY-T5
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2019 20:27:19 +0000
Received: by mail-pg1-x543.google.com with SMTP id f25so1718464pgv.10
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2019 13:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hSzQpwAiM+NRy/HIwuQOaL4l6Fd+62I0ixlRApmIXxg=;
 b=QuSDK9d/92EWHndE25zvgWp5ImGBwWWZLLMC1zNMpDzzq2SJoPio9YmJtPPXQ93DSw
 RNfFLtMfA2defydY7h8wb4mOvvVP8Dz01WJ6rpmYK3WAn8BkwSLNBhsfDihBBsrQPtmR
 Sh0rTT/7nJxNJRDkkDq4tJ/fV6CBkRMG8nEfQwuMySYIsF9ILZAJfb8ooiPyhUxcEHPk
 4J9JdkPre9sn5hA17a8qKwUvKjv60eSOln5Gbe4vRsfPXpa9BCgzg1kok79jRa8krR3d
 +u/d2gO28o6A4jsFWc9NrbwkjScwmcoZrTXNtsqI7GG1Cd0zQL9Ld0GfVfJHqc//fZai
 cEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hSzQpwAiM+NRy/HIwuQOaL4l6Fd+62I0ixlRApmIXxg=;
 b=k2GBVpPHuZoyv5CpPSVXjndJsiKcZyhs5t0nwcDoNP9bymbzyCJpgV/Ijl3oC0IkbS
 liccTrPAnRl7EcCgX4JRq5LRWuK/Z4xaTxKvlMZeEj4yVLFYfABscLkqZ1sn3/YEc8Er
 sW2jSSJ9nuQA3UVn62apiNHL+uV1QIzgIZGx/6WwbWsEAugx5bMvUyAz1QSpbtFeWmpI
 eH1d/nEdsBKXNalRLrebxCPDFN1UUVPbEPg8hw7uEfnNXllLhmy53YoidMPvCKUm1i5W
 id68zB9N7xO/a7A/pe7cYCgYJlJxhk77IJsIONXdc4XFICRpZG6NX1q4msUGICHBkg12
 1goA==
X-Gm-Message-State: APjAAAW87UV7+R42UYKQgB+DujgxJDVAFI/uudSh5a+y5ZKSMHXg65Gg
 mlN7mAAG4AX5wCnB7QYdEGfbA5WC4e/pOD7qIdE=
X-Google-Smtp-Source: APXvYqxamtxpEwMuMupwWMYImT3V0G9LaFfCOuX3uNXVmG//mY/dryDOWxY312/Qol7k8NpB0wtkuyyykyC6pSMxi9g=
X-Received: by 2002:aa7:82d6:: with SMTP id f22mr62257168pfn.151.1559939237240; 
 Fri, 07 Jun 2019 13:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190515210202.21169-1-richard@nod.at>
 <CAO1O6sdU=kAYS2sTKwiagxrbg+fMer9nvbwA9C4LoFMgH7e1dQ@mail.gmail.com>
 <1644731533.84685.1559938164477.JavaMail.zimbra@nod.at>
In-Reply-To: <1644731533.84685.1559938164477.JavaMail.zimbra@nod.at>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Fri, 7 Jun 2019 22:27:09 +0200
Message-ID: <CAO1O6scuNXfgtaex_Ty4-5=DmBV43Sg28ntkzNgB5T2KwfXG3g@mail.gmail.com>
Subject: Re: [PATCH] ubifs: Add support for zstd compression.
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_132717_947338_4090BE13 
X-CRM114-Status: GOOD (  14.37  )
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
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Michele Dionisio <michele.dionisio@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgpEZW4gZnJlIDcganVuaSAyMDE5IGtsIDIyOjA5IHNrcmV2IFJpY2hhcmQgV2VpbmJlcmdl
ciA8cmljaGFyZEBub2QuYXQ+Ogo+Cj4gRW1pbCwKPgo+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1h
aWwgLS0tLS0KPiA+IEluIGZzL3ViaWZzL3NiLmMgd2UgaGF2ZQo+ID4KPiA+IHN0YXRpYyBpbnQg
Z2V0X2RlZmF1bHRfY29tcHJlc3NvcihzdHJ1Y3QgdWJpZnNfaW5mbyAqYykKPiA+IHsKPiA+ICAg
IGlmICh1Ymlmc19jb21wcl9wcmVzZW50KGMsIFVCSUZTX0NPTVBSX0xaTykpCj4gPiAgICAgICAg
cmV0dXJuIFVCSUZTX0NPTVBSX0xaTzsKPiA+Cj4gPiAgICBpZiAodWJpZnNfY29tcHJfcHJlc2Vu
dChjLCBVQklGU19DT01QUl9aTElCKSkKPiA+ICAgICAgICByZXR1cm4gVUJJRlNfQ09NUFJfWkxJ
QjsKPiA+Cj4gPiAgICByZXR1cm4gVUJJRlNfQ09NUFJfTk9ORTsKPiA+IH0KPiA+Cj4gPiBNYXli
ZSBhZGQgYW4gZW50cnkgZm9yIHpzdGQgaGVyZSBhcyB3ZWxsPwo+Cj4gV2hlcmUgd291bGQgeW91
IGFkZCBpdD8gSWYgd2UgYWRkIGl0IGFmdGVyIFVCSUZTX0NPTVBSX1pMSUIsCj4gaXQgd2lsbCBl
ZmZlY3RpdmVseSBuZXZlciBnZXQgc2VsZWN0ZWQsIHVubGVzcyBzb21lb25lIGJ1aWxkcyBhIGtl
cm5lbAo+IHdpdGhvdXQgbHpvIGFuZCB6bGliIGJ1dCB6c3RkLgo+IElmIHdlIGFkZCBpdCBiZWZv
cmUgVUJJRlNfQ09NUFJfWkxJQiwgaXQgd2lsbCBiZSB1c2VkIGFsd2F5cyBhbmQgdXNlcnMKPiBl
bmQgdXAgd2l0aCB1bnJlYWRhYmxlIGZpbGVzIGlmIHRoZXkgcmVib290IHRvIGFuIG9sZGVyIGtl
cm5lbC4KPiBQbGVhc2Ugbm90ZSB0aGF0IHdlIGRpZG4ndCByYWlzZSB0aGUgVUJJRlMgZm9ybWF0
IHZlcnNpb24gZm9yIHpzdGQuCj4KPiBTbyBJJ20gbm90IHN1cmUgd2hhdCBpcyB0aGUgYmVzdCBj
aG9pY2UgZm9yIHRoZSBkZWZhdWx0IGZpbGVzeXN0ZW0uCgpNeSBpZGVhIHdhcyBhdCB0aGUgZW5k
LCBpLmUuIGl0IHdpbGwgb25seSBiZSB1c2VkIHdoZW4gTFpPIGFuZCBaTElCCmFyZSBub3Qgc2Vs
ZWN0ZWQgdG8gYmUgaW5jbHVkZWQgZm9yIFVCSUZTLCBmb3IgZXhhbXBsZSB3aGVuIHNvbWVvbmUK
Y29tcGlsZXMgYSBtaW5pbWFsIGtlcm5lbCB3aG8ga25vd3MgZXhhY3RseSB3aGljaCBjb21wcmVz
c2lvbgphbGdvcml0aG1zIHdpbGwgYmUgdXNlZCBvbiB0aGF0IHN5c3RlbS4gSSBndWVzcyB0aGF0
J3MgdGhlIHNhbWUgcmVhc29uCndoeSB6bGliIGV4aXN0cyBhdCBhbGwgYW5kIGlzIHBsYWNlZCBh
ZnRlciBsem8uCkJ1dCBvZiBjb3Vyc2UgdGhlIG90aGVyIHBvc2l0aW9ucyBhbHNvIGhhdmUgdGhl
aXIgcHJvcy4gSWYgd2UgcGVyZm9ybQptb3JlIGJlbmNobWFya3Mgc3BlZWQvc2l6ZSBhbmQgY29u
Y2x1ZGUgdGhhdCB6c3RkIG91dHBlcmZvcm1zIHpsaWIgZm9yCmFsbCBhc3BlY3RzLCB0aGVuIG1h
eWJlIHBsYWNpbmcgaXQgYmV0d2VlbiBsem8gYW5kIHpsaWIgY291bGQgYmUgYW4Kb3B0aW9uLCBi
dXQgYXMgeW91IHNheSB3ZSBzaG91bGQgYXZvaWQgYnJlYWtpbmcgY29tcGF0aWJpbGl0eSB3aXRo
Cm9sZGVyIHN5c3RlbXMuCkkgZGlkIGEgc2luZ2xlIHRlc3QgdG9kYXkgYW5kIGNvbXBhcmVkIGx6
byBhbmQgenN0ZCBhbmQgb24gdGhhdCB0ZXN0Cmx6byBoYWQgZmFzdGVyIGRlY29tcHJlc3Npb24g
c3BlZWQgYnV0IHJlc3VsdGVkIGluIGxhcmdlciBzcGFjZS4gSSdsbApkbyBtb3JlIHRlc3RzIGxh
dGVyLgoKL0VtaWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
