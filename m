Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F12BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=stmxRlrIH76VZILl2rDl9CvNEWboYf+xCO5fiH/qUq0=; b=jVLEpMYX1tjTEyHC6mOLI/tHY0
	s2PACvqfjA8dfbMrc21kINrjTH8zKqHJ5XwNmmLO+r9IHDUe3LvfWhe/vTeG68Qm70wQIEhCSs/Bd
	gGeDufvam9oiklnLzMqYn7DjNwiaIHUW648CofKKM2QOC2V5iBxSlaDeZCophO3DsbFXx9wjGzyFt
	Aa2nOLv/UrfMJtR/o3SxHbmt7fMjzCaA0bTtU3TKZMrfAN7MD2VyUcNVkvyMM0E5b/T7B04xvkM/R
	OkiQQkzYrxljlOez3/DCPFZxZiTZi/3Ao7H5Htk/jWKAcL3jxF3de1lH4NMFiK9z/91i+zNQ4ERjs
	8+HwR3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvGLa-00FXMA-1i; Thu, 09 Dec 2021 10:08:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvGLW-00FXKb-Q0
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 10:08:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 73B29B81FA7;
 Thu,  9 Dec 2021 10:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EEEC004DD;
 Thu,  9 Dec 2021 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639044492;
 bh=fxfEda0QHoOs56ah6JYqDrFjYIxSB69gHj84oAncbcg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=H3AwZ9rvVx4HsutFaDRDbX5GWJfhfhQfTxngas3kvNyG9jttXJyhLRlF5f+HLAXh/
 LPlZ8nRSKQ0tqMYZPKMpU1RlguoB7tsMwTVUgcnT7DVpQimunQ0xRyuTXsdhG2kIZA
 7J888oWMTNo6UnoS9Y9r5q7Ijsq5kjQv9KVJrUqaZCPBOsjV77BD8FmRRWc9f55ntr
 UeQYjYROn1K4poQrz3virYYl8A5eQpfJ6TUhUstT5ivQaudtH84u1wfrfdmEnatQSg
 WwhdisqcOz3Nbl2ewDnA1HJU2Lq4d/vjnbAkXNzJkXTTHgfl1RCWWnqccL9Idvwvd2
 0iUvhdGojJQ7Q==
Subject: Re: [PATCH] dt-bindings: mtd: ti,gpmc-nand: Add missing 'rb-gpios'
To: Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211206174209.2297565-1-robh@kernel.org>
 <20211209104224.41d42cca@xps13>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <bebef734-d0d3-e78e-e07a-9160ead1f673@kernel.org>
Date: Thu, 9 Dec 2021 12:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211209104224.41d42cca@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_020815_183218_C9F525CB 
X-CRM114-Status: GOOD (  23.69  )
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

