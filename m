Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA5CC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3KBG/XkVDRM+h3LhMvlgCtVAKmaX8nYR8zD/9jyugo=; b=i8zxXzzrrvwH+m
	8RH+taB0xp0FI2mDzTd8zTmHAtekJAdlqHIM100KPg7KY5E+xdDfzr+yhDFun0Z8GwPzrtDMfuaY0
	UZWtN/2+P+xbZkazqM1w6wSB9s/UQsG8sA3nZVDQk/CCVkT7yha525SvrhpWRzOkxMWcF6Y6pkKa5
	M9MkVU2/yLSgmnafdPEjaEYoiYy6Ubktagyll+35X67DCb+lDtAiHU6oUgTCf7Pu2LQCH1OzJfW+F
	JXKCgBav5ApUAzlIcC5fWevLmwIYqWuXTJ5GqOOhtsXMjHrzt2gIMZA4okAf7t5n7d9Iwy07Hyc2v
	9ZpYaO/NJCVXRs+MRVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4zZ-00Cvxm-Qx; Mon, 21 Nov 2022 11:29:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox4zV-00CvtI-MA; Mon, 21 Nov 2022 11:29:35 +0000
Received: by mail-ej1-x635.google.com with SMTP id n12so27714599eja.11;
        Mon, 21 Nov 2022 03:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5wAGqxHFekK2a3K2dnGtE+wgtyOKfjyzcWPwOBM3e4=;
        b=hHGRc+ErTgVBmDvQpU9tTYMO6uC7Unl0nVAMHyEK7UY8zQO8787ASrZ0ZInLZL0MqD
         ETbvZNNr4I18qonBpjwUxchDp8HAgYQQiqj2+3lPzCvImGmWb7PNdoWHBw5qlDqjqiNT
         L9zkXLA0djixZGILG9S5CIFJVzu0oWe8tK6aPtghfpec9Rl66sl71Jw3rEE0dkG/5SPY
         +TJVnLtXjpGleHAzfeUOtulCSRF/+fGEvgYhEZLUSEmBOxx+gV2DvmyWhMlzhiaJfhvU
         +MJGAfMQy8drTOWd7pv2mx3fXv1YiJkUda64YVsR+pO8wtngAsRk/Rpwm5uDkxoCW+0p
         flxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p5wAGqxHFekK2a3K2dnGtE+wgtyOKfjyzcWPwOBM3e4=;
        b=vJDtodEdB0qeier8nALjDCyx07lBTUAVfBnTq9qcacy3i6/FwkU3KD1SylEjbpWHUt
         vUMIH0gFbgu0DHwOCeRf4Boo+kHf1E8vqygoMEdA4AM4/BGnmnGn4OeOEHc0Roi+ez+L
         ux5j+urgPexcrFxTmCc9fw5sStlbxOFR9umhANkjbje/RxcO69nQtvJKZ0NkvgI5OhzV
         g6k1MB4RcE9GngtiFsCBgK/pTTlh5HjhgucU5xreoYMkMaBgvetQ+imJ0ulIGLfZTyIG
         taFYYOB8vx9Ha9qoLVYkxAIm+WlkvtPlyO/T5Y5Ew1FFj9yjg3g3FfnuTEpbVYtICe5M
         HBsg==
X-Gm-Message-State: ANoB5pkFsOqyO+WMNqPZJm7vonnHyu9eMY7VMl3eXGAEh0DU0j8xFeWN
	1ZrNmPir0oNoir+bJE9RjyQ=
X-Google-Smtp-Source: AA0mqf4yRlIfdY/MUfL3UoaCa7+S+Ok0mR2+dPe7bQkvja+lPtuJ4zId7zkYJDriUe88r4sgje+z6A==
X-Received: by 2002:a17:906:a8a:b0:7ae:6cdd:9bc9 with SMTP id y10-20020a1709060a8a00b007ae6cdd9bc9mr14614529ejf.619.1669030167659;
        Mon, 21 Nov 2022 03:29:27 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id o13-20020a170906768d00b0073dc4385d3bsm4857902ejm.105.2022.11.21.03.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 03:29:27 -0800 (PST)
