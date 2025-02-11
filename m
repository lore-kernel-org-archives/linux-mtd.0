Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8387C0219D
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2025 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWvo5/ioYPBf/r+qRRs9dotoxgS0t6nl7GDFwY84Kts=; b=vOkQ1s8bM7cUmb
	TO5lFsVzl1RjP8wGtZ3DI4MAHWRIdTjI0mR4GJonLRwNU4ek35mVHMLH+mAXDWTbj3BtausP6187N
	G4Wt1uQi7qigV91zYFOkqiH8TAsrLLMHWjxtmbgek+TPi8pLRh9ffALkuXC1ATYCg85JAmdguo0Bq
	FEdXDgKcGxQmUGfKESbICWTzDF23hOeALyZLlV90yKwSd+hWj7iKbWPthkJdxKIxFmptG22prSxWj
	o8tZa9IEKWVqgIlVDUGVYrMi1L8Gfi9/nh+DvhFrDzPUqwqL0dJP4Q/wW/j1hDC60QgjGsXg64pns
	s4nqkCBge4zyepgigFMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlSj-00000002y7Q-2Vq6;
	Tue, 11 Feb 2025 08:17:45 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlSh-00000002y6D-0kv3
	for linux-mtd@lists.infradead.org;
	Tue, 11 Feb 2025 08:17:44 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fa19e1d027so6710374a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2025 00:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739261862; x=1739866662; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdSSN9QdNBs8eEdHrDTlxqtSDnLAK0QjbdfY2BqTAsQ=;
        b=kF0Q3zMX5M4a+S/KzkxsD7js0zJlfHP2XYVGDKQlOKf44zJgnLfKM3c+TDRQxX/ibD
         l/BtbFO8RQai4XoqURpSIHhLfYfRyVflPvXfWc4dFWuGeyYYxwU9/syWRBv9rqlvPSSQ
         1sYK8dYHT110oxHgvUnqkk1/o9X8+IeC8oZw3kTYt/3H81edRllyhfNGy8NsgYXkf38J
         nNcS9Ghmk5AQ6lsVUofZB+TqlmIFAql5GC3bc05wBG2RpF8Vcfg1Su0Af/y/0JXixHDC
         qvuAUJ6HKRX0ft1XQrqlIZFXFNyS7odVbb2iXlEMs4fVTd9LZ4MECsOduzrWloBfXUiP
         2xRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261862; x=1739866662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdSSN9QdNBs8eEdHrDTlxqtSDnLAK0QjbdfY2BqTAsQ=;
        b=NatZ5dqrL9cWg988nhjS63rvfwVKoCp+n+PZoa7Uv0wTkeVTDygSKVEBP9uHtFNU1M
         B92Ph6DF9yM0dVTS3wgg8kUA178MCufl3uOE1Bp5FekbZ0W+15+FLCfgxJXAFmYzpH/j
         QNFoRMnbtmU2ZEr6EZ9wAc/Dm9BmxBURYrerSm8mwmwJE7mET71m32uJQMf5unRvNjNn
         xMRcbtRVJ8SBPYrcnESOPiR99l0Sbh9BjVYhDf6P9/0mnqN7zGEeJ5M9ltrMSuP30FcU
         i08d4+0YO55rTqhXr2Ik8N4WDEKhnV7080cL9P/lQN368X/ZMtBzsWS8aChKMTH+inPg
         qylQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8uOcPVz787SD1q578liDrJ9m9ovc+0hMOAbe2aBlXMkhOAf1REq64B4xt4537/ZlxY6fD+YEpV7Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8cUYb4MG86iJHrntQjWTu3u9l9gqHCDEheriH7uKMPNuMKmkn
	WuWYYujhLMbiwJ/fc6xBcjUxDWA+UKrMtBX7/Z7h8tn6zvnYu24IdojOx8LHwgm7nqTg6k2NgW9
	KL05GqpBIsWojd7GQyZBc3vBHAv8=
X-Gm-Gg: ASbGncsINTLDqjNJV13K075dKov1mmoNs8rEYey9vCY57GaUQhC/gAyZFVGdN1khlza
	MJ9po2Zd9IApDKzdMmWcImIibWkbamnjljjfN9ADpH3vCln0rJvTDM2g05VjLd0iHJU+xkCmd
