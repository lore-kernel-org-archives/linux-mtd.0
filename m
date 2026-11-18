Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B7560A260D
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 16:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GdiqxQqk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sebOtgOh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IkdMu1uEoK1aBF+SjH76TDOk1I31vHGKdA96n2VLyOo=; b=GdiqxQqkB50M6KAwTq2Gs+JKzI
	S9FnV1Q9Mv4E0Sg66cMyxbGQ7NcCyc2Uq+3cbwCOFFB/Z2ZqN+PPF+UDyqMs6Q3lzAXYoG5XlBx3s
	qzIoQJ7cH5oVs+XTCsIVx4p5/VO/RJK2tBL4DmSMg4mQyv+AkA/P1pNNdT+Tt226OuAkziSCaTXM2
	Y7kHh6g//8rxQMvWf7NMrNjQgNdTo3CuxXdsRvqo8JCvibjjsNwtXitNUh1KuLa2+gKfHWoZPVnBT
	TO5s2DcVp6sEtTbN6ccZhJCyIufZW2/AuaZpGIxQBrRrW6GaURVwt87ZvpHEBFUMkCF31z6V2b5Os
	zE5cAZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirO-00000009Zme-3aha;
	Wed, 18 Nov 2026 16:50:14 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirG-00000009Zhm-0mDt
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 16:50:12 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-5edf97136aaso680472e0c.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 08:50:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795020605; cv=none;
        d=google.com; s=arc-20260327;
        b=WuK5fS4xm27lDG4zb5pS57U9v7BO/BY8yOfvov/nL+CbX17QVnHYKgOHHdRLmi9lgC
         UXgHDg05U+RSVGjRQ5znQ6HNTrI+pHYD7/3y5Yax+mQOmb7jN50t/2szNvp1Jh9MGCGO
         jpMVTC64VLRC9zRMc9TBUK0Ji3WTcY/X98/qfArfGI7lvIlpADuidICv80rxntrpmnFZ
         HBXJFkPQFhB8880ezXxLztXBKmsDstPCrn2rfUSvrKkAeXvW5VjGpMzBj1K0mrncSCWd
         ZHo/SKMJEb8A4Yo8fe1YuE3UaK5kBn64GxHb84ziIGN5rEQF2lNqUGyC65twYwgN0et0
         1fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
        fh=oAi1MZv4ON5xbzembo/VcXeueNwHBR5YM/i8kRx6Tgw=;
        b=nBkewpjcPAW+So3QuC3rZVz7dV0Guq3xAgBrgHjpuH7vgLFCjm6nIcq8jCy2XNCsKh
         mmEEzn8lcfpxGFT2URkvBjl7Q/IeRY3pudxgyPSquGliAH5dNgWRTCjzmxQVS1EGqvPp
         27XTWhRS+xhYP3p7izkLj22W6zL0e0c6HVJP6IAm1a14ng/PqGp4L6eSV/rFjPh0E6FW
         99VoN9CtTB5cO2VxtKqGwV6ScRb/lTBaTJTgMsoEgu/vgMEgTgA47jtlbeaGDrcYMqiv
         wBVBnSOUtIpqeiq6M8iC02cZBYzwgd5ME5DNvKbU5E0ObpljuFPYjWUxH86fYYoV3P5V
         ulEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795020605; x=1795625405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
        b=sebOtgOhU/ELLyAHNnEqrSMxoLxSfINHqXp9xUQmJqnlBUy6SbqfKVc+Omk8J2uvlC
         F9cH7l1OQvHDQDQzC5Gd37GwRQGaTZxKIQi6O+7vKsQlrAEk2uk4y/D1QeEXm1Mq4/mA
         pFWLgEfjU0NdusGKPVScTP6nGmDtmIaynP6tHYuXMJO5tWPCQdMan16qyKEz2dHgaAcS
         hUebkOfLfMV3CirhcV5CLEyDT8oznBjpUeBUsildxDO4Z55L12oORrfYHpfS6lwcguce
         8CbAtzqk/G/WWZ17wFnAE6s6VXKzlgxwJzP8n0NAYigsL0cN33gow3NtIbyPw71ofsGh
         4TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795020605; x=1795625405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmkZHXBmjri2IPEtvf2Tq64RWcFCsPi4YttXc86znUY=;
        b=uNZcUnO96400nzeUDwFGBhqApt0Z6Kc+xIqUGTsvI9i7VKDryCcLU7MNSlWPl7GR+h
         U+Ba2hs9pnD+Bp5uG415X9htvmluaGT382y091ECCJ3tqEsWBYDfIakBaishz+cpJFGL
         Te9Wti49RwZa+OYsjvjux1adX7pDAS2fmiEix/d/snBOjil/O/PpPaC3crR47C4/zRKM
         4RqZmf2r2Nn4kpRmoeImDk07qI2eJhNAsET/RXellgkWjKtXMUcMlp/bC6ISj06v/sQw
         E7PB6/T1D2+JsJUa2Shwio5x9/VW/qlW260nCwUeeHFSn6wsilsd8XyOB5qASSkUXflx
         qwoQ==