SGkgTWlxdWVsLAoKT24gMDkvMTIvMjAyMSAxMTo0MiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBSb2IsCj4gCj4gcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgIDYgRGVjIDIwMjEgMTE6
NDI6MDkgLTA2MDA6Cj4gCj4+IFdpdGggJ3VuZXZhbHVhdGVkUHJvcGVydGllcycgc3VwcG9ydCBp
bXBsZW1lbnRlZCwgdGhlIFRJIEdQTUMgZXhhbXBsZQo+PiBoYXMgYSB3YXJuaW5nOgo+Pgo+PiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVtb3J5LWNvbnRyb2xsZXJzL3RpLGdw
bWMuZXhhbXBsZS5kdC55YW1sOiBuYW5kQDAsMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUg
bm90IGFsbG93ZWQgKCdyYi1ncGlvcycgd2FzIHVuZXhwZWN0ZWQpCj4+Cj4+IEFkZCB0aGUgbWlz
c2luZyBkZWZpbml0aW9uIGZvciAncmItZ3Bpb3MnLgo+IAo+IHJiLWdwaW9zIGlzIGFscmVhZHkg
ZGVmaW5lZCBpbiBuYW5kLWNvbnRyb2xsZXIueWFtbC4gSSBzZWVtcyBsaWtlIHRoZQo+IHJlYWwg
cHJvYmxlbSBpcyB0aGF0IHRoaXMgZmlsZSBkb2VzIG5vdCByZWZlciB0byBpdC4gQ2FuIHlvdSB1
cGRhdGUgdGhlCj4gZml4PwoKSSBkb24ndCB0aGluayB3ZSBjYW4gcmVmZXIgdG8gbmFuZC1jb250
cm9sbGVyLnlhbWwgcmlnaHQgbm93IGFzIHdlIGFyZSBub3QKZnVsbHkgY29tcGF0aWJsZSB3aXRo
IGl0IHlldC4gUGxlYXNlIHNlZSBleGFtcGxlcyBiZWxvdy4KCnRpLGdwbWMtbmFuZCBleGFtcGxl
OgoKICAgICAgbmFuZEAwLDAgewogICAgICAgIGNvbXBhdGlibGUgPSAidGksb21hcDItbmFuZCI7
CiAgICAgICAgcmVnID0gPDAgMCA0PjsgICAgICAgICAgLyogZGV2aWNlIElPIHJlZ2lzdGVycyAq
LwogICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdwbWM+OwogICAgICAgIGludGVycnVwdHMg
PSA8MCBJUlFfVFlQRV9OT05FPiwgLyogZmlmb2V2ZW50ICovCiAgICAgICAgICAgICAgICAgICAg
IDwxIElSUV9UWVBFX05PTkU+OyAvKiB0ZXJtY291bnQgKi8KICAgICAgICB0aSxuYW5kLXhmZXIt
dHlwZSA9ICJwcmVmZXRjaC1kbWEiOwogICAgICAgIHRpLG5hbmQtZWNjLW9wdCA9ICJiY2gxNiI7
CiAgICAgICAgdGksZWxtLWlkID0gPCZlbG0+OwogICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+
OwogICAgICAgICNzaXplLWNlbGxzID0gPDE+OwoKICAgICAgICAvKiBOQU5EIGdlbmVyaWMgcHJv
cGVydGllcyAqLwogICAgICAgIG5hbmQtYnVzLXdpZHRoID0gPDg+OwogICAgICAgIHJiLWdwaW9z
ID0gPCZncG1jIDAgR1BJT19BQ1RJVkVfSElHSD47ICAvKiBncG1jX3dhaXQwICovCgogICAgICAg
IC8qIEdQTUMgcHJvcGVydGllcyovCiAgICAgICAgZ3BtYyxkZXZpY2Utd2lkdGggPSA8MT47Cgog
ICAgICAgIHBhcnRpdGlvbkAwIHsKICAgICAgICAgIGxhYmVsID0gIk5BTkQuU1BMIjsKICAgICAg
ICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDAwNDAwMDA+OwogICAgICAgIH07CiAgICAgICAgcGFy
dGl0aW9uQDEgewogICAgICAgICAgbGFiZWwgPSAiTkFORC5TUEwuYmFja3VwMSI7CiAgICAgICAg
ICByZWcgPSA8MHgwMDA0MDAwMCAweDAwMDQwMDAwPjsKICAgICAgICB9OwogICAgICB9OwoKCm5h
bmQtY29udHJvbGxlciBleGFtcGxlOgoKICAgIG5hbmQtY29udHJvbGxlciB7CiAgICAgICNhZGRy
ZXNzLWNlbGxzID0gPDE+OwogICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKICAgICAgY3MtZ3Bpb3Mg
PSA8MD4sIDwmZ3Bpb0EgMT47IC8qIEEgc2luZ2xlIG5hdGl2ZSBDUyBpcyBhdmFpbGFibGUgKi8K
CiAgICAgIC8qIGNvbnRyb2xsZXIgc3BlY2lmaWMgcHJvcGVydGllcyAqLwoKICAgICAgbmFuZEAw
IHsKICAgICAgICByZWcgPSA8MD47IC8qIE5hdGl2ZSBDUyAqLwogICAgICAgIG5hbmQtdXNlLXNv
ZnQtZWNjLWVuZ2luZTsKICAgICAgICBuYW5kLWVjYy1hbGdvID0gImJjaCI7CgogICAgICAgIC8q
IGNvbnRyb2xsZXIgc3BlY2lmaWMgcHJvcGVydGllcyAqLwogICAgICB9OwoKICAgICAgbmFuZEAx
IHsKICAgICAgICByZWcgPSA8MT47IC8qIEdQSU8gQ1MgKi8KICAgICAgfTsKICAgIH07CgoKPiAK
PiBXaGlsZSBhdCBpdCB5b3UgbWlnaHQgYWxzbyB3YW50IHRvIGRyb3AgdGhlIHJiLWdwaW9zIHBy
b3BlcnR5IGZyb20KPiBpbmdlbmljLG5hbmQueWFtbCwgd2hpY2ggYWxzbyBkZWZpbmVzIGl0IGEg
c2Vjb25kIHRpbWUuCj4gCj4+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3Rs
aW4uY29tPgo+PiBDYzogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPj4gQ2M6
IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4gQ2M6IFRvbnkgTGluZGdy
ZW4gPHRvbnlAYXRvbWlkZS5jb20+Cj4+IENjOiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVs
Lm9yZz4KPj4gQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IFNpZ25lZC1vZmYt
Ynk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IC0tLQo+PiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC90aSxncG1jLW5hbmQueWFtbCB8IDUgKysrKysKPj4g
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1uYW5kLnlhbWwgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGdwbWMtbmFuZC55YW1sCj4+IGlu
ZGV4IGJlYjI2YjliY2ZiMi4uMWMyODBmNTJiYWEwIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3RpLGdwbWMtbmFuZC55YW1sCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvdGksZ3BtYy1uYW5kLnlhbWwKPj4g
QEAgLTUzLDYgKzUzLDExIEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgZW51bTogWzgsIDE2XQo+PiAg
ICAgIGRlZmF1bHQ6IDgKPj4gIAo+PiArICByYi1ncGlvczoKPj4gKyAgICBkZXNjcmlwdGlvbjoK
Pj4gKyAgICAgIEdQSU8gY29ubmVjdGlvbiB0byBSL0Igc2lnbmFsIGZyb20gTkFORCBjaGlwCj4+
ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiAgcGF0dGVyblByb3BlcnRpZXM6Cj4+ICAgICJAWzAt
OWEtZl0rJCI6Cj4+ICAgICAgJHJlZjogIi9zY2hlbWFzL210ZC9wYXJ0aXRpb25zL3BhcnRpdGlv
bi55YW1sIgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCgpjaGVlcnMsCi1yb2dlcgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