X-Google-Smtp-Source: AGHT+IHB7b6T1cEPsukDgawzfpT3y4WANIOfYvlFKXg8jqnneqHuIIRpHG6i6Ao4zutuAREPOypukRqUnjaQG9qIQsU=
X-Received: by 2002:a17:90b:38d2:b0:2ee:48bf:7dc3 with SMTP id
 98e67ed59e1d1-2fa241646afmr26941864a91.15.1739261862206; Tue, 11 Feb 2025
 00:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20250122065605.285145-1-linchengming884@gmail.com>
 <20250122065605.285145-2-linchengming884@gmail.com> <878qqj3sju.fsf@bootlin.com>
 <CAAyq3SZF9eGKfLLcC3zFHq85-AEb9B=Grjqfap8QqCUKLdLSVw@mail.gmail.com> <87frkmt8nu.fsf@bootlin.com>
In-Reply-To: <87frkmt8nu.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 11 Feb 2025 16:13:32 +0800
X-Gm-Features: AWEUYZnQPGM-zFSvmWzAgGExzap-pa5ZcJ795qZ6jg4sRRk3MfEEdZQSlSWjS1E
Message-ID: <CAAyq3Sa9+FZGiGnBV=KbwVnQhWX-vc21CK75OXSnDDsE89mx1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_001743_215305_E8C0BC29 
X-CRM114-Status: GOOD (  14.53  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQy5pyIMTDml6Ug6YCx5LiAIOS4i+WNiDY6MDflr6vpgZPvvJoKPgo+IEhlbGxvLAo+
Cj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzcGluYW5kLT5zZXRf
cmVhZF9yZXRyeShzcGluYW5kLCByZXRyeV9tb2RlKTsKPiA+PiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7Cj4gPj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGVjY19mYWlsZWQgPSB0cnVlOwo+ID4+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4+Cj4gPj4gU2hhbGwgd2UgdHJ5
IHRvIHNldCB0aGUgcmVhZF9yZXRyeSBsZXZlbCB0byAwIHVwb246Cj4gPj4KPiA+PiAgICAgICBp
ZiAocmV0IDwgMCAmJiByZXRyeV9tb2RlID4gMSkKPiA+Pgo+ID4+ID8KPiA+Cj4gPiBJZiB3ZSBz
ZXQgdGhlIHJlYWRfcmV0cnkgbGV2ZWwgdG8gMCB1cG9uLCBhbmQgc2V0X3JlYWRfcmV0cnkgZmFp
bHMKPiA+IHdoZW4gcmV0cnlfbW9kZSBlcXVhbHMgdG8gMSwgaXQgd29uJ3QgcmV0dXJuIGFuIGVy
cm9yLiBUaGlzIGNvdWxkCj4gPiBwb3RlbnRpYWxseSBtYXNrIGFuIHVuZGVybHlpbmcgaXNzdWUu
Cj4KPiBEb24ndCBzYXZlIHRoZSByZXR1cm4gdmFsdWUgaW4gdGhpcyBjYXNlPyBCdXQgb3RoZXJ3
aXNlIHlvdSB3b3VsZCBsZWF2ZQo+IHRoZSBjaGlwIGluIGEgcmV0cnkgc3RhdGUsIG5vPwoKSG93
ZXZlciwgaWYgd2Ugc2V0IHRoZSByZWFkX3JldHJ5IGxldmVsIHRvIDAgdXBvbiwgdGhlIGNoaXAg
d291bGQgc3RpbGwKcmVtYWluIGluIHRoZSByZXRyeSBzdGF0ZSBpZiBzZXRfcmVhZF9yZXRyeSBm
YWlscy4KCkkgY29tZSB1cCB3aXRoIGEgc29sdXRpb246IHNldHRpbmcgdGhlIHJlYWRfcmV0cnkg
bGV2ZWwgdG8gMCByaWdodCBiZWZvcmUKdGhlIHJlYWRfcmV0cnkgbGFiZWwuIFRoaXMgZW5zdXJl
cyB0aGF0IHN1YnNlcXVlbnQgcmVhZHMgYWx3YXlzIHN0YXJ0CmZyb20gbGV2ZWwgMCwgYW5kIGl0
IGVsaW1pbmF0ZXMgdGhlIG5lZWQgdG8gcmVzZXQgdGhlIHJlYWRfcmV0cnkgbGV2ZWwgYXQKdGhl
IGVuZC4KCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
