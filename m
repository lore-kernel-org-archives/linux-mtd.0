Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7C0C982D2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 07:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6qX4ApRGScG9KTQXUmC7XfvGp9lT5GXJMi7q4w0B0M=; b=10ds1qiBbmMyrc
	iSH7+A6c1ZQx+nnhb2ClgqDqn2U2Axx6kLCy7EHKwHkmSI0Fch8WOZM/XpvQ64VAbB6QafVmbmou2
	wW9QifUM1+fjD8xjNQvB4ry9HUzve6uiZT402h8oWmJNaVXS4EqGi/hvY3LHS94Nl2xI2hrdt8CfS
	VwShNOMB+Vbu0eHkDnytuV7H3/ftLaBndku4Wvhb5dysqp2EaB97vDcZdRP5z1w4h7iXG2Njd4cyP
	pDvopG5ifBUP0d+mbFh/06G0Y18ih0BHmesifCcZ1u/DTlazKWg4RMFpeNJxV4EB3DWQPDAcs+9dN
	6X0qIdozgfCGM3CYaxJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Mw-0000000Akd5-2YqR;
	Thu, 17 Sep 2026 07:17:18 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x76Mr-0000000AkaD-11sE
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 07:17:14 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so2433275e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2026 00:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789629431; x=1790234231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sjRq5JwkomwjePlQI1kfNhFczaltRdPXNsYjKkX5UM=;
        b=bQVDISv3Ld4g72+2uP9zNSEHyvha/cQ++KDOTNXu0TbcSR34MtVwUMYNVIcCRFQ6QA
         2j4DfOutr8TdvohiUcTNPBflb+SCnnLZiQrrbZPHuvrTDmdKVZV7jtKNH5OvRmsge4xB
         JERkV37plHzO3TXWWnQlWyrtMKGp1bpbpZVdz0QiY5/Gwi1YwtcxRYgHLgTBl+XC9eww
         bq2KdkCoAjT/WXONMn4zLcqvjsbkjb4yxIuR1+6bddqiNlE0zRvKVxjmW7QezTi8A44l
         4Yz8yd0nSPzeOo84ItepEEp0CwRmFDS4CLDIbe1Nin1B1eYHSDABqT331h1eAknp6STq
         YzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789629431; x=1790234231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sjRq5JwkomwjePlQI1kfNhFczaltRdPXNsYjKkX5UM=;
        b=eNCyQumR59jJ73lbkxM6KTICyH0aI32KS/GIAGGS9Oh+N+NtfnEUlbqiHlCEMF4pxz
         aHngBsh5EWEmYPEgrkVniJn3gh84cD2f5YUJCXoe5Zp5WyIboWq5XZzfEwtih+KKpiwS
         zhErp7hwCioC/tCUJFfgNgnBXJIlr7QkGkvYjYgk4NdTCyMZ6W5RVgk8rtTXWe9eJw3/
         siAZGSKcg2A8kBrSobYnyuotag+Kx3SyZR9xoT3WzIGfTUikRuIJOl+BPiAKyu/n7/z1
         9hfRytkr6QXgQb9voQqWA/iSci+ivFOMwIkrH5/q6snlqoqsd48jvOm2FQ2hGQj9O6T1
         3asQ==
X-Forwarded-Encrypted: i=1; AKwUvBynNGoKBm8wA/vVa4hJ2aIIpVCmv4yi3hBRBqzH3803TMSAzwBgNS+KRE3wW3HeCWZ2eF7rCNqIU9Y=@lists.infradead.org
X-Gm-Message-State: AFuF++m0GayXTPlArRwoyC2vzowRXNKwCDFOx+b2A3MEQNLBJ3yBD81i
	jxwZC5Ezp0svZgpnigKHRMLMBlhseoD3mu68mr6s0ysS1xu3CA2cxfn7
X-Gm-Gg: AYBFou3WWIF4r8w2gtRis/zp3CSPd9YIxhg2UZ1VVREmyK93VFuqR4thSrQw7Lg/O4p
	5P/ltzdk4gEyJVEfgEI4Btih3qjnmyYQG/YCb83p7kXPhDUSq0Lc+i+tUZziYRfdpbfVsaxXeSm
	fhkp+zydy23eUeTZhcelSfqGpBvpVRephzKi24/PFdk25f7Qg7Dz18xBcPF+gmZlBZmynmCTm8J
	lTYfWBy2IpxsxE931MrpMfhUxjREAoANnLqY2h+sJMh7t+4ShUq0moS6UdOfseOYEGCbW2z1DYP
	TdFEAcs/nmRDvQYVHjjazt+/u01VJGxFExISI8Ij92hQIKUBDhz6TeovEBl06csil5qv/GeY0Y0
	/9Dlkt8sU9qLrzNWPuRX3oQSXKtHrlLG8o3otRo+Ue5jTBrKhG1QLVV1N8+WEIV0MrzYg6qOMBl
	i6RTbcTZ6Wy34BgE/xBe8b7RNhb72zcmJbL+6FanvAu+s4rXoWWeegYsqS33eOr/130fIviz8se
	/f5fFw7ITvAMjvKZq3yM9vPp0srTTkV/gf/X08=
X-Received: by 2002:a05:600c:4ec6:b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49eb732aec0mr62000005e9.24.1789629430773;
        Thu, 17 Sep 2026 00:17:10 -0700 (PDT)
Received: from [192.168.20.170] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1ce79csm59310085e9.0.2026.09.17.00.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:17:10 -0700 (PDT)
Message-ID: <70d620e5-b03a-48ff-9b56-e787d03b4aed@gmail.com>
Date: Thu, 17 Sep 2026 09:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: spi-qpic-snand: drop the redundant ECC
 context handling
