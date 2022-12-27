Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54905C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Dec 2022 13:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7ACLGml7HucoeJ0kSM3Pb4D6aC+ku/nXcKRXGmg+CI=; b=CKHitWcFWvxHtU
	rTyPcfju6uTcg6CJqzy8rNBGuOO+1UYPuuEyOWCtFFLkcX/qy3R3WVbtP8q2SIKktkP8QqcBKkpdJ
	oixM4mHq6rr7wAOL7uy36tqEmpL4XKUXF3i+kRuWqgr9CyKJDXsRb/X+Qd80k20DDvCFSe2oT9cGj
	x+7VyYMGkJb7WArhlTM308d0wNJI7W1lClilWv5RaHy6sqacjI/pDdakKTqM9OmY6xnOvFUUQGlbh
	efsABnsTdJFYL4u0OUYHgn108aij8+CphCAeR7E7P1DQqoL+GfUs5hhqNSZO8Z4xFd9ePTELSgVij
	3BhgyxGJJEKav3fSSIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAA0o-00DIMl-Tx; Tue, 27 Dec 2022 13:28:59 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA9wl-00DFwK-RA
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2022 13:24:52 +0000
Received: by mail-ej1-x62d.google.com with SMTP id u9so32047108ejo.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2022 05:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H3ZA4K99KoV8xtIWLMOEToauN5ng5q+nSOJU1SMRa5w=;
        b=Wr0+bZzvHPG2FSnVIYSCvLpV4XkGb7Cp+0jd/IGQ4hFXriQpFt9TlnsYbNuy3gxHwu
         C5J7tE1VggCMV1tbKIDmPboBRXZmnes6msZpI8AijQLWYvCE7B6+ev5c7gNM0CU0FiPM
         UXpcwdwboM98oOkI6kq8Zgp5eGBjMCqdwW5SwMp1Ss7lJCzkwPO1yz99i0xMGz4DFgmn
         63wqsAub7nfC598ytse0jsHaykF9/rPVGEakSjlj4/izvgnX1N8spVZJHvoiAUjRPm8y
         MNvR7ilSNAxNvC2591P5lNqx54aqD4Z7kmHj/3UyooApXWRCvOXWg7A+c4PUgpGs00Vf
         aqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H3ZA4K99KoV8xtIWLMOEToauN5ng5q+nSOJU1SMRa5w=;
        b=PuV5jJkmxR2mLHltE4g98tiqtgLJM1z0ttDXacmJnYNOoEFP6R9n8N/oZ2EheFWpJy
         akPmz9Lx2ArK8zDhyTr3VN0stqpo6wH5r7zniKtL1oJfVHKACNCMKjnQ1vTyMSfkscYP
         t2zXZUcI7Cg+oODIVb7XHZpRQdr9FyRHwRKIjFUzu3DvqV0AlwlIhYYC6CyD4YOA7n9P
         gH774O3pvo5A8FNxYtYsT+TBBezZmU3NqefZ2vzKZjQDLkfXK4Iyo6lrMdqsroXhOyr2
         trsVjbo8y4KrHzpe3Y0PTYH6ivbxwS3/V0VST1ctzMU7RyXcYYJyBTFHhafTcUuNYq6I
         L7Ng==
X-Gm-Message-State: AFqh2krZ5XrqkjNS6Mej1R9NzHKZDkwFgU2GnLOCK8reaiICjbtdYWNs
	qx6i+VKIAcl3VVoERGCXUI2t7A==
X-Google-Smtp-Source: AMrXdXvC9W4RKBZ6i2zN04Rln5WWxwZwzURAge146Q8l27t9zdmSXNFqnm4hgDtjKdnPqzsjcg2vyA==
X-Received: by 2002:a17:906:c18d:b0:843:770e:777f with SMTP id g13-20020a170906c18d00b00843770e777fmr15956000ejz.24.1672147469751;
        Tue, 27 Dec 2022 05:24:29 -0800 (PST)
