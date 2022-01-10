Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6560CC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkGS35EnW0zFfIDKHus7wQ0o3Qncs/DgduUDd4Tqo8o=; b=zslc3zynDr8TVf
	EAM+xCSrv6c2q6Kbj6v/ZGKzn3HUPU/7o/cMVd5LD7eSIM9+gQtGBzF7vlfANYmW05b0DW7ajILas
	OQa7AFeUN4Ww8qASclDmnId2h1XbMTVipjyoXkfemt74Vxd5qdFWosxnodlGsr7euX3DeNzAiw2jy
	BmvANURX+QgNXnNLKvd10zPA/rKtVyj+t1R+Q+5neZtAtNbpj7yOAC/9YKN51WJriFn1Sypxp4dlO
	8V/YORsVcm0ZtkoAvziB1z4+70mAFGZ3wekeJ0ZVvmXm4tLphObbx7fmKQcB1PNUiCny8BL9CkSH5
	aXJT7NDJ5ItQ4nPBoWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n71Jf-00DESt-1G; Mon, 10 Jan 2022 20:30:55 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n71Jc-00DERV-2N
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 20:30:53 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so16286293otu.10
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2022 12:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MKJQ46PXBRbX6bCNyZMsAP+5yRLdHD8JjzPIOUXANYM=;
 b=Vhbo5gLXT0AiLcLANYnWJsJsgfx84C2F78MWao9jD3kmkZvgGaypSeyLSSxZnS9QbK
 yy8VOH0hC9RzLArRR2YIJCQ/RlE40TgFNAL9acbsZWn5aonVWr/Dx/T4qIHn4HvCHmtq
 vN8gXGchICijMjoBczuN8olg0GYJP9qyu6SPRMXJYaK5kBa8VRXkEe00SD94FZmNi9TU
 uxGjIJaa+XGgL17Vo7VjASQJdhgV3dDGS2yx49eM+jH7B6X6AZPCJTFG2RhBaDd0PznF
 V2ICyw5Mnr4OzqnJBxATLk8vydyGenjUY7yxaOxaAF2NfC7M/4BEev0zJmpnGLkgudI0
 R5mg==
X-Gm-Message-State: AOAM531ATnqExTMQn7dKW98QBcbHkSeX4RwkI2gw3eAtfsC+wxGV1aff
 TnlG+p07vGEzc+8l4DoVCg==
X-Google-Smtp-Source: ABdhPJypI0jh4xGPymX7WW4kmfi4y2tlwYVgBPzl//PWUOT801iF3brtIEXzIAcl5zs/7z6xi1Q/oQ==
X-Received: by 2002:a9d:2243:: with SMTP id o61mr1159065ota.126.1641846648609; 
 Mon, 10 Jan 2022 12:30:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t66sm1321881oie.39.2022.01.10.12.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 12:30:47 -0800 (PST)
Received: (nullmailer pid 1451794 invoked by uid 1000);
 Mon, 10 Jan 2022 20:30:46 -0000
Date: Mon, 10 Jan 2022 14:30:46 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 2/3] dt-bindings: nvmem: add U-Boot environment
 variables binding
Message-ID: <YdyXdrgh7+I2CaX6@robh.at.kernel.org>
References: <20211230090449.11808-1-zajec5@gmail.com>
 <20211230090449.11808-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211230090449.11808-2-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_123052_147275_5582C37A 
X-CRM114-Status: GOOD (  22.55  )
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

