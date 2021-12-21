Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B99C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 13:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5n8h3BLhgQs/LpBLkOUzk1Wxz74QxZaLUCurDLPsZgA=; b=MzXBnmcl2EYId2
	a6No5Cr6MpPaFAneEqKDNs9+L4Miy8kjBbeHZqRB1usD1YfFsR9BhLaSwjRPxzDSlHWvPeJFsNk2w
	WhTxez+aMX3OsdcJXhJNQ8Yj2Gr5DZdRJRj8d2Yt/AeIVEfgVwWxt7DcJ0iygQAEpF9mvVXqki3Lz
	Sjy6sVuYIFzW+J8CpFBHOQA+zExqHcbqLKi1kl47xoBBGIasma3cJ51J6x5uowArLa4dN8BA7huV/
	kMIwuHN91DlP0lIRPr2M0UPuvI1nqJVL9ltWB5vUglncvx4v4dNHhwWM6zrH6JL3c7j2n1t7Nv8Zd
	ATh+I03P+vQaBH/X7vTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzfWA-0071lg-7q; Tue, 21 Dec 2021 13:49:26 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzfW7-0071k5-8k
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 13:49:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 78EF2FF80A;
 Tue, 21 Dec 2021 13:49:18 +0000 (UTC)
Date: Tue, 21 Dec 2021 14:49:17 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: krzysztof.kozlowski@canonical.com, tony@atomide.com, robh@kernel.org,
 kishon@ti.com, nm@ti.com, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mtd: rawnand: omap2: Select GPMC device driver
 for ARCH_K3
Message-ID: <20211221144917.0a5d8f1a@xps13>
In-Reply-To: <20211221131757.2030-5-rogerq@kernel.org>
References: <20211221131757.2030-1-rogerq@kernel.org>
 <20211221131757.2030-5-rogerq@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_054923_465728_A77525F0 
X-CRM114-Status: GOOD (  12.92  )
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

SGkgUm9nZXIsCgpyb2dlcnFAa2VybmVsLm9yZyB3cm90ZSBvbiBUdWUsIDIxIERlYyAyMDIxIDE1
OjE3OjU3ICswMjAwOgoKPiBUaGUgR1BNQyBkZXZpY2UgZHJpdmVyIGlzIHJlcXVpcmVkIGZvciBO
QU5EIGNvbnRyb2xsZXIKPiB0byB3b3JrIG9uIEszIEFyY2hpdGVjdHVyZS4gU2VsZWN0IGl0IGlm
IHJlcXVpcmVkLgo+IAo+IENjOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPgo+
IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9LY29uZmlnIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+IGluZGV4IDY3YjdjYjY3
YzAzMC4uNTg3ZjIwYzYxODRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L0tj
b25maWcKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gQEAgLTQyLDYgKzQy
LDcgQEAgY29uZmlnIE1URF9OQU5EX09NQVAyCj4gIAl0cmlzdGF0ZSAiT01BUDIsIE9NQVAzLCBP
TUFQNCBhbmQgS2V5c3RvbmUgTkFORCBjb250cm9sbGVyIgo+ICAJZGVwZW5kcyBvbiBBUkNIX09N
QVAyUExVUyB8fCBBUkNIX0tFWVNUT05FIHx8IENPTVBJTEVfVEVTVAo+ICAJZGVwZW5kcyBvbiBI
QVNfSU9NRU0KPiArCXNlbGVjdCBPTUFQX0dQTUMgaWYgQVJDSF9LMwoKQWNrZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgoKPiAgCWhlbHAKPiAgCSAgU3Vw
cG9ydCBmb3IgTkFORCBmbGFzaCBvbiBUZXhhcyBJbnN0cnVtZW50cyBPTUFQMiwgT01BUDMsIE9N
QVA0Cj4gIAkgIGFuZCBLZXlzdG9uZSBwbGF0Zm9ybXMuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