Received: from [192.168.0.104] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id lb26-20020a170907785a00b0084b8979fc5bsm4491911ejc.43.2022.12.27.05.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 05:24:29 -0800 (PST)
Message-ID: <abf7dc0e-df13-25ae-83b7-204eee0189d4@linaro.org>
Date: Tue, 27 Dec 2022 15:24:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 3/3] mtd: spi-nor: Add support for IS25LX256 operating
 in 1S-8S-8S octal read mode
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20221202135539.271936-1-nathan.morrison@timesys.com>
 <20221202135539.271936-4-nathan.morrison@timesys.com>
 <9927a8c3-40cf-2c69-46c6-f660ff2422b1@linaro.org>
 <eafebda5-7342-dfa9-7745-543d5f7d6f3d@linaro.org>
 <14b5fc24d0e9391807768c595a4277ee@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <14b5fc24d0e9391807768c595a4277ee@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_052448_480776_70655F5F 
X-CRM114-Status: GOOD (  24.20  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyNy4xMi4yMDIyIDE0OjM3LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMTIt
MjYgMDk6MTcsIHNjaHJpZWIgVHVkb3IgQW1iYXJ1czoKPj4gT24gMjYuMTIuMjAyMiAxMDowNCwg
VHVkb3IgQW1iYXJ1cyB3cm90ZToKPj4+IEhpLCBOYXRoYW4sCj4+Pgo+Pj4gVGhlIHNlcmllcyBp
cyBzdGFydGluZyB0byBsb29rIGdvb2QsIGJ1dCBJJ2xsIG5lZWQgYW5vdGhlciB2ZXJzaW9uLAo+
Pj4gcGxlYXNlLgo+Pj4KPj4+IE9uIDAyLjEyLjIwMjIgMTU6NTUsIE5hdGhhbiBCYXJyZXR0LU1v
cnJpc29uIHdyb3RlOgo+Pj4+IFRoaXMgYWRkcyB0aGUgSVMyNUxYMjU2IGNoaXAgaW50byB0aGUg
SVNTSSBmbGFzaF9pbmZvIHBhcnRzIHRhYmxlCj4+Pgo+Pj4gRGVzY3JpYmUgeW91ciBjaGFuZ2Vz
IGluIGltcGVyYXRpdmUgbW9vZCwgZS5nLiAiQWRkIHN1cHBvcnQgZm9yCj4+PiBTMjVMWDI1NiIg
aW5zdGVhZCBvZiAiVGhpcyBhZGRzIC4uLiIKPj4+Cj4+PiBJdCBtYXkgd29ydGggdG8gcmUtcmVh
ZAo+Pj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdWJt
aXR0aW5nLXBhdGNoZXMuaHRtbAo+Pj4gb25jZSBpbiBhIHdoaWxlLgo+Pj4KPj4+Pgo+Pj4+IFNp
Z25lZC1vZmYtYnk6IE5hdGhhbiBCYXJyZXR0LU1vcnJpc29uIDxuYXRoYW4ubW9ycmlzb25AdGlt
ZXN5cy5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAzMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9pc3NpLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+Pj4+IGluZGV4IDg5YTY2
YTE5ZDc1NC4uMzYyYmMzNjAzZDhmIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1u
b3IvaXNzaS5jCj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKPj4+PiBAQCAt
MjksNiArMjksMzUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyAKPj4+PiBp
czI1bHAyNTZfZml4dXBzID0gewo+Pj4+IMKgwqDCoMKgwqAgLnBvc3RfYmZwdCA9IGlzMjVscDI1
Nl9wb3N0X2JmcHRfZml4dXBzLAo+Pj4+IMKgIH07Cj4+Pj4gK3N0YXRpYyBpbnQKPj4+PiAraXMy
NWx4MjU2X3Bvc3RfYmZwdF9maXh1cHMoc3RydWN0IHNwaV9ub3IgKm5vciwKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVy
ICpiZnB0X2hlYWRlciwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBz
dHJ1Y3Qgc2ZkcF9iZnB0ICpiZnB0KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCAvKgo+Pj4+ICvCoMKg
wqDCoCAqIElTMjVMWDI1NiBzdXBwb3J0cyBib3RoIDFTLTFTLThTIGFuZCAxUy04Uy04Uy4KPj4+
PiArwqDCoMKgwqAgKiBIb3dldmVyLCB0aGUgQkZQVCBkb2VzIG5vdCBjb250YWluIGFueSBpbmZv
cm1hdGlvbiBkZW5vdGluZyAKPj4+PiB0aGlzCj4+Pj4gK8KgwqDCoMKgICogZnVuY3Rpb25hbGl0
eSwgc28gdGhlIHByb3BlciBmYXN0IHJlYWQgb3Bjb2RlcyBhcmUgbmV2ZXIgc2V0dXAuCj4+Pj4g
K8KgwqDCoMKgICogV2UncmUgY29ycmVjdGluZyB0aGlzIGlzc3VlIHZpYSB0aGUgZml4dXAgYmVs
b3cuwqAgUGFnZSBwcm9ncmFtCj4+Pj4gK8KgwqDCoMKgICogY29tbWFuZHMgYXJlIGRldGVjdGVk
IGFuZCBzZXR1cCBwcm9wZXJseSB2aWEgdGhlIDRCQUlUIGxvb2t1cC4KPj4+PiArwqDCoMKgwqAg
Ki8KPj4KPj4gV2h5IGRvbid0IHlvdSBzZXQgdGhlIFJFQUQgc3VwcG9ydCB3aGVuIHBhcnNpbmcg
dGhlIDRiYWl0IHRhYmxlPwo+IAo+IFRoYXQgd291bGQgZGV2aWF0ZSBmcm9tIHRoZSByZWFkIGhh
bmRsaW5nIG9mIGFsbCB0aGUgb3RoZXIgbW9kZXMuCgpPaCwgSSBzZWUgbm93LCBzbyB5b3UgbmVl
ZCB0byBhbWVuZCBCRlBUIHdpdGggdGhlIDNCIG9wY29kZXMgc28gdGhhdCB0aGUKNGJhaXQgdGFi
bGUgY29udmVydCB0aGUgM0IgcmVhZCBvcGNvZGVzIHRvIDRCLiBUaGF0J3MgZmluZSwgeWVzLgoK
PiAKPj4gV2UgbmVlZCB0byBzZWUgdGhlIFNGRFAgZHVtcCB0byBkZXRlcm1pbmUgaG93IHdlIHRy
ZWF0IHRoaXMuIEknbSBub3QKPj4gc3VyZSBhIHBvc3RfYmZwdCBob29rIGlzIHRoZSByaWdodCB0
aGluZyB0byBkbyBmb3IgdGhpcyBmbGFzaC4KPiAKPiBTZWU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkL2UwNzEwNWQ0MWVjNjJhNmVlNDdjYTAyOTVjYTM0N2RjQHdhbGxlLmNj
LwoKT2theSwgaXQgbG9va3MgZmluZS4gSSBzdGlsbCBuZWVkIHRoZSB3cml0ZSwgZXJhc2UsIHZl
cmlmeSBlcmFzZSwgd3JpdGUsCnJlYWQgYW5kIGNvbXBhcmUgdGVzdC4KCj4gCj4gQnV0IHllcywg
SSBtaXNzZWQgdGhhdCB5b3Ugc2hvdWxkIGluY2x1ZGUgdGhlIHNmZHAgZHVtcCBhbmQgc29tZSBv
dGhlcgo+IGNvbW1hbmRzIGluIHRoZSBjb21tZW50IHNlY3Rpb24gb2YgdGhlIHBhdGNoIHdoaWNo
IGFkZHMgc3VwcG9ydCBmb3IgdGhhdAo+IGZsYXNoIChzZWUgVHVkb3JzIHJlcGx5KS4KPiAKTmF0
aGFuLCBwbGVhc2UgcmVzdWJtaXQgYWRkcmVzc2luZyB0aG9zZSBzbWFsbCBjb21tZW50cyBpZiB5
b3UgY2FuLgoKPiBUdWRvciwgd2hhdCBpcyB0aGUgc3RhdHVzIG9mIHlvdXIgZG9jdW1lbnRhdGlv
biBwYXRjaD8gSSdkIHJlYWxseSBsaWtlCj4gdG8gcmVmZXIgdG8gdGhlIGtlcm5lbCBkb2NzIGlu
c3RlYWQgb2YgaGF2aW5nIHdyaXRlIHRoZSBzYW1lIG92ZXIgYW5kCj4gb3ZlciBhZ2FpbiA7KQoK
SSBob3BlIHRvIGhhdmUgaXQgcmVhZHkgZm9yIDYuMy4KCkNoZWVycywKdGEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