T24gVGh1LCBEZWMgMzAsIDIwMjEgYXQgMTA6MDQ6NDhBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBU
aGlzIGJpbmRpbmcgYWxsb3dzIGRlc2NyaWJpbmcgYSAocGFydCBvZikgTVREIGRldmljZSAocGFy
dGl0aW9uKSB0aGF0Cj4gY29udGFpbnMgYSBibG9jayB3aXRoIGVudmlyb25tZW50IHZhcmlhYmxl
cy4gT3BlcmF0aW5nIHN5c3RlbSB1c3VhbGx5Cj4gbmVlZHMgdG8gcGFyc2UgdGhhdCBibG9jayB0
byByZWFkIHZhcmlhYmxlcyB2YWx1ZXMgdGhhdCBtYXkgYWZmZWN0Cj4gYm9vdGluZyBwcm9jZXNz
ICYgZGV2aWNlIGNvbmZpZ3VyYXRpb24uCgpXaGF0IGRvIHRoZSB1LWJvb3QgZm9sa3MgdGhpbmsg
YWJvdXQgdGhpcyBiaW5kaW5nPyBUaGlzIG5lZWRzIGFuIGFjayAKZnJvbSBhIHUtYm9vdCBtYWlu
dGFpbmVyLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVj
a2kucGw+Cj4gLS0tCj4gVjI6IHMvdSxib290L3UtYm9vdC8KPiAtLS0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vdS1ib290LGVudi55YW1sIHwgNTYgKysrKysrKysrKysrKysrKysr
Kwo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSAr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52Lnlh
bWwKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtL3UtYm9vdCxlbnYueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
dm1lbS91LWJvb3QsZW52LnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAwMC4uZTMyOTZlMDA1ZmZkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS91LWJvb3QsZW52LnlhbWwKPiBAQCAtMCwwICsx
LDU2IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvbnZtZW0vdS1ib290LGVudi55YW1sIwo+ICskc2NoZW1hOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiArCj4gK3RpdGxlOiBVLUJvb3Qg
ZW52aXJvbm1lbnQgdmFyaWFibGVzCj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFUtQm9vdCB1
c2VzIGVudmlyb25tZW50IHZhcmlhYmxlcyB0byBzdG9yZSBkZXZpY2UgcGFyYW1ldGVycyBhbmQK
PiArICBjb25maWd1cmF0aW9uLiBUaGV5IG1heSBiZSB1c2VkIGZvciBib290aW5nIHByb2Nlc3Ms
IHNldHVwIG9yIGtlZXBpbmcgZW5kIHVzZXIKPiArICBpbnRlcmVzdGluZyBpbmZvLgo+ICsKPiAr
ICBEYXRhIGlzIHN0b3JlZCBvbiBmbGFzaCBwYXJ0aXRpb24gaW4gYSBVLUJvb3Qgc3BlY2lmaWMg
Zm9ybWF0IChDUkMzMiBhbmQgTlVMCj4gKyAgc2VwYXJhdGVkIGtleS12YWx1ZSBwYWlycykuCj4g
Kwo+ICsgIFRoaXMgYmluZGluZyBhbGxvd3Mgc3BlY2lmeWluZyBkYXRhIGxvY2F0aW9uIGFuZCBm
b3JtYXQgKGRlZmF1bHQgb25lIG9yIHZlbmRvcgo+ICsgIHNwZWNpZmljKS4KPiArCj4gK21haW50
YWluZXJzOgo+ICsgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ICsKPiAr
YWxsT2Y6Cj4gKyAgLSAkcmVmOiBudm1lbS55YW1sIwo+ICsKPiArcHJvcGVydGllczoKPiArICBj
b21wYXRpYmxlOgo+ICsgICAgZW51bToKPiArICAgICAgLSB1LWJvb3QsZW52Cj4gKyAgICAgIC0g
YnJjbSxlbnYKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gK3VuZXZhbHVh
dGVkUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgcGFy
dGl0aW9ucyB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAr
ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwx
PjsKPiArCj4gKyAgICAgICAgcGFydGl0aW9uQDAgewo+ICsgICAgICAgICAgICBsYWJlbCA9ICJ1
Ym9vdCI7Cj4gKyAgICAgICAgICAgIHJlZyA9IDwweDAgMHgxMDAwMDA+Owo+ICsKPiArICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDE+Owo+ICsKPiArICAgICAgICAgICAgbnZtZW1AMTAwMDAgewoKSSB0aGluayBtb3N0IGV4aXN0
aW5nIGNhc2VzIGRlZmluZSBhIHBhcnRpdGlvbiBmb3IgdGhlIHUtYm9vdCBlbnYsIGJ1dCAKdGhp
cyBsb29rcyBsaWtlIHlvdSBoYXZlIGl0IG5lc3RlZCB3aXRoIG90aGVyIHUtYm9vdCByZWxhdGVk
IGRhdGE/IElzIAp0aGVyZSBhbnkgcmVhc29uIHRvIG5lc3QgdGhlIHBhcnRpdGlvbnM/IEEgY29t
cGF0aWJsZSBpbiBhIHBhcnRpdGlvbiAKbm9kZSBzaG91bGQgYmUgZW5vdWdoLgoKPiArICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAidS1ib290LGVudiI7Cj4gKyAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgxMDAwMCAweDEwMDAwPjsKPiArICAgICAgICAgICAgfTsKPiArICAgICAgICB9Owo+
ICsgICAgfTsKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4
IDY3NTU4MDk3YmI2Ni4uMjcxYzI5Yzg0YzdkIDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4g
KysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMTk2MjQsNiArMTk2MjQsMTEgQEAgVzoJaHR0cDovL2xp
bnV4dHYub3JnCj4gIFQ6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdAo+ICBG
Oglkcml2ZXJzL21lZGlhL3BjaS90dzY4NngvCj4gIAo+ICtVLUJPT1QgRU5WSVJPTk1FTlQgVkFS
SUFCTEVTCj4gK006CVJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiArUzoJTWFp
bnRhaW5lZAo+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vdS1i
b290LGVudi55YW1sCj4gKwo+ICBVQUNDRSBBQ0NFTEVSQVRPUiBGUkFNRVdPUksKPiAgTToJWmhh
bmdmZWkgR2FvIDx6aGFuZ2ZlaS5nYW9AbGluYXJvLm9yZz4KPiAgTToJWmhvdSBXYW5nIDx3YW5n
emhvdTFAaGlzaWxpY29uLmNvbT4KPiAtLSAKPiAyLjMxLjEKPiAKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
