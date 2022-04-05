Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B12C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5fqZvjZG/RzA0oApUU92ZZrSb17J0YwDo1WfNUFy3g=; b=a6H6f/tMXkJz2n
	80WjlAGOJP2iM03TYbi/OKOhFfHOIm6zzJEDB/LiWTxr9+XykSroeHD+0IaUqs3Cm2ooYzKtLzFxU
	3PcsOFhwNaXlSeOe7Se91xT/CddGrSmNWUc/o/23jxiLrtwGylg3CZWSQ/eqPgd03ekJ8UzDP3ZeT
	fGWKTppc9viF44tPZksvypoR2j6dAZVlqqibxyAce5SoCZKtX9LQkFoFSK2oHIJYZ+sOEq66K0efi
	QbyKnIlCiO3vbfgVqZO/BS5lRCk8mst08USwNSDSWTkIIW5qPI6zhWhZFrf9IWT7186Ta6i/fN2qP
	5tn1inj9G/cAl1CG75PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbdhV-00HZhQ-HP; Tue, 05 Apr 2022 07:34:06 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbddS-00HXSu-LW
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 07:29:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FEEB24000B;
 Tue,  5 Apr 2022 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649143791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTRhfA4aYSuS2lw3n8wuFv+iy0kNOH4iNY5mpXbLVi4=;
 b=Kl6gqNS1EZijZgq2+gDisMfMfeDx3+58Wdif3wqK8EwcEH61yER2zH18bqV6RqYywrKthP
 UT6XsWWCJ8goDCBgwWLygAd7CBSl1SDVimOzJ4dlmcVeGhIRO9TI/NM8gvOEKi8j8rhhDM
 Z2+U5LMirp7MdzepelNOhrAge78qQw5Kwu4S2nYFEaN2brJ/29a/7k3r289WiG1q+Utrr/
 UVIoCWMcM4jsVMs36JICKDqq1N+LquLKdkHZ2BLYUwxiidvKNwDPLHwgCqtvfotijT4wS0
 U9CjnVIzmwJMhbzv3wrP58A/EWuGA3o1LgMSIEAk6Q00+IDRe9qCXO/HogILHw==
Date: Tue, 5 Apr 2022 09:29:49 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>
Cc: sean@geanix.com, frieder.schrempf@kontron.de, festevam@gmail.com,
 ye.li@nxp.com, peng.fan@nxp.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 3/4] mtd: rawnand: gpmi: Rename the variable
 ecc_chunk_size
Message-ID: <20220405092949.448ca3d5@xps13>
In-Reply-To: <20220404195427.8871-3-han.xu@nxp.com>
References: <20220404195427.8871-1-han.xu@nxp.com>
 <20220404195427.8871-3-han.xu@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_002954_907747_25A0C1F9 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

SGkgSGFuLAoKaGFuLnh1QG54cC5jb20gd3JvdGUgb24gTW9uLCAgNCBBcHIgMjAyMiAxNDo1NDoy
NiAtMDUwMDoKCj4gVGhlcmUgaXMgb25seSBvbmUgdmFyaWFibGUgZWNjX2NodW5rX3NpemUgaW4g
YmNoX2dlb21ldHJ5IGRhdGEKPiBzdHJ1Y3R1cmUgYnV0IHR3byBkaWZmZXJlbnQgZmllbGQgaW4g
QkNIIHJlZ2lzdGVycy4gVGhlIGRhdGEwX3NpemUgaW4KPiBCQ0hfRkxBU0gwTEFZT1VUMCBhbmQg
ZGF0YW5fc2l6ZSBpbiBCQ0hfRkxBU0gwTEFZT1VUMSBzaG91bGQgaGF2ZQo+IGRlZGljYXRlIHZh
cmlhYmxlIHNpbmNlIHRoZXkgbWlnaHQgc2V0IHRvIGRpZmZlcmVudCB2YWx1ZXMgaW4gc29tZQo+
IGNhc2VzLgoKR3JlYXQsIHRoYW5rcy4KCkkgYXNzdW1lIHRoaXMgcGF0Y2ggYnJpbmdzIG5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGFuZCBzaG91bGQgbm90IGJlCmV4cGVjdGVkIHRvIGJyaW5nIGFueSBy
ZWdyZXNzaW9uLiBJZiBzbywgY2FuIHlvdSBwbGVhc2Ugc3RhdGUgaXQgaW4gdGhlCmNvbW1pdCBs
b2c/Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhhbiBYdSA8aGFuLnh1QG54cC5jb20+Cj4gCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
