Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E419C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9xn1njqcfeTre7joweeg0YVbwbKfJMZ8U5BRXxGXAU=; b=Hu29GNHzfuneyr
	RNkAxtHHMdFRi6OPz+lDnxbmTbL9TUF3hSAU0FvpPKZXN4bOUo83Fl12xZYa6QJy3sQDaCJEwqywb
	Pgg+wDV5zTlRL6m5c8+JiwGE0s4bJInYZgGqrpjkpek6HLyYqLDJQYL1QhjM+KMOBr2svwqQbqom/
	DotTOBOOUK6aw746UiDJiL5zHgZGQiUWlydtK5rqUhkLhZY8M7EEiWPcq4diV8oNBZb6oPz2RBlT5
	sJ1ittEpn5FiI7TMnYMRyRiDfTxAFtX+iqv2LJKQNP0Ac9rc62QzHPSre92pqvdRuSNDg0j91EQqh
	hXbKyz4h6iY8QL4v9PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9Bb-00801F-BF; Fri, 03 Jun 2022 15:26:03 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9BZ-007zzu-2l
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 15:26:02 +0000
Received: by mail-ej1-x632.google.com with SMTP id kq6so3589917ejb.11
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2022 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/Mweah5lN/kO56CrN8XrafLn21dNoeqLFoQo/YGrZZg=;
        b=cDkSCXFXXZ6hfs/MNXUVXtr4eQAK9Zs/2YsWJ1Rr417bnEgJuvwSaONZjhR5BiGtJT
         ikt0i76nSlNiaPI6pwdHiineTc3hJ3nkQZ6dau3UmIhQUUfgP7e2QFxMquH27SZ+GKak
         e4EU9v6Yc1r/T3leuTmpqbxMHZVufZK9geZlMqX0rpFIKHovA1k0CWLFhgseTzOE+kRs
         j2oB5SE/zzbJfVq/li1UwNa6S6Z9fYOgo8lZaAr86LFGQCfcSXKZYAk78Ib7N3iroK/p
         CZNWuKSl5GqE9YOeH9m25tpUx8HYzxryeFDzEvpI0TWqjGPNbT8Buim74KLLELs/FSO6
         KPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/Mweah5lN/kO56CrN8XrafLn21dNoeqLFoQo/YGrZZg=;
        b=Co8sATISl1GEyDFmFCWnwsv2xozpY2KCWMQjhAfgUDEqHk2f4Q4bfd077n9U+psjQE
         liQDU09DokyeCDd9O4BUobVzmRi4rNKLO6rOzW5glGQ31JTue2SCptEDj9sE4VFwdZkz
         b2ciBc/NrDY3cXDp2+tg4iaRre1SMrsdrSQgDFlKiKfj8Nhihi2PsCW6AsyXhJx/deAk
         0wF8ilZti6cosh09yffH0u1wjjge411Jzl0sN2cp2/pLmH0FBraf2ItY1uxhqZzZxnY1
         4gdN/CkeHgt8dahEByXHPllX2eF/45+SM8JRg2560AjclzUwEsG3hmr/4nzpVtRv++Nu
         Cdcw==
X-Gm-Message-State: AOAM530WLdjJxDmUljuUK7ZXU3Zd0SzzXiez8BXiVGaOb6bSO7Gm0TPR
	kVroVuRHVWSpdWCCHRgsPc0=
X-Google-Smtp-Source: ABdhPJwZRfAbfi8MfMjOXkdqBIdB7kvAR10anP++LMR+VIwz1J0DvlAX3GxVcPzHUEBsM3POfZBQhQ==
X-Received: by 2002:a17:907:7baa:b0:6fe:b3dc:2378 with SMTP id ne42-20020a1709077baa00b006feb3dc2378mr9204315ejc.266.1654269958847;
        Fri, 03 Jun 2022 08:25:58 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402150300b0042dd3bf1403sm4028469edw.54.2022.06.03.08.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:25:58 -0700 (PDT)
Message-ID: <629a2806.1c69fb81.591ea.6012@mx.google.com>
X-Google-Original-Message-ID: <YpooBMVzdSpVkDXi@Ansuel-xps.>
Date: Fri, 3 Jun 2022 17:25:56 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add support for unprotected spare data page
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220603151806.GB26696@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603151806.GB26696@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_082601_162716_2E18908A 
X-CRM114-Status: GOOD (  35.52  )
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

