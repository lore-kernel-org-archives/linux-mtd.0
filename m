Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA80AC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:20:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54F9222EBF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 21:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54F9222EBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HDEekbd9w6HaAHqO4q84nsTWeuKUi7/DCA5lK3yWzPQ=; b=byoD+Cx1z7XOffHUGswRWQ8k3
	X6q5xKI8oA4DCPypWZOnuAEZj2xAYwVIEo0Z09BcjqYLQjmrRS/9ckdHD3ccuiBYyOGnHspdjYB5f
	cBkQumM8Xe17wg19b/LGskACa9fCwnyhwvRa21qVXdlEZJryJLMxZTz8a+qp2ux3VRUJjx1/FJz92
	60FrEiQiwSPZRM9ZA4x/x5MddLq/JzyRCOAWhLeQrBfzc2lWuW1egyWc8fFlUvjQRzLvpAKXH/BU9
	Nn5RuGFhFR6WhBYivZXAxpkULWPHUvayrHgaql26xPplEbUpM7OIbBokEMPHETjzjgizETKgatejU
	7F+QT1MIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knTLK-0000xb-2R; Thu, 10 Dec 2020 21:19:18 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knTLH-0000ww-Ca
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 21:19:16 +0000
X-Originating-IP: 109.220.208.103
Received: from xps13 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr
 [109.220.208.103]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id DD2561BF206;
 Thu, 10 Dec 2020 21:19:09 +0000 (UTC)
Date: Thu, 10 Dec 2020 22:19:08 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] mtd: rawnand: simplify the cs553x_write_ctrl_byte()
Message-ID: <20201210221908.192623d7@xps13>
In-Reply-To: <20201209093103.20742-1-zhengyongjun3@huawei.com>
References: <20201209093103.20742-1-zhengyongjun3@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_161915_568329_C2893F2E 
X-CRM114-Status: GOOD (  14.15  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgWW9uZ2p1biwKClpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4gd3Jv
dGUgb24gV2VkLCA5IERlYyAyMDIwCjE3OjMxOjAzICswODAwOgoKPiBTaW1wbGlmeSB0aGUgcmV0
dXJuIGV4cHJlc3Npb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgWW9uZ2p1biA8emhlbmd5
b25nanVuM0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9jczU1M3hf
bmFuZC5jIHwgMTEgKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Y3M1NTN4X25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2NzNTUzeF9uYW5kLmMKPiBpbmRl
eCAyODIyMDNkZWJkMGMuLmE2MTZhYWEyZTNkYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9jczU1M3hfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvY3M1NTN4
X25hbmQuYwo+IEBAIC0xMDUsMTcgKzEwNSwxMiBAQCBzdGF0aWMgaW50IGNzNTUzeF93cml0ZV9j
dHJsX2J5dGUoc3RydWN0IGNzNTUzeF9uYW5kX2NvbnRyb2xsZXIgKmNzNTUzeCwKPiAgCQkJCSAg
dTMyIGN0bCwgdTggZGF0YSkKPiAgewo+ICAJdTggc3RhdHVzOwo+IC0JaW50IHJldDsKPiAgCj4g
IAl3cml0ZWIoY3RsLCBjczU1M3gtPm1taW8gKyBNTV9OQU5EX0NUTCk7Cj4gIAl3cml0ZWIoZGF0
YSwgY3M1NTN4LT5tbWlvICsgTU1fTkFORF9JTyk7Cj4gLQlyZXQgPSByZWFkYl9wb2xsX3RpbWVv
dXRfYXRvbWljKGNzNTUzeC0+bW1pbyArIE1NX05BTkRfU1RTLCBzdGF0dXMsCj4gLQkJCQkJIShz
dGF0dXMgJiBDU19OQU5EX0NUTFJfQlVTWSksIDEsCj4gLQkJCQkJMTAwMDAwKTsKPiAtCWlmIChy
ZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAtCj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiByZWFkYl9w
b2xsX3RpbWVvdXRfYXRvbWljKGNzNTUzeC0+bW1pbyArIE1NX05BTkRfU1RTLCBzdGF0dXMsCj4g
KwkJCQkJICEoc3RhdHVzICYgQ1NfTkFORF9DVExSX0JVU1kpLCAxLAo+ICsJCQkJCSAxMDAwMDAp
Owo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBjczU1M3hfZGF0YV9pbihzdHJ1Y3QgY3M1NTN4X25h
bmRfY29udHJvbGxlciAqY3M1NTN4LCB2b2lkICpidWYsCgpTb3JyeSBidXQgdGhpcyBicmluZ3Mg
bm8gdmFsdWUgYW5kIEkga2luZCBvZiBwZXJzb25hbGx5IGRpc2xpa2UgY29tbWl0cwpkYXJrZW5p
bmcgZ2l0IGJsYW1lcyBmb3IgYWxtb3N0IG5vIHJlYXNvbiwgc28gaWYgeW91IGRvbid0IG1pbmQg
SSB3b3VsZApsaWtlIHRvIGF2b2lkIHN1Y2ggY2hhbmdlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
