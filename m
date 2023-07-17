Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1D8C001DC
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 10:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AK/erMuuPQRCwMEIyCSVW4Zlj/+O7YtH8m4g0i71V5E=; b=rtNDMrwW1S3M7N
	vGeLC5XYwJyCbMkmZa4+BbmQPVmtKsSBIhYsweBKh3weBcd2XAtha6MTodOBM+v0AenCJs7HIWrrL
	sMiAX4rSVAMDfefc1VWu6Ivp2SWUxYUY8RCzkUhOEtOmf5ETKh3pAFacStJirQiqemxsaG6G5iRVI
	XhLI/omZAkIpHAJo9iVHcQ45YRAVNBR/uGckPrG4ku8f2TwSu2T/jN5zeE+wjX5cjstzj/eUOOxxm
	gMMsqWOPHDF2AZmIOFM18TuiL7PE6muTzWt0UEUTXeOfeBcaHSPpb7KjYqz35w4aFFkji99hL5Jo7
	o0edFS6Q4+3jHREC8qlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLqv-003n0h-2z;
	Mon, 17 Jul 2023 10:53:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLLnY-003mkD-1t
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 10:50:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992ca792065so617942966b.2
        for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2023 03:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689590985; x=1692182985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qa16i/7wXreM1XPm5VUwAx4KbT+PND+IKjgkjwF1pmM=;
        b=ZqE7722idPYuOeZQMCwC/uzDK4c1q56fL57sL1UBgNozIMQx6v4nFN9uW+hvzR4zu5
         m27aRXWsoTHtxNXd3TgfEvjSEOADpMXCTJNae36wZPHS2IOfUmVnDElqYp35uD5sXzY5
         9e8nV0U5qQO8fqA7k0SlYh6/wcfBpgZ7iS/Z5kG3S16fmKiguQYYrZSVDKtTHJbk+bIL
         0ld20pAYADjXXtBDEHZ66tYxNKV9vBeVxassuiNEwh4+0fn5LJoAMt5owyVXY2cgmXHo
         tDOIxbhxmea5nqiAgSQAvet6NGRN7yTj8Z3Ouxztoxch7tE291wE0r8xsYHZo/Tyxblj
         qnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689590985; x=1692182985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qa16i/7wXreM1XPm5VUwAx4KbT+PND+IKjgkjwF1pmM=;
        b=Hg7FeK2Cbk1JRO/flObHzMILigl/d7HTR/vak8YVuMe13Z9Dq5mrDJFWc7ZXxVz0pm
         UKJ6bNOuEdeJRu7HFaMAVdPMHUY8UK+p8QjGyutlB/t6Y/8UMiW1CaLmCE9JBMBtsi2F
         KylnGJB0OeMxCdgWa2gXXdGn9YYJxL3h0f82xcvRiSGZvhec2O4XRIfPNqR+irlIcDy0
         m9B3oQKDrzyYXCAWvjLTh1kMCMQW3aRLaNzReDHjaK5mWr8JOfes5BTT46xj445w6kLU
         VvI6CuTZtgfEqe5htXHGaxpB8bELoXm0drUwvexcrRBepMEwQ5gvazoQ7MIM+4cY8+gp
         sBiw==
X-Gm-Message-State: ABy/qLZFjz4IoQLO3TDOD6PqbAz2GT92QIBTGwW1meqWTJ6pvh84uCIT
	TbO9r6x6Wfg2XPx52iUII/I=
X-Google-Smtp-Source: APBJJlEWhmWn35hrYy0jF9wZjTDg+bvwe/myoKAbq4TI8tpZsEjUjQS0k5+CrUVKhtBS5Pr76ZeI3w==
X-Received: by 2002:a17:906:3f57:b0:94f:449e:75db with SMTP id f23-20020a1709063f5700b0094f449e75dbmr9046044ejj.52.1689590985266;
        Mon, 17 Jul 2023 03:49:45 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b0099342c87775sm9068788eja.20.2023.07.17.03.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 03:49:44 -0700 (PDT)
