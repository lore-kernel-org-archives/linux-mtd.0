Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E41C0218D
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Jan 2025 23:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lb8SHpEF1Wmfva11ZfTbiUvOFZYGWw2eLIl3meNbZQM=; b=qyO48jEShVcWea
	O7a63eLvRxEYMPA7dJS3j4CPqVeEy+/RvnD9afS04NSeVZQKbc9JG+fF8UX1Ty+pU6MNBbP9rNKX4
	a1pBR8YJCEJ7CFuVN8bU1e9M12/RFtqyFSfw4uQh36DnNJCql0wqsIuyh/M6VE6pQz3ULGv/llQHQ
	0oLBbTCUuxclP4MoEtWx851ODLW7H75mDMxSJqeS5yjyKj+1MbxRXjyvkw2vzZh2yo4+RXXvuJd2j
	FF4nuzvW9H0rb5j9BjJJKl6Mi8P+RG1GXGsDyYarwsenPNfgUlwZC97TZOD6Bi5ruabjRM0QXn4yk
	oL8enWzd7OWIHhhZEPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcBy7-00000001Dcj-1Xd6;
	Sun, 26 Jan 2025 23:23:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcBy4-00000001DcH-3LLa
	for linux-mtd@lists.infradead.org;
	Sun, 26 Jan 2025 23:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02AA75C5B98;
	Sun, 26 Jan 2025 23:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D0BC4CED3;
	Sun, 26 Jan 2025 23:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737933780;
	bh=Da9tXyLwkD2V/78EX2AhOGNwi0AShsbcsReVhEPDEw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lj+Vkk+vGxtjTS6EwdKU1jCUNvNvHFlIxXGAUR41Ztm2bT9SCao1tnEn7EC7CLGtd
	 w+jtJmbIIuCJ5FL+fSDbLf5mLVDCrj9H5WBC9CrqjTCE60bbYBpyJb0zb/G31MLLJB
	 AVohD5ONtpThjzmrIAFkrzdu/Jk0Iu+hNd0m3Dijszk8bBrPT/6dNrMy2+lwzTeHYc
	 OTaKo6NqvTWN9JBqnWIi00M602F730+lnrwNgO6i9tNbQGruumcaMfEi5pFhdEgezb
	 BnL8NHlzXJ9ohaIZxzMzDzk23J9GUNqrrKcbvQVI6FBqMLPEYJy5pNxg8NnNrbe9m6
	 oBhAqEEod6YOA==
Message-ID: <a9df1ae6-8779-4dc0-8f03-eda939c0e533@kernel.org>
Date: Mon, 27 Jan 2025 08:22:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] dt-bindings: ata: Convert fsl,pq-sata binding to YAML
To: j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Scott Wood <oss@buserror.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Lee Jones <lee@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250126-ppcyaml-v1-2-50649f51c3dd@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250126_152304_922359_0C1EA08A 
X-CRM114-Status: GOOD (  18.65  )
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