X-Forwarded-Encrypted: i=1; AL+hErFw03vmZsfvk19vcTNaOpxXrcZrzfwR4F1wUxe6Tp7VJ6Q8euacK5BOXlIz1gISgcQF4Cks3GShzD8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+2mzTkYxFf8w296q4hY3CSakVsEjkSOfru/2JRX3n4O32BtvA3
	4TjBdf3jdGapZV4z+cxNUK4Iif7wqBUrj7h+lrA+jqyomb5kg1pCRjXawsKZuk0YmoN/JIGYne7
	KOsR5FobjT3e4jKf9aM9D0gx1cRQTQ76FUp1P7vs=
X-Gm-Gg: AZFdTZc5eMAalxnpPUystTuXnPVa7Q0M17RBuxggqHXeGHY9/Bsvm8bBUtXY54kfa4E
	FU9/86Yspxu3PdU9XafrW7FeD+cXTxD3FV80fhlhePswkGS0Oi89GqGWgmI683jVDFwPC/oHHGI
	RZFolaMgsg1W/Aw6dH6p/CDJauznFfdEfgOT95KdhlNCwPqPvH50MgJm9dvkZxPw/q45JVQrFhc
	+qS3g5obDUbd++oDg4l5nGyHecHtxHNHfSUiUFkouiBUfxOdPY4fqoSZcsPdgkMOiwnBuLTsjZI
	hozZQb82U6fHPYwugoEcSpl3Ecid08WNJl9FxzPG2p3BNXgYwBsJtpZVSXJuEoudNOFQPTZzZTu
	G+Zju9hChEz2rvQD/UHvMOxcBp62NJkqcozu3xt3iFZ8b+xQvJEau4GLsE13iKuKp7UbN6OM4yD
	BaQ12A4GDTEXcGewRnaB+oPSd2ti9zWxWsNJ0LQJnh3UvMhmJ3Gg5AmLcawGglKuiNYdd4rZIGF
	BUP4YBzMH2qccVFeQDxHcNBQXghaQ==
X-Received: by 2002:a05:6122:8b1a:b0:5ee:40e0:482d with SMTP id
 71dfb90a1353d-5ee645eebbemr1908245e0c.3.1795020604679; Wed, 18 Nov 2026
 08:50:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-submit-rawnand-timing-recovery-v1-v1-1-1cc33723e052@gmail.com>
 <874idejux6.fsf@bootlin.com>