T24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDg6NDg6MDZQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFRodSwgTWF5IDE5LCAyMDIyIGF0IDA5OjAxOjEwUE0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IFNvbWUgYmFja2dyb3VuZCBhYm91dCB0aGlzLgo+ID4g
T24gb3JpZ2luYWwgcXNkayBpcHE4MDY0IGJhc2VkIGZpcm13YXJlIHRoZXJlIHdhcyBhIGJpZyBz
ZXBhcmF0aW9uIGZyb20KPiA+IGJvb3QgcGFydGl0aW9uIGFuZCB1c2VyIHBhcnRpdGlvbi4gV2l0
aCBib290IHBhcnRpdGlvbiB3ZSByZWZlciB0bwo+ID4gcGFydGl0aW9uIHVzZWQgdG8gaW5pdCB0
aGUgcm91dGVyIChib290bG9hZGVyLCBzcG0gZmlybXdhcmUgYW5kIG90aGVyCj4gPiBpbnRlcm5h
bCBzdHVmZikgV2l0aCB1c2VyIHBhcnRpdGlvbiB3ZSByZWZlciB0byBsaW51eCBwYXJ0aXRpb24g
YW5kIGRhdGEKPiA+IHBhcnRpdGlvbiBub3QgdXNlZCB0byBpbml0IHRoZSByb3V0ZXIuCj4gPiBX
aGVuIHNvbWVvbmUgaGFkIHRvIHdyaXRlIHRvIHRoZXNlIGJvb3QgcGFydGl0aW9uIGEgc3BlY2lh
bCBtb2RlIHdhcwo+ID4gbmVlZGVkLCB0byBzd2l0Y2ggdGhlIG5hbmQgZHJpdmVyIHRvIHRoaXMg
c3BlY2lhbCBjb25maWd1cmF0aW9uLgo+ID4gCj4gPiBVcHN0cmVhbSB2ZXJzaW9uIG9mIHRoZSBu
YW5kYyBkcml2ZXIgdG90YWxseSBkcm9wcGVkIHRoaXMgYW5kIHRoZSByZXN1bHQKPiA+IGlzIHRo
YXQgaWYgc29tZW9uZSB0cnkgdG8gcmVhZCBkYXRhIGZyb20gdGhlc2UgcGFydGl0aW9uIGEgQ1JD
IHdhcm5pbmcKPiA+IGlzIHByaW50ZWQgYW5kIGlmIHNvbWVvbmUgdHJ5IHRvIHdyaXRlIHRoYXQg
KGlmIGZvciBleGFtcGxlIHNvbWVvbmUKPiA+IHdhbnRzIHRvIHJlcGxhY2UgdGhlIGJvb3Rsb2Fk
ZXIpIHJlc3VsdCBpcyBhIGJyb2tlbiBzeXN0ZW0gYXMgdGhlIGRhdGEKPiA+IGlzIGJhZGx5IHdy
aXR0ZW4uCj4gPiAKPiAKPiBDYW4geW91IHBsZWFzZSBwb2ludCBtZSB0byB0aGUgZG93bnN0cmVh
bS92ZW5kb3IgZHJpdmVyIHRoYXQgaGFzIHRoaXMKPiBpbXBsZW1lbnRhdGlvbj8KPiAKPiBUaGFu
a3MsCj4gTWFuaQo+CgpBY3R1YWxseSBmb3VuZCB0aGUgcmVwby4uLlRoaXMgaXMgdGhlIGxpbmsg
WzFdLgoKTXkgaW1wbGVtZW50YXRpb24gaXMgYSB2YXJpYW50IG9mIHRoaXMgc2luY2Ugb3JpZ2lu
YWxseSB0aGV5IHVzZWQgYQpzeXNmcyBlbnRyeSB0byBzd2FwIHRoZSBlY2MgY29uZmlndXJhdGlv
bi4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbWFyeGZhbmcvaXBxODA3eC1zcGYxMDAtY3MvYmxv
Yi9tYXN0ZXIvcXNkay9xY2Evc3JjL2xpbnV4LTQuNC9kcml2ZXJzL210ZC9uYW5kL3Fjb21fbmFu
ZGMuYwoKPiA+IFRoaXMgc2VyaWVzIGNvbWVzIHRvIGZpeCB0aGlzLgo+ID4gCj4gPiBBIHVzZXIg
Y2FuIGRlY2xhcmUgb2Zmc2V0IGFuZCBzaXplIG9mIHRoZXNlIHNwZWNpYWwgcGFydGl0aW9uIHVz
aW5nIHRoZQo+ID4gcWNvbSxib290LXBhZ2VzIGJpbmRpbmcuCj4gPiAKPiA+IEFuIGluaXRpYWwg
aW1wbGVtZW50YXRpb24gb2YgdGhpcyBhc3N1bWVkIHRoYXQgdGhlIGJvb3QtcGFnZXMgc3RhcnRl
ZAo+ID4gZnJvbSB0aGUgc3RhcnQgb2YgdGhlIG5hbmQgYnV0IHdlIGRpc2NvdmVyIHRoYXQgc29t
ZSBkZXZpY2UgaGF2ZSBiYWNrdXAKPiA+IG9mIHRoZXNlIHNwZWNpYWwgcGFydGl0aW9uIGFuZCB3
ZSBjYW4gaGF2ZSBzaXR1YXRpb24gd2hlcmUgd2UgaGF2ZSB0aGlzCj4gPiBwYXJ0aXRpb24gc2No
ZW1lCj4gPiAtIEFQUFNCTCAocmVxdWlyZSBzcGVjaWFsIG1vZGUpCj4gPiAtIEFQUFNCTEVOViAo
ZG9lc24ndCByZXF1aXJlIHNwZWNpYWwgbW9kZSkKPiA+IC0gQVJUCj4gPiAtIEFQUFNCTEJLIChi
YWNrIG9mIEFQUFNCTCByZXF1aXJlIHNwZWNpYWwgbW9kZSkKPiA+IC0gQVBQU0JMRU5WQksgKGJh
Y2sgb2YgQVBQU0JMRU5WIGRvZXNuJ3QgcmVxdWlyZSBzcGVjaWFsIG1vZGUpCj4gPiBXaXRoIHRo
aXMgY29uZmlndXJhdGlvbiB3ZSBuZWVkIHRvIGRlY2xhcmUgc3BhcnNlIGJvb3QgcGFnZSBhbmQg
d2UgY2FuJ3QKPiA+IGFzc3VtZSBib290LXBhZ2VzIGFsd2F5cyBzdGFydHMgZnJvbSB0aGUgc3Rh
cnQgb2YgdGhlIG5hbmQuCj4gPiAKPiA+IEEgdXNlciBjYW4gdXNlIHRoaXMgZm9ybSB0byBkZWNs
YXJlIHNwYXJzZSBib290IHBhZ2VzCj4gPiBxY29tLGJvb3QtcGFnZXMgPSA8MHgwIDB4MGM4MDAw
MCAweDBjODAwMDAgMHgwNTAwMDAwPjsKPiA+IAo+ID4gVGhlIGRyaXZlciBpbnRlcm5hbGx5IHdp
bGwgcGFyc2UgdGhpcyBhcnJheSwgY29udmVydCBpdCB0byBuYW5kIHBhZ2VzCj4gPiBhbmQgY2hl
Y2sgaW50ZXJuYWxseSBvbiBldmVyeSByZWFkL3dyaXRlIGlmIHRoaXMgc3BlY2lhbCBjb25maWd1
cmF0aW9uCj4gPiBzaG91bGQgdXNlZCBmb3IgdGhhdCBwYWdlIG9yIHRoZSBub3JtYWwgb25lLgo+
ID4gCj4gPiBUaGUgcmVhc29uIGZvciBhbGwgb2YgdGhpcyBpcyB0aGF0IHFjb20gRk9SIFNPTUUg
UkVBU09OLCBkaXNhYmxlIEVDQyBmb3IKPiA+IHNwYXJlIGRhdGEgb25seSBmb3IgdGhlc2UgYm9v
dCBwYXJ0aXRpb24gYW5kIHdlIG5lZWQgdG8gcmVmbGVjdCB0aGlzCj4gPiBzcGVjaWFsIGNvbmZp
Z3VyYXRpb24gdG8gbXV0ZSB0aGVzZSB3YXJuaW5nIGFuZCB0byBwZXJtaXQgYWN0dWFsbHkKPiA+
IHdyaXRpbmcgdG8gdGhlc2UgcGFnZXMuCj4gPiAKPiA+IHY0Ogo+ID4gLSBGaXggd3JvbmcgY29t
cGF0aWJsZSBzZXQgZm9yIGJvb3QtcGFnZXMgKGlwcTgwNzQgaW5zdGVhZCBvZiBpcHE4MDZ4KQo+
ID4gdjM6Cj4gPiAtIEZpeCB0eXBvIGluIERvY211bmV0YXRpb24gY29tbWl0IGRlc3JpcHRpb24K
PiA+IC0gQWRkIGl0ZW1zIGRlc2NyaXB0aW9uIGZvciB1aW50MzItbWF0cml4Cj4gPiB2MjoKPiA+
IC0gQWRkIGZpeGVzIGZyb20gS3J6eXN6dG9mIGluIERvY3VtZW50YXRpb24KPiA+IAo+ID4gQW5z
dWVsIFNtaXRoICgyKToKPiA+ICAgbXRkOiBuYW5kOiByYXc6IHFjb21fbmFuZGM6IGFkZCBzdXBw
b3J0IGZvciB1bnByb3RlY3RlZCBzcGFyZSBkYXRhCj4gPiAgICAgcGFnZXMKPiA+ICAgZHQtYmlu
ZGluZ3M6IG10ZDogcWNvbV9uYW5kYzogZG9jdW1lbnQgcWNvbSxib290LXBhZ2VzIGJpbmRpbmcK
PiA+IAo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5hbmRjLnlhbWwgICB8
ICAyNiArKysKPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgICAgICAgICAg
ICAgfCAxNDggKysrKysrKysrKysrKysrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjkgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAo+
IAo+IC0tIAo+IOCuruCuo+Cuv+CuteCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXg
rq7gr40KCi0tIAoJQW5zdWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