Message-ID: <36b1389a-f08c-96df-47d5-e8ca93b9f8ab@gmail.com>
Date: Mon, 21 Nov 2022 12:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH dt-schema.git] schemas: add NVMEM cell with
 #nvmem-cell-cells
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Michael Walle <michael@walle.cc>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20221121105830.7411-1-zajec5@gmail.com>
 <259ad74e-ec86-34e6-661f-7b7b172c4ddd@linaro.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <259ad74e-ec86-34e6-661f-7b7b172c4ddd@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_032933_760313_1F0C3EB1 
X-CRM114-Status: GOOD (  20.01  )
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

T24gMjEuMTEuMjAyMiAxMjoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyMS8x
MS8yMDIyIDExOjU4LCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6Cj4+IEZyb206IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4KPj4gU29tZSBOVk1FTSBjZWxscyBtYXkgcHJvdmlk
ZSBtb3JlIHRoYW4gMSB2YWx1ZS4gQW4gZXhhbXBsZSBjYW4gYmUgYmFzZQo+PiBNQUMgYWRkcmVz
cyB0aGF0IGlzIHVzZWQgZm9yIGNhbGN1bGF0aW5nIG11bHRpcGxlIE1BQ3MgKGZvciBmZXcKPj4g
ZGlmZmVyZW50IGRldmljZXMpLiBGb3Igc3BlY2lmeWluZyB2YWx1ZSB0byByZWFkIHBoYW5kbGUg
bmVlZHMgdG8gYmUKPj4gdXNlZCB3aXRoIGFuIGFyZ3VtZW50Lgo+Pgo+PiBDYzogU3Jpbml2YXMg
S2FuZGFnYXRsYSIgPHNyaW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPj4gQ2M6IE1pY2hh
ZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPj4gLS0tCj4+IFRoaXMgYml0IGlzIHJlcXVpcmVkIGZv
ciBtb3ZpbmcgZm9yd2FyZCB3aXRoIHRoZQo+PiBbUEFUQ0ggdjIgMDAvMjBdIG52bWVtOiBjb3Jl
OiBpbnRyb2R1Y2UgTlZNRU0gbGF5b3V0cwo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1hcm0ta2VybmVsLzIwMjIwOTAxMjIxODU3LjI2MDAzNDAtMS1taWNoYWVsQHdhbGxlLmNjLwo+
Pgo+PiBBcyBwb2ludGVkIG91dCBieSBSb2IgI252bWVtLWNlbGwtY2VsbHMgc2hvdWxkIGJlIGFk
ZGVkIHRvIHRoZSBkdC1zY2hlbWEKPj4gYW5kIG5vdCBhIExpbnV4IGJpbmRpbmc6Cj4+IFJlOiBb
UEFUQ0ggdjIgMTUvMjBdIGR0LWJpbmRpbmdzOiBudm1lbTogYWRkIFlBTUwgc2NoZW1hIGZvciB0
aGUgc2wyOCB2cGQgbGF5b3V0Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1r
ZXJuZWwvMjAyMjA5MTIxOTIwMzguR0ExNjYxNTUwLXJvYmhAa2VybmVsLm9yZy8KPj4KPj4gc2wy
OCBpcyBvbmUgZXhhbXBsZSB0aGF0IG5lZWRzICNudm1lbS1jZWxsLWNlbGxzCj4+IHUtYm9vdCxl
bnYgaXMgYW5vdGhlciBvbmUKPj4KPj4gUGxlYXNlIGxldCBtZSBrbm93IGlmIEkgZ290IHRoaXMg
YmluZGluZyByaWdodCBhdCBhbGwuCj4+IC0tLQo+PiAgIGR0c2NoZW1hL3NjaGVtYXMvbnZtZW0v
bnZtZW0tY2VsbC55YW1sIHwgMjMgKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkdHNjaGVt
YS9zY2hlbWFzL252bWVtL252bWVtLWNlbGwueWFtbAo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHRzY2hl
bWEvc2NoZW1hcy9udm1lbS9udm1lbS1jZWxsLnlhbWwgYi9kdHNjaGVtYS9zY2hlbWFzL252bWVt
L252bWVtLWNlbGwueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
Li5kZmE5OWI4Cj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHRzY2hlbWEvc2NoZW1hcy9udm1l
bS9udm1lbS1jZWxsLnlhbWwKPj4gQEAgLTAsMCArMSwyMyBAQAo+PiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4+ICskaWQ6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9udm1lbS9udm1lbS1jZWxsLnlhbWwjIgo+PiArJHNjaGVtYTogImh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvYmFzZS55YW1sIyIKPiAKPiBEcm9wIHF1b3RlcyBmcm9t
IGJvdGguCj4gCj4+ICsKPj4gK3RpdGxlOiBOVk1FTSBDZWxsIENvbW1vbiBQcm9wZXJ0aWVzCj4+
ICtkZXNjcmlwdGlvbjogIlNjaGVtYSBmb3IgTlZNRU0gY2VsbCBkZXZpY2V0cmVlIGJpbmRpbmdz
Igo+IAo+IERyb3AgcXVvdGVzLgo+IAo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+PiArICAtIFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNy
aW5pdmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPj4gKwo+PiArIyBhbHdheXMgc2VsZWN0IHRo
ZSBjb3JlIHNjaGVtYQo+PiArc2VsZWN0OiB0cnVlCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsg
ICIjbnZtZW0tY2VsbC1jZWxscyI6Cj4+ICsgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMiIKPiAKPiBEcm9wIHF1b3Rlcy4KPiAKPiBSZXN0IGxvb2tzIGZp
bmUgdG8gbWUsIGV4Y2VwdCBhIGJpdCBmdW5ueSBjZWxsLWNlbGwgbmFtZSwgYnV0IHRoYXQncwo+
IGp1c3QgbGlmZS4gOikKCkJvdGhlcnMgbWUgYSBiaXQgdG9vLCBJIHdhcyBldmVuIHRoaW5raW5n
IGFib3V0IHJlbmFtaW5nIE5WTUVNIGNlbGxzIHRvCk5WTUVNIGVudHJpZXMgYnV0IEknbSBub3Qg
c3VyZSBpZiBpdCdzIG5vdCB0b28gbGF0ZSBmb3IgdGhhdC4KCldlIGFscmVhZHkgaGF2ZSAibnZt
ZW0tY2VsbHMiIGFuZCAibnZtZW0tY2VsbC1uYW1lcyIgcHJvcGVydGllcyBzbwphZGRpbmcgImVu
dHJpZXMiIG5vdCB3b3VsZCBiZSBwcm9iYWJseSBjb25mdXNpbmcuCgoKPj4gKyAgICBkZXNjcmlw
dGlvbjogPgo+PiArICAgICAgU29tZSBOVk1FTSBjZWxscyBtYXkgY29uc2lzdCBvZiByYXcgZGF0
YSB0aGF0IHJlcXVpcmVzIHNvbWUgZXh0cmEKPj4gKyAgICAgIHByb2Nlc3NpbmcuIFRoZXkgbWF5
IHByb3ZpZGUgbW9yZSB0aGFuIDEgdmFsdWUuCj4+ICsKPj4gKyAgICAgIFBhc3NpbmcgZXh0cmEg
YXJndW1lbnQocykgYWxsb3dzIHNlbGVjdGluZyBkYXRhIHRvIGFjY2Vzcy4KPj4gKwo+PiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IHRydWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