In-Reply-To: <874idejux6.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 09:49:52 -0700
X-Gm-Features: Aa3M54oA-NhlWDrlV5o4l_cAgJ4pKdNdRQHVkaAuLvVQxEV9MUhD02iNL28zf5k
Message-ID: <CADvTj4or-XBJCp3oUh2T438Tf5kB0vfecNzOV+haisVrLKW9vA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: propagate timing-mode recovery failures
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085006_258630_506F7313 
X-CRM114-Status: GOOD (  20.47  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMzoyOOKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTEvMjAyNiBhdCAyMzoxMzoxOCAt
MDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+
ID4gV2hlbiBHRVRfRkVBVFVSRVMgc3VjY2VlZHMgYnV0IHRoZSBjaGlwIGRvZXMgbm90IGFja25v
d2xlZGdlIHRoZSByZXF1ZXN0ZWQKPiA+IHRpbWluZyBtb2RlLCBuYW5kX3NldHVwX2ludGVyZmFj
ZSgpIGZhbGxzIGJhY2sgdG8gbW9kZSAwLiBCb3RoIHRoZQo+ID4gY29udHJvbGxlci1pbnRlcmZh
Y2UgcmVzZXQgYW5kIHRoZSBOQU5EIFJFU0VUIGNvbW1hbmQgY2FuIGZhaWwsIGJ1dCB0aGVpcgo+
ID4gcmV0dXJuIHZhbHVlcyBhcmUgZGlzY2FyZGVkLiBUaGUgZnVuY3Rpb24gdGhlbiByZXR1cm5z
IHRoZSBzdWNjZXNzZnVsCj4gPiBHRVRfRkVBVFVSRVMgc3RhdHVzIGV2ZW4gdGhvdWdoIHRoZSBm
YWxsYmFjayBkaWQgbm90IGNvbXBsZXRlLgo+ID4KPiA+IENoZWNrIHRoZSBjb250cm9sbGVyIHJl
c2V0IGJlZm9yZSBpc3N1aW5nIFJFU0VUIGFuZCBwcm9wYWdhdGUgZWl0aGVyCj4gPiByZWNvdmVy
eSBlcnJvciB3aGVuIHRoZXJlIHdhcyBubyBlYXJsaWVyIGVycm9yLiBQcmVzZXJ2ZSBhbiBlYXJs
aWVyCj4gPiBHRVRfRkVBVFVSRVMgZmFpbHVyZSBhbmQga2VlcCByZXR1cm5pbmcgc3VjY2VzcyB3
aGVuIGEgdGltaW5nIG1pc21hdGNoCj4gPiBpcyByZWNvdmVyZWQgYnkgYSBzdWNjZXNzZnVsIG1v
ZGUtMCBmYWxsYmFjay4KPgo+IFlvdSBhcmUgY2FycnlpbmcgYSByZXR1cm4gdmFsdWUgaW4gYW4g
ZXJyb3IgcGF0aCBvZiBhbiBlcnJvciBwYXRoLiBJZgo+IHRoZSByZXNldCBhY3R1YWxseSBmYWls
cywgdGhlIHZlcnkgbmV4dCBhdHRlbXB0IHdpbGwgZmFpbCBhbmQgcHJvYmUgd2lsbAo+IGJlIGFi
b3J0ZWQgYW55d2F5LiBTbyB3aGlsZSB0aGUgZml4IGlzIG5vdCBpbmhlcmVudGx5IHdyb25nLCB0
aGUgdGl0bGUKPiBhbmQgY29tbWl0IGxvZyBvdmVyc3RhdGUgdGhlIHByb2JsZW0uCj4KPiBNeSBw
cm9wb3NhbDoKPgo+IG10ZDogcmF3bmFuZDogcHJvcGFnYXRlIG1vZGUtMCBmYWxsYmFjayBmYWls
dXJlcwo+Cj4gV2hlbiBhIGNoaXAgZG9lcyBub3QgYWNrbm93bGVkZ2UgdGhlIHJlcXVlc3RlZCB0
aW1pbmcgbW9kZSwKPiBuYW5kX3NldHVwX2ludGVyZmFjZSgpIGZhbGxzIGJhY2sgdG8gbW9kZSAw
IGJ5IHJlc2V0dGluZyB0aGUgY29udHJvbGxlcgo+IGludGVyZmFjZSBhbmQgaXNzdWluZyBhIE5B
TkQgUkVTRVQuIEVpdGhlciBzdGVwIGNhbiBmYWlsOyByZXR1cm5pbmcKPiBzdWNjZXNzIHdpbGwg
bGlrZWx5IGxlYWQgdG8gYW55IGxhdGVyIGF0dGVtcHQgYXQgdGFsa2luZyB0byB0aGUgY2hpcCB0
bwo+IGZhaWwuCj4KPiBNYWtlIHN1cmUgdGhlIGVycm9yIHBhdGggcHJvcGFnYXRlcyB0aG9zZSBm
YWlsdXJlcyBpbiB0aGUgbW9kZS0wCj4gZmFsbGJhY2sgY2FzZS4KClRoZXJlIGlzIGFsc28gYSBj
YWxsZXIgb3V0c2lkZSBwcm9iZTogbmFuZF9kb193cml0ZV9vb2IoKSBjYWxscwpuYW5kX3Jlc2V0
KCksIHdoaWNoIGNhbGxzIG5hbmRfc2V0dXBfaW50ZXJmYWNlKCkuIElmIEdFVF9GRUFUVVJFUwpy
ZXBvcnRzIGEgZGlmZmVyZW50IHRpbWluZyBtb2RlIGFuZCB0aGUgZmFsbGJhY2sgZmFpbHMsIG5h
bmRfcmVzZXQoKQpjdXJyZW50bHkgcmV0dXJucyBzdWNjZXNzIGFuZCB0aGUgT09CIHdyaXRlIGNv
bnRpbnVlcyBwYXN0IGl0cyByZXNldApjaGVjay4gUHJvcGFnYXRpbmcgdGhlIGZhbGxiYWNrIGVy
cm9yIGxldHMgdGhlIHdyaXRlIHN0b3AgdGhlcmUuCgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
