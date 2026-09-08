Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9982DC79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aaX/snfd2Md+l8pJfwvMTkDip3VoIB1NpUMH++NF9E=; b=ynJcyFyGwAmnU4
	pfArMskmr5Eh3OEus3G7kbvvHvDKW+LX8uqwKmJ8Af50lxnB0vY2JPlA8COsCujBfiF2bBMYhlydF
	OeEauJWpASQGxQ7hmpNTCZdTlQ6Zf2G9ue93FqfBiVNvijpX5v6/COotJI/MyttvnUCKaIwFwSyBH
	19HyL3YIHavJLTGiPR51ZU4Gqw/V6PtDv59coa6k+a+tKcKt0Ow9Tr1WQarLnGQgVXHL1WdvJuIVI
	JNLr5OBIr/rouJudH1wz5NAYypjKDRi2QS8GXBIzcJjCLQp5AY9E1M58W1qbxELiziG37YzAQ1/RQ
	BIE09Chbj7pZNXCeqTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41XW-0000000A4nI-1iNr;
	Tue, 08 Sep 2026 19:31:30 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41XT-0000000A4m2-1UfS
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 19:31:28 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so2976615f8f.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 12:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895885; x=1789500685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bnI1itulTesLodw5EkiLefmn13ex/6XxibeK3IHMIsk=;
        b=ASraNQwp+sdCoeyBriXZ+2/kwm5u5sg/mSUNupeJBPxTBy20gaW7AVOBmhejkGeMIG
         DgEJBCZInHIVYOP9ivM1IzO/Mob7z/WYzcP/Sn2yTfDYwrSt+92n6iXGUACj7fjREZSP
         nKRwchE6LQIbmKFruBOzv+iv+ZU3Yp4YWoe8ZZdk7z5ecTJ5aYCuBzfwrCDYsxcRuRSc
         bWaz2GKGxR2RHnVJkcvepTQZmYGeeltWfNdBkPC/KBVaF3zpCMrx54/ZbB2TONJW6FNc
         MCvK/lDq9JG8la7F93+oRLl3tt+FVTUAR7sr1Zx04fwl8WTzbeodXE8RaCtLoI5cplUd
         04RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895885; x=1789500685;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bnI1itulTesLodw5EkiLefmn13ex/6XxibeK3IHMIsk=;
        b=n55ObdHt5nYb2nxh08Nvq8j6fF5OZJOKsU5cERwHF0Hxmz4WP1KTllwwzeOxqw04LQ
         LDWtDvts7QXJspYYsfm4eI+nMnR/Jfqn55kf2sGZMSzlxuqj/WK8ykT/G/6EhwWkJdcj
         ezpkDKjkTNRB1/cFNPTa4hcNh0Inh0z78TkXFW5io3q6SeJ8htr1ZnnE1OY33LRbkXyd
         mFsoBYzMEzDSE6cEhbgjqQ8T7f0NeTcSRQmcOfhZfE5Lj56qleIoWrxyDItmUX1nq+uZ
         zKZPwWRdIWVLAoK60BaITxUHFEg6jZjJi7GgkRYraz7U7tRoxnUgVVpCMzXe+XsyML9E
         TWAw==
X-Forwarded-Encrypted: i=1; AKwUvBxIkkTi6fzCCxZ1sSG9C3ahZqAuzXoVEKSBpkASbKwCHiZuMaajyn0ll4jgo1AmYbADZbbZSX2A/NU=@lists.infradead.org
X-Gm-Message-State: AFuF++nsg5I9Ro/3m6ZNK8a1i+kaykzdajt872uff2KzJWLsVXUEFN5Z
	7OJbcdLb6s2JoGsE3pkmbWp7PFJJXtOc1e0NlXxYi+pwwMhIG504WPW2
X-Gm-Gg: AYBFou25lWTUn25X7AjJa/TSHCe5jb/6W+in+4g4PEPQxpC3in84rEhA6f5FOiOQxfj
	CEkh8GgDOOb/U1W1sOcmosSSgYNcqU/Ei9KdGLWfJKKYcU6mEekOGl5ZitsyngmEst28uAARX/6
	t3LG4BaIFtKCi1pVfrYUPdEMvBbxNwA4WiIJcrss6il9gQ3EdXNVF/WEhxcGXB5N9hJhT/MjuvS
	lnxVxSxpBW7AWV1QGGFI4d8S24i8kkif6udjGXpub89pVknUnVREk+OWJQH0PzLGPRBEPCL2nC2
	hirDc7BlG2p0Xa+vR8dEDj3ax2Vbc88y1Ky0zHSNGin3iUXrJFCbKfG43n3V9CTcx+27uMCsp6z
	K9+ko4WrUX1sWjwrFASeMJs7pZ3Nvqs0gHlcqjSH+HPxJO3MUERzFb6FArW5x0DtcpjWSWnrhkU
	1OEYzULJTx3Hj9or8zAowB+01rPg/5Fopz28IHl7/I9Xe7I/NFRi2WvNk5Z1Spdv55PN2IYoVrr
	rM+4XQZokVkwPnv1WsY4sWTppoKc/i1CEfh9A==