To: Johan Alvarado <contact@c127.dev>, broonie@kernel.org,
 md.alam@oss.qualcomm.com
Cc: konradybcio@kernel.org, pengpeng@iscas.ac.cn, miquel.raynal@bootlin.com,
 quic_varada@quicinc.com, quic_srichara@quicinc.com,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260911184416.109790-1-contact@c127.dev>
 <20260911184416.109790-3-contact@c127.dev>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <20260911184416.109790-3-contact@c127.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_001713_303762_C05D94C2 
X-CRM114-Status: GOOD (  12.71  )
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

MjAyNi4gMDkuIDExLiAyMDo0NCBrZWx0ZXrDqXNzZWwsIEpvaGFuIEFsdmFyYWRvIMOtcnRhOgo+
IHFjb21fc3BpX2VjY19pbml0X2N0eF9waXBlbGluZWQoKSBub3cgcHVibGlzaGVzIHRoZSBFQ0Mg
Y29udGV4dCB0bwo+IHNuYW5kYy0+cXNwaS0+ZWNjLCBzbyB0aGUgYXNzaWdubWVudCBpbgo+IHFj
b21fc3BpX2VjY19wcmVwYXJlX2lvX3JlcV9waXBlbGluZWQoKSByZXBlYXRzIHdoYXQgdGhlIHBv
aW50ZXIgYWxyZWFkeQo+IGhvbGRzLCBhbmQgdGhlIHplcm9lZCBzdHJ1Y3QgcXBpY19lY2MgdGhh
dCBxY29tX3NwaV9wcm9iZSgpIGFsbG9jYXRlcyBpcwo+IG5ldmVyIHJlYWQuCj4gCj4gVGhlIHBv
aW50ZXIgaXMgbm9uLU5VTEwgb25seSBiZXR3ZWVuIGNvbnRleHQgY3JlYXRpb24gYW5kIGRlc3Ry
dWN0aW9uLAo+IGFuZCBldmVyeSByZWFkZXIgcnVucyBpbnNpZGUgdGhhdCB3aW5kb3cuIFRoZSBv
b2JsYXlvdXQgY2FsbGJhY2tzIGFyZQo+IGluc3RhbGxlZCBieSBpbml0X2N0eC4gVGhlIHBhZ2Ug
cmVhZCwgd3JpdGUgYW5kIHByb2dyYW0gaGVscGVycyBydW4gb25seQo+IHdoZW4gcHJlcGFyZV9p
b19yZXEgaGFzIHNldCBwYWdlX3J3IG9yIG9vYl9ydy4gcWNvbV9zcGlfYmxvY2tfZXJhc2UoKQo+
IHJ1bnMgb25seSB3aGlsZSB0aGUgbXRkIGlzIHJlZ2lzdGVyZWQsIHdoaWNoIGhhcHBlbnMgYWZ0
ZXIgaW5pdF9jdHggYW5kCj4gZW5kcyBiZWZvcmUgY2xlYW51cF9jdHguIFRoZSBjb250cm9sbGVy
IGRyaXZlcyBhIHNpbmdsZSBjaGlwIHNlbGVjdCwgc28KPiB0aGUgcGVyLWNvbnRyb2xsZXIgcG9p
bnRlciBhbmQgdGhlIHBlci1jaGlwIGNvbnRleHQgY2Fubm90IGRpc2FncmVlLgo+IAo+IFJlbW92
ZSBib3RoLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEdhYm9yIEp1
aG9zIDxqNGc4eTdAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaGFuIEFsdmFyYWRvIDxj
b250YWN0QGMxMjcuZGV2Pgo+IC0tLQo+IFRlc3RlZCBvbiBhIE1lcmN1c3lzIE1SODBYIChJUFE1
MDE4LCBFU01UIEY1MEQxRzQxTEIpIHdpdGggYm90aCBwYXRjaGVzCj4gYmFja3BvcnRlZCB0byA2
LjE4LjQ0LiBGaXZlIGJvb3RzLCByb290ZnMgbW91bnRlZCBldmVyeSB0aW1lLCBtdGQKPiByZXBv
cnRlZCAwIEVDQyBmYWlsdXJlcyBhbmQgMCBjb3JyZWN0ZWQgYml0cywgYW5kIGEgNCBNaUIgZmls
ZSBvbiB0aGUKPiBVQklGUyBvdmVybGF5IGtlcHQgaXRzIHNoYTI1NiBhY3Jvc3MgdGhlIHJlYm9v
dHMuIE92ZXJsYXkgY2h1cm4gcmFpc2VkCj4gdGhlIFVCSSBtYXhpbXVtIGVyYXNlIGNvdW50ZXIg
ZnJvbSAxMyB0byAxNSwgc28gcWNvbV9zcGlfYmxvY2tfZXJhc2UoKQo+IHJhbiByZXBlYXRlZGx5
LiBCdWlsZC10ZXN0ZWQgb24gdGhpcyBiYXNlIHdpdGggVz0xIGFuZCBzcGFyc2UsIG5vCj4gd2Fy
bmluZ3MsIHBhdGNoIDEgYWxvbmUgYW5kIGJvdGggcGF0Y2hlcyBhcHBsaWVkLgoKVGVzdGVkIG9u
IFRwLUxpbmsgQXJjaGVyIEFYNTUgdjEgYnVpbHQgb24gdG9wIG9mIDk4MTAwZDgzYWRjOCAoIk1l
cmdlCnJlbW90ZS10cmFja2luZyBicmFuY2ggJ3NwaS9mb3ItNy40JyBpbnRvIHNwaS1uZXh0Iiku
IE5vIHJlZ3Jlc3Npb25zIG9ic2VydmVkLgoKVGVzdGVkLWJ5OiBHYWJvciBKdWhvcyA8ajRnOHk3
QGdtYWlsLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