T24gMS8yNy8yNSAwMzo1OCwgSi4gTmV1c2Now6RmZXIgdmlhIEI0IFJlbGF5IHdyb3RlOgo+IEZy
b206ICJKLiBOZXVzY2jDpGZlciIgPGoubmVAcG9zdGVvLm5ldD4KPiAKPiBDb252ZXJ0IHRoZSBG
cmVlc2NhbGUgUG93ZXJRVUlDQyBTQVRBIGNvbnRyb2xsZXIgYmluZGluZyBmcm9tIHRleHQgZm9y
bQo+IHRvIFlBTUwuIFRoZSBsaXN0IG9mIGNvbXBhdGlibGUgc3RyaW5ncyByZWZsZWN0cyBjdXJy
ZW50IHVzYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rl
by5uZXQ+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0YS55
YW1sICAgICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKwo+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXRhL2ZzbC1zYXRhLnR4dCB8IDI4IC0tLS0tLS0tLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0
YS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wscHEtc2F0
YS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwLi42YWYzMWZmYmNhZDVlOWNjODMxMThhMGJkOGVhZjQ1MzUx
YTI4MjNmCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hdGEvZnNsLHBxLXNhdGEueWFtbAo+IEBAIC0wLDAgKzEsNTkgQEAKPiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gKyVZ
QU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9hdGEv
ZnNsLHBxLXNhdGEueWFtbCMKPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogRnJlZXNjYWxlIDh4eHgvMy4wIEdiL3Mg
U0FUQSBub2Rlcwo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBKLiBOZXVzY2jDpGZlciA8ai5u
ZUBwb3N0ZW8ubmV0Pgo+ICsKPiArZGVzY3JpcHRpb246IHwKPiArICBTQVRBIG5vZGVzIGFyZSBk
ZWZpbmVkIHRvIGRlc2NyaWJlIG9uLWNoaXAgU2VyaWFsIEFUQSBjb250cm9sbGVycy4KPiArICBF
YWNoIFNBVEEgcG9ydCBzaG91bGQgaGF2ZSBpdHMgb3duIG5vZGUuCgpWZXJ5IHVuY2xlYXIuIFRo
ZSBTQVRBIG5vZGVzIGRlZmluZSBwb3J0cyBvciBjb250cm9sbGVycyA/IE5vcm1hbGx5LCBhIHNp
bmdsZQpjb250cm9sbGVyIGNhbiBoYXZlIG11bHRpcGxlIHBvcnRzLCBzbyB0aGUgZGlzdGluY3Rp
b24gaXMgaW1wb3J0YW50LgoKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiAr
ICAgIG9uZU9mOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAgICAgLSBlbnVtOgo+ICsgICAg
ICAgICAgICAgIC0gZnNsLG1wYzgzNzctc2F0YQo+ICsgICAgICAgICAgICAgIC0gZnNsLG1wYzg1
MzYtc2F0YQo+ICsgICAgICAgICAgICAgIC0gZnNsLG1wYzgzMTUtc2F0YQo+ICsgICAgICAgICAg
ICAgIC0gZnNsLG1wYzgzNzktc2F0YQo+ICsgICAgICAgICAgLSBjb25zdDogZnNsLHBxLXNhdGEK
PiArICAgICAgLSBjb25zdDogZnNsLHBxLXNhdGEtdjIKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsg
IGNlbGwtaW5kZXg6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzIKPiArICAgIGVudW06IFsxLCAyLCAzLCA0XQo+ICsgICAgZGVzY3JpcHRpb246IHwK
PiArICAgICAgMSBmb3IgY29udHJvbGxlciBAIDB4MTgwMDAKPiArICAgICAgMiBmb3IgY29udHJv
bGxlciBAIDB4MTkwMDAKPiArICAgICAgMyBmb3IgY29udHJvbGxlciBAIDB4MWEwMDAKPiArICAg
ICAgNCBmb3IgY29udHJvbGxlciBAIDB4MWIwMDAKCkFyZSB5b3Ugc3VyZSB0aGVzZSBhcmUgZGlm
ZmVyZW50IGNvbnRyb2xsZXJzID8gQXJlIHRoZXkgbm90IGRpZmZlcmVudCBwb3J0cyBvZgp0aGUg
c2FtZSBjb250cm9sbGVyID8gR2l2ZW4gdGhhdCB0aGUgcHJldmlvdXMgdGV4dCBkZXNjcmlwdGlv
biBkZWZpbmUgdGhpcyBhcwoiY29udHJvbGxlciBpbmRleCIsIEkgc3VzcGVjdCB0aGVzZSBhcmUg
dGhlIHBvcnQgb2Zmc2V0cyBhbmQgeW91IFNBVEEgbm9kZXMKZGVmaW5lIHBvcnRzLCBhbmQgbm90
IGNvbnRyb2xsZXJzLgoKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0g
aW50ZXJydXB0cwo+ICsgIC0gY2VsbC1pbmRleAo+ICsKPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCj4gKwo+ICtleGFtcGxlczoKPiArICAtIHwKPiArICAgICNpbmNsdWRlIDxkdC1iaW5k
aW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiArICAgIHNhdGFAMTgwMDAgewo+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLG1wYzgzNzktc2F0YSIsICJmc2wscHEtc2F0YSI7Cj4g
KyAgICAgICAgcmVnID0gPDB4MTgwMDAgMHgxMDAwPjsKPiArICAgICAgICBjZWxsLWluZGV4ID0g
PDE+Owo+ICsgICAgICAgIGludGVycnVwdHMgPSA8NDQgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiAr
ICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZpcGljPjsKPiArICAgIH07Cj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdGEvZnNsLXNhdGEudHh0IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wtc2F0YS50eHQKPiBkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCBmZDYzYmIzYmVjYzkzNjNjNTIwYThmZDA2NjI5
ZmRjNTJjNGQ0Mjk5Li4wMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwCj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2F0YS9mc2wtc2F0YS50eHQK
PiArKysgL2Rldi9udWxsCj4gQEAgLTEsMjggKzAsMCBAQAo+IC0qIEZyZWVzY2FsZSA4eHh4LzMu
MCBHYi9zIFNBVEEgbm9kZXMKPiAtCj4gLVNBVEEgbm9kZXMgYXJlIGRlZmluZWQgdG8gZGVzY3Jp
YmUgb24tY2hpcCBTZXJpYWwgQVRBIGNvbnRyb2xsZXJzLgo+IC1FYWNoIFNBVEEgcG9ydCBzaG91
bGQgaGF2ZSBpdHMgb3duIG5vZGUuCj4gLQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOgo+IC0tIGNv
bXBhdGlibGUgICAgICAgIDogY29tcGF0aWJsZSBsaXN0LCBjb250YWlucyAyIGVudHJpZXMsIGZp
cnN0IGlzCj4gLQkJICJmc2wsQ0hJUC1zYXRhIiwgd2hlcmUgQ0hJUCBpcyB0aGUgcHJvY2Vzc29y
Cj4gLQkJIChtcGM4MzE1LCBtcGM4Mzc5LCBldGMuKSBhbmQgdGhlIHNlY29uZCBpcwo+IC0JCSAi
ZnNsLHBxLXNhdGEiCj4gLS0gaW50ZXJydXB0cyAgICAgICAgOiA8aW50ZXJydXB0IG1hcHBpbmcg
Zm9yIFNBVEEgSVJRPgo+IC0tIGNlbGwtaW5kZXggICAgICAgIDogY29udHJvbGxlciBpbmRleC4K
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAxIGZvciBjb250cm9sbGVyIEAgMHgxODAwMAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgIDIgZm9yIGNvbnRyb2xsZXIgQCAweDE5MDAwCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgMyBmb3IgY29udHJvbGxlciBAIDB4MWEwMDAKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICA0IGZvciBjb250cm9sbGVyIEAgMHgxYjAwMAo+IC0K
PiAtT3B0aW9uYWwgcHJvcGVydGllczoKPiAtLSByZWcgICAgICAgICAgICAgICA6IDxyZWdpc3Rl
cnMgbWFwcGluZz4KPiAtCj4gLUV4YW1wbGU6Cj4gLQlzYXRhQDE4MDAwIHsKPiAtCQljb21wYXRp
YmxlID0gImZzbCxtcGM4Mzc5LXNhdGEiLCAiZnNsLHBxLXNhdGEiOwo+IC0JCXJlZyA9IDwweDE4
MDAwIDB4MTAwMD47Cj4gLQkJY2VsbC1pbmRleCA9IDwxPjsKPiAtCQlpbnRlcnJ1cHRzID0gPDJj
IDg+Owo+IC0JCWludGVycnVwdC1wYXJlbnQgPSA8ICZpcGljID47Cj4gLQl9Owo+IAoKCi0tIApE
YW1pZW4gTGUgTW9hbApXZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