Message-ID: <7448d35b-ce62-7e80-6467-ed929ad6838b@gmail.com>
Date: Mon, 17 Jul 2023 12:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/2] mtd: rawnand: add nand-skip-bbtscan and
 nand-no-bbm-quirk DT options
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <61c84262-cd98-1e60-d95b-9b0492083994@gmail.com>
 <2b0dc481-562f-c8df-545e-dcf6548adb07@gmail.com>
 <20230715175538.7142a141@xps-13>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20230715175538.7142a141@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_034948_630489_8AA55C5A 
X-CRM114-Status: GOOD (  23.66  )
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

CgpPbiA3LzE1LzIzIDE3OjU1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEpvaGFuLAo+IAo+
IGpieDYyNDRAZ21haWwuY29tIHdyb3RlIG9uIFNhdCwgMTUgSnVsIDIwMjMgMTI6NDk6MTggKzAy
MDA6Cj4gCj4+IEEgTkFORCBjaGlwIGNhbiBjb250YWluIGEgZGlmZmVyZW50IGRhdGEgZm9ybWF0
IHRoZW4gdGhlIE1URCBmcmFtZXdvcmsKPj4gZXhwZWN0cyBpbiB0aGUgZXJhc2UgYmxvY2tzIGZv
ciB0aGUgQmFkIEJsb2NrIFRhYmxlKEJCVCkuCj4+IFJlc3VsdCBpcyBhIGZhaWxlZCBwcm9iZSwg
d2hpbGUgbm90aGluZyB3cm9uZyB3aXRoIHRoZSBoYXJkd2FyZS4KPj4gU29tZSBNVEQgZmxhZ3Mg
bmVlZCB0byBiZSBzZXQgdG8gZ2FpbiBhY2Nlc3MgYWdhaW4uCj4+Cj4+IFNraXAgdGhlIGF1dG9t
YXRpYyBCQlQgc2NhbiB3aXRoIHRoZSBOQU5EX1NLSVBfQkJUU0NBTiBvcHRpb24KPj4gc28gdGhh
dCB0aGUgb3JpZ2luYWwgY29udGVudCBpcyB1bmNoYW5nZWQgZHVyaW5nIHRoZSBkcml2ZXIgcHJv
YmUuCj4+IFRoZSBOQU5EX05PX0JCTV9RVUlSSyBvcHRpb24gYWxsb3dzIHVzIHRvIGVyYXNlIGJh
ZCBibG9ja3Mgd2l0aAo+PiB0aGUgbmFuZF9lcmFzZV9uYW5kKCkgZnVuY3Rpb24gYW5kIHRoZSBm
bGFzaF9lcmFzZSBjb21tYW5kLgo+Pgo+PiBBZGQgbmFuZC1za2lwLWJidHNjYW4gYW5kIG5hbmQt
bm8tYmJtLXF1aXJrIERldmljZSBUcmVlIG9wdGlvbnMsCj4+IHNvIHRoZSB1c2VyIGhhcyB0aGUg
ImZyZWVkb20gb2YgY2hvaWNlIiBieSBuZXV0cmFsCj4+IGFjY2VzcyBtb2RlIHRvIHJlYWQgYW5k
IHdyaXRlIGluIHdoYXRldmVyIGZvcm1hdCBpcyBuZWVkZWQuCj4gCgo+IFRoaXMgc291bmRzIGxp
a2UgYSBwYXJ0aWFsIHNvbHV0aW9uLiBIb3cgZG8geW91IGhhbmRsZSBiYWQgYmxvY2tzPwoKSGkg
TWlxdWVsLAoKU2VlIGJlbG93IHNvbWUgUm9ja2NoaXAgcmVsYXRlZCBsaW5rczoKClRoZSBmaWxl
IHJrX2Z0bF9hcm1fdjcuUyBpcyBtYXJrZWQgR1BMMiwgc28gSSBjYW4gZnJlZWx5IHJlZmVyL2Rl
Y29kZS9oYWNrIHRvL2luIHRoYXQuCkZvciByazMwNjYgYSBjbG9zZWQgc291cmNlIHBpZWNlIGNh
bGxlZCB1c2JwbHVnIGlzIHN0aWxsIG5lZWRlZCB0byBwcm9ncmFtIGluaXRpYWwgVS1ib290LgpU
aGlzIHVzYnBsdWcgY29udGFpbnMgc2ltaWxhciBjb2RlIGFzIGluIHRoZSBTIGZpbGUgYW5kIGZv
cm1hdHMgdGhlIE5BTkQgZm9yIEZUTC4gClUtYm9vdCBpcyBub3Qgc21hbGwgZW5vdWdoIHlldCAo
V0lQIGlmIEkgaGF2ZSB0aGUgdGltZSkgdG8gcmVwbGFjZSB0aGF0LgpMb25nIHN0b3J5IHNob3J0
IGlzIHRoYXQgb24gUm9ja2NoaXAgTkFORCdzIHdlIGNhbiBleHBlY3QgcGFnZXMgd2l0aCB2YXJp
b3VzIEVDQyBhbmQgc2NyYW1ibGVkL3JhbmRvbWl6ZWQgYWxsIG92ZXIgdGhlIHBsYWNlLgoKT25l
IGVmZmVjdCBpcyB0aGF0IHdoZW4gdGhlIE1URCBmcmFtZXdvcmsgZHJpdmVyIGlzIHByb2JlZCBh
IGZpcnN0IHRpbWUgdGhlIEJCVCBwYWdlcyBkb24ndCBsb29rIHdoYXQgd2FzIGV4cGVjdGVkLgpG
b3IgdGhpcyBmaXJzdCBwcm9iZSB0byBiZSBzdWNjZXNzZnVsIEkgbXVzdCBiZSBhYmxlIHRvIHR1
cm4gb2YgdGhlIE1URCBpbnRlcm5hbCBCQlQgc2NhbiBhbmQgdGhlbiBlcmFzZS9mb3JtYXQgYWxs
IGJsb2NrcyBleGNlcHQgYm9vdCBibG9ja3Mgb2YgY291cnNlLgpEdXJpbmcgdGhpcyBmaXJzdCBy
dW4gYmFkIGJsb2NrcyBhcmUgaGFuZGxlZCBieS90ZXN0ZWQva2VwdCB0cmFjayBvZi9zZXQgQkJN
IGluIHVzZXIgc3BhY2UuClRoaXMgaXMgbm90IG1lYW50IGFzIHBlcm1hbmVudCBtb2RlLihleGNl
cHQgbWF5YmUgaWYgdGhpcyBTIGZpbGUgaXMgY29udmVydGVkIGFzIG9wZW4gc291cmNlIEZUTCAo
V0lQKSkKClJpY2hhcmQgZG9lc24ndCBsaWtlIG1vZHVsZSBwYXJhbWV0ZXJzLCBzbyBJIGNhbid0
IHNpbXBseSBkbyBtb2Rwcm9iZSBmb3IgZXhhbXBsZSBpbiBhIHNjcmlwdC4KQWZ0ZXIgdGhhdCB0
aGUgd2hvbGUga2VybmVsL01URCBtdXN0IHJlYm9vdGVkIHdpdGhvdXQgdGhlc2UgRFQgb3B0aW9u
cy4KIApUaGlzIHBhdGNoIGRvZXMgbWFrZSBwYXJhbWV0ZXJzL2ZsYWdzIGF2YWlsYWJsZSBmb3Ig
YWxsLgpJZiB0aGF0IGlzIHRvbyBtdWNoIGZyZWVkb20gdG8gaGFuZGxlIEkgY2FuIHBhcnNlIHRo
ZW0gaW4gdGhlIFJvY2tjaGlwIGRyaXZlciwgbGV0IG1lIGtub3cuCiAKTGludXggYWx3YXlzIGdl
dHMgYXdheSB3aXRoIHRoZSAiaXQgbXVzdCBiZSBnZW5lcmljIGZ1bmN0aW9uYWxpdHkiIGV4Y3Vz
ZS4KSW4gVS1ib290IHRoZXJlIGlzIHRoZSBzYW1lIGRyaXZlciB3aXRoIGxpdHRsZSBvciBubyBp
bnRlcmFjdGlvbiB3aXRoIHRoZSB1c2VyLCBzbyB3ZSBtdXN0IGRlYWwgd2l0aCB0aGF0LgpQbGVh
c2UgYWR2aXNlIGhvdyB3ZSBjYW4gc29sdmUgdGhpcyBpbiBhIHNpbXBsZSBuaWNlIGF1dG9tYXRl
ZCB3YXkuCgoKSm9oYW4KCj09PQoKZnVuY3Rpb24gRmxhc2hTZXRSYW5kb21pemVyKCkKaHR0cHM6
Ly9naXRodWIuY29tL3JvY2tjaGlwLWxpbnV4L2tlcm5lbC9ibG9iL2RldmVsb3AtNC40L2RyaXZl
cnMvcmtfbmFuZC9ya19mdGxfYXJtX3Y3LlMjTDEyMApodHRwczovL2dpdGh1Yi5jb20vcm9ja2No
aXAtbGludXgvdS1ib290L2Jsb2IvbmV4dC1kZXYvZHJpdmVycy9ya25hbmQvcmtfZnRsX2FybV92
Ny5TI0wxOTkKClByb29mIG9mIGNvbmNlcHQgZm9yIFUtYm9vdDoKW3YyLDA2LzExXSByb2NrY2hp
cDogaWRiOiBhZGQgcmFuZG9taXplciBvcHRpb24KaHR0cDovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvdWJvb3QvcGF0Y2gvMGIyOTVkMGUtNTNkNi1iMzVhLTMwNTgtODYxZTIwM2I0ZDgz
QGdtYWlsLmNvbS8KCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEpvbmtlciA8amJ4NjI0NEBn
bWFpbC5jb20+Cj4+IC0tLQo+Pgo+PiBQcmV2aW91cyBkaXNjdXNzaW9uOgo+PiBbUEFUQ0ggdjMg
My8zXSBtdGQ6IHJhd25hbmQ6IHJvY2tjaGlwLW5hbmQtY29udHJvbGxlcjogYWRkIHNraXBiYnQg
b3B0aW9uCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNjE4MzgyNTYwLjIz
MjY5MzEuMTY4OTI2MTQzNTAyMi5KYXZhTWFpbC56aW1icmFAbm9kLmF0Lwo+PiAtLS0KPj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIHwgNiArKysrKysKPj4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPj4gaW5k
ZXggYTZhZjUyMTgzMmFhLi5mMGZhNWMzNTE5YjEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfYmFzZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRf
YmFzZS5jCj4+IEBAIC01NTIxLDYgKzU1MjEsMTIgQEAgc3RhdGljIGludCByYXduYW5kX2R0X2lu
aXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4gIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29s
KGRuLCAibmFuZC1pcy1ib290LW1lZGl1bSIpKQo+PiAgCQljaGlwLT5vcHRpb25zIHw9IE5BTkRf
SVNfQk9PVF9NRURJVU07Cj4+Cj4+ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChkbiwgIm5h
bmQtbm8tYmJtLXF1aXJrIikpCj4+ICsJCWNoaXAtPm9wdGlvbnMgfD0gTkFORF9OT19CQk1fUVVJ
Uks7Cj4+ICsKPj4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKGRuLCAibmFuZC1za2lwLWJi
dHNjYW4iKSkKPj4gKwkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX1NLSVBfQkJUU0NBTjsKPj4gKwo+
PiAgCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woZG4sICJuYW5kLW9uLWZsYXNoLWJidCIpKQo+
PiAgCQljaGlwLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9VU0VfRkxBU0g7Cj4+Cj4+IC0tCj4+
IDIuMzAuMgo+Pgo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