X-Received: by 2002:a05:6000:470a:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-4858707f262mr33763744f8f.1.1788895884671;
        Tue, 08 Sep 2026 12:31:24 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485aa2c9acasm2597169f8f.36.2026.09.08.12.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 12:31:24 -0700 (PDT)
Message-ID: <5231553f-c24d-4bae-a73e-1f2af8c13636@gmail.com>
Date: Tue, 8 Sep 2026 21:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: publish the ECC context to
 snandc->qspi
Content-Language: hu
To: Johan Alvarado <contact@c127.dev>, broonie@kernel.org,
 md.alam@oss.qualcomm.com
Cc: konradybcio@kernel.org, pengpeng@iscas.ac.cn, miquel.raynal@bootlin.com,
 quic_varada@quicinc.com, quic_srichara@quicinc.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260825013848.1056946-1-contact@c127.dev>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260825013848.1056946-1-contact@c127.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_123127_437024_EB71B57A 
X-CRM114-Status: GOOD (  29.89  )
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

SGkgSm9oYW4sCgoyMDI2LiAwOC4gMjUuIDM6Mzgga2VsdGV6w6lzc2VsLCBKb2hhbiBBbHZhcmFk
byDDrXJ0YToKPiBxY29tX3NwaV9vb2JsYXlvdXRfZWNjKCkgYW5kIHFjb21fc3BpX29vYmxheW91
dF9mcmVlKCkgcmVhZCB0aGUgRUNDCj4gY29uZmlndXJhdGlvbiB0aHJvdWdoIHNuYW5kYy0+cXNw
aS0+ZWNjLiBxY29tX3NwaV9wcm9iZSgpIHBvaW50cyBpdCBhdCBhCj4gemVyb2VkIHNjcmF0Y2gg
c3RydWN0IGFuZCBvbmx5IHFjb21fc3BpX2VjY19wcmVwYXJlX2lvX3JlcV9waXBlbGluZWQoKSwK
PiB3aGljaCBydW5zIG9uIHBhZ2UgSS9PLCBldmVyIHVwZGF0ZXMgaXQuIHFjb21fc3BpX2VjY19p
bml0X2N0eF9waXBlbGluZWQoKQo+IGluc3RhbGxzIHRoZSBvb2JsYXlvdXQgYnV0IGRvZXMgbm90
IHB1Ymxpc2ggdGhlIGNvbnRleHQgaXQganVzdAo+IGFsbG9jYXRlZCwgYW5kIHFjb21fc3BpX2Vj
Y19jbGVhbnVwX2N0eF9waXBlbGluZWQoKSBmcmVlcyB0aGF0IGNvbnRleHQKPiB3aXRob3V0IGNs
ZWFyaW5nIHRoZSBwb2ludGVyLgo+IAo+IHNwaW5hbmRfaW5pdCgpIGNhbGxzIG10ZF9vb2JsYXlv
dXRfY291bnRfZnJlZWJ5dGVzKCkgcmlnaHQgYWZ0ZXIgdGhlIEVDQwo+IGNvbnRleHQgaXMgY3Jl
YXRlZCBhbmQgYmVmb3JlIGFueSBwYWdlIEkvTywgc28gdGhlIG9vYmxheW91dCBhbHdheXMgcnVu
cwo+IGFnYWluc3QgYSBwb2ludGVyIHRoYXQgZG9lcyBub3QgZGVzY3JpYmUgdGhlIGN1cnJlbnQg
Y29udGV4dDoKPiAKPiAgIC0gT24gYSBmaXJzdCBwcm9iZSBpdCByZWFkcyB0aGUgemVyb2VkIHN0
cnVjdCBmcm9tIHFjb21fc3BpX3Byb2JlKCksCj4gICAgIHNvIHN0ZXBzLCBieXRlcyBhbmQgYmJt
X3NpemUgYXJlIDAuIFRoZSBjb3VudCB0aGVuIHJldHVybnMgMCByYXRoZXIKPiAgICAgdGhhbiBh
biBlcnJvciwgc28gdGhlIHByb2JlIGNvbnRpbnVlcyB3aXRoIG10ZC0+b29iYXZhaWwgc2V0IHRv
IDAuCj4gCj4gICAtIE9uIGEgcHJvYmUgcmV0cnkgaXQgcmVhZHMgdGhlIGVjY19jZmcgdGhlIHBy
ZXZpb3VzIGF0dGVtcHQgZnJlZWQuCj4gCj4gQSByZXRyeSBpcyBlYXN5IHRvIGhpdC4gT24gSVBR
NTAxOCB3aXRoIHRoZSBxY29tLHNtZW0tcGFydCBwYXJzZXIgdGhlCj4gcGFydGl0aW9uIHBhcnNl
IHJldHVybnMgLUVQUk9CRV9ERUZFUiB1bnRpbCBTTUVNIGhhcyBwcm9iZWQsIHNvIHRoZQo+IGZp
cnN0IHNwaS1uYW5kIHByb2JlIGRlZmVycy4gSXQgZGVmZXJzIGluc2lkZQo+IG10ZF9kZXZpY2Vf
cGFyc2VfcmVnaXN0ZXIoKSwgYWZ0ZXIgbXRkX290cF9udm1lbV9hZGQoKSBoYXMgYWxyZWFkeSBy
ZWFkCj4gdGhlIGZhY3RvcnkgT1RQIC0gdGhhdCByZWFkIGdvZXMgdGhyb3VnaCBwcmVwYXJlX2lv
X3JlcSBhbmQgbGVhdmVzCj4gc25hbmRjLT5xc3BpLT5lY2MgcG9pbnRpbmcgYXQgdGhlIGNvbnRl
eHQgdGhhdCBzcGluYW5kX2NsZWFudXAoKSB0aGVuCj4gZnJlZXMuIFRoZSBzZWNvbmQgcHJvYmUg
YWxsb2NhdGVzIGEgbmV3IGNvbnRleHQsIG5ldmVyIHB1Ymxpc2hlcyBpdCwgYW5kCj4gY29tcHV0
ZXMgdGhlIE9PQiBsYXlvdXQgZnJvbSB0aGUgZnJlZWQgb25lLiBPbmNlIHRoZSBzbGFiIGhhcyBi
ZWVuCj4gcmV1c2VkLCBxZWNjLT5zdGVwcyBob2xkcyBnYXJiYWdlIGFuZAo+IAo+ICAgb29icmVn
aW9uLT5sZW5ndGggPSBxZWNjLT5zdGVwcyAqIDQ7Cj4gCj4gZ29lcyBuZWdhdGl2ZS4gcWNvbV9z
cGlfb29ibGF5b3V0X2ZyZWUoKSBvbmx5IHJlcG9ydHMgLUVSQU5HRSBmb3IKPiBzZWN0aW9uIDEg
YW5kIGxhdGVyLCBzbyBtdGRfb29ibGF5b3V0X2NvdW50X2J5dGVzKCkgc3VtcyB0aGUgcmVnaW9u
cyBhbmQKPiByZXR1cm5zIHRoYXQgbmVnYXRpdmUgbGVuZ3RoIGFzIHRoZSBieXRlIGNvdW50LiBU
aGUgLTUxMiBiZWxvdyBpcwo+IHN0ZXBzICogNCB3aXRoIHN0ZXBzID09IC0xMjguIEl0IGlzIGEg
Ynl0ZSBjb3VudCB0aGF0IGhhcHBlbnMgdG8KPiBjb2xsaWRlIHdpdGggLUVSRVNUQVJUU1lTLCBu
b3QgYW4gZXJyb3IgdGhlIGRyaXZlciByZXR1cm5lZC4KPiBzcGluYW5kX2luaXQoKSB0YWtlcyBp
dCBhcyBhbiBlcnJvciwgYW5kIGJlY2F1c2UgaXQgaXMgbm90Cj4gLUVQUk9CRV9ERUZFUiB0aGUg
ZHJpdmVyIGNvcmUgbmV2ZXIgcmV0cmllcyBhbmQgdGhlIE5BTkQgbmV2ZXIgYXBwZWFyczoKPiAK
PiAgIHNwaS1uYW5kIHNwaTAuMDogRVNNVCBTUEkgTkFORCB3YXMgZm91bmQuCj4gICBzcGktbmFu
ZCBzcGkwLjA6IHByb2JlIHdpdGggZHJpdmVyIHNwaS1uYW5kIGZhaWxlZCB3aXRoIGVycm9yIC01
MTIKPiAgIFVCSSBlcnJvcjogY2Fubm90IG9wZW4gbXRkIHJvb3RmcywgZXJyb3IgLTIKPiAgIFdh
aXRpbmcgZm9yIHJvb3QgZGV2aWNlIC9kZXYvdWJpYmxvY2swXzEuLi4KPiAKPiBPbiBhIE1lcmN1
c3lzIE1SODBYIChJUFE1MDE4LCBFU01UIEY1MEQxRzQxTEIpIGFib3V0IGhhbGYgb2YgdGhlIGJv
b3RzCj4gZmFpbGVkIHRvIG1vdW50IHRoZSByb290ZnMsIHRoZSBvdXRjb21lIGRlcGVuZGluZyBv
biB3aGV0aGVyIHRoZSBmcmVlZAo+IG1lbW9yeSBoYWQgYmVlbiBvdmVyd3JpdHRlbiB5ZXQuCj4g
Cj4gUHVibGlzaCB0aGUgY29udGV4dCB3aGVuIGl0IGlzIGNyZWF0ZWQgYW5kIGNsZWFyIHRoZSBw
b2ludGVyIHdoZW4gaXQgaXMKPiBkZXN0cm95ZWQuIENsZWFyaW5nIGxlYXZlcyBzbmFuZGMtPnFz
cGktPmVjYyBOVUxMIGFmdGVyIGNsZWFudXAsIHdoaWNoCj4gaXMgc2FmZTogdGhlIG10ZCBpcyB1
bnJlZ2lzdGVyZWQgYmVmb3JlIGNsZWFudXBfY3R4IHJ1bnMsIHNvIG5vCj4gb29ibGF5b3V0IGNh
bGxiYWNrIGNhbiBmb2xsb3cuCj4gCj4gRml4ZXM6IDczMDRkMTkwOTA4MCAoInNwaTogc3BpLXFw
aWM6IGFkZCBkcml2ZXIgZm9yIFFDT00gU1BJIE5BTkQgZmxhc2ggSW50ZXJmYWNlIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEFsdmFyYWRvIDxj
b250YWN0QGMxMjcuZGV2Pgo+IC0tLQo+IFRlc3RlZCBvbiBhIE1lcmN1c3lzIE1SODBYIChJUFE1
MDE4LCBFU01UIEY1MEQxRzQxTEIpIHJ1bm5pbmcgNi4xOC40NAo+IHdpdGggdGhlIGVxdWl2YWxl
bnQgY2hhbmdlOyBtYWlubGluZSBidWlsZC10ZXN0ZWQgd2l0aCBXPTEsIG5vIHdhcm5pbmdzLgoK
VGVzdGVkLWJ5OiBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KClRlc3RlZCBvbiB0b3Ag
b2YgdjcuMy1yYzIsIHJ1bm5pbmcgb24gdGhlIFRwLUxpbmsgQXJjaGVyIEFYNTUgdjEuIEl0IHdv
cmtzIGFzCmV4cGVjdGVkLCB5ZXQgSSBoYXZlIHNvbWUgY29tbWVudHMsIHNlZSBiZWxvdy4KCj4g
Cj4gIGRyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1xcGlj
LXNuYW5kLmMgYi9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5jCj4gaW5kZXggNjFiMWYyZWIx
OWNlLi4wZDBhZTkzYWQ0YmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25h
bmQuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPiBAQCAtNDExLDYgKzQx
MSw4IEBAIHN0YXRpYyBpbnQgcWNvbV9zcGlfZWNjX2luaXRfY3R4X3BpcGVsaW5lZChzdHJ1Y3Qg
bmFuZF9kZXZpY2UgKm5hbmQpCj4gIAlkZXZfZGJnKHNuYW5kYy0+ZGV2LCAiRUNDIHN0cmVuZ3Ro
OiAldSBiaXRzIHBlciAldSBieXRlc1xuIiwKPiAgCQllY2NfY2ZnLT5zdHJlbmd0aCwgZWNjX2Nm
Zy0+c3RlcF9zaXplKTsKPiAgCj4gKwlzbmFuZGMtPnFzcGktPmVjYyA9IGVjY19jZmc7CgpGb3Ig
dGhlIHNha2Ugb2YgY29tcGxldGVuZXNzIHdlIHNob3VsZCByZW1vdmUgdGhlIGlkZW50aWNhbCBh
c3NpZ25tZW50IGZyb20gdGhlCnFjb21fc3BpX2VjY19wcmVwYXJlX2lvX3JlcV9waXBlbGluZWQo
KSBmdW5jdGlvbiBhcyBpdCBnZXRzIHJlZHVuZGFudCBhZnRlciB0aGUKY2hhbmdlLgoKQWRkaXRp
b25hbGx5LCB0aGUgemVyb2VkIGVjY19jZmcgaW5zdGFuY2UgYWxsb2NhdGVkIGluIHFjb21fc3Bp
X3Byb2JlKCkgYmVjb21lCnVudXNlZCBzbyB0aGUgYWxsb2NhdGlvbiBjYW4gYmUgZHJvcHBlZC4g
SG93ZXZlciwgc2luY2UgdGhpcyBpcyBub3Qgc3RyaWN0bHkKcmVxdWlyZWQgZm9yIGZpeGluZyB0
aGUgdXNlLWFmdGVyLWZyZWUgaXNzdWUsIGl0IGNvdWxkIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBw
YXRjaC4KClJlZ2FyZHMsCkdhYm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
