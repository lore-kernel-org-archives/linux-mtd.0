Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D473C433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 18:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A553C64E43
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A553C64E43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1HZJsS5QZNdb7LISjni/fSCzP6Z9wVScqHPa0NLFyg8=; b=x+/RPTOsEBJ9muS26U/t0C07Q
	6Hwnch7LKOm0+wqy/YBtRamCmOp2bV/2G9IfHITikp5zFfCdXxoim0j9VTJK4lxEc1WUSrGb+fWPq
	jzMSDd42G4ff7l9fJOsq3ydrHQCz+jLZkg2MrizlLJh8GxtsTo7EeqAhzhZNKtWsns7YuNHto9GX9
	axlNAOvS96Ysl0KitCxoFshyT+u5yYORXToNaV7/OAUkMrWq09+nsCEVIJNcIimGJkixgZzJd4Pth
	QHNx+n7edosJp98secqPDqvK8ptK3D9tIrzAdqPD0wEWNr4T2K/zb9628DDb/rMwkzG6A/ycOIp8o
	CHb5p45GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l85Pu-0001tt-3c; Fri, 05 Feb 2021 18:01:14 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l85Pr-0001sq-2Q
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 18:01:12 +0000
X-Originating-IP: 90.89.227.234
Received: from xps13 (lfbn-tou-1-1424-234.w90-89.abo.wanadoo.fr
 [90.89.227.234]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 4FF89E0017;
 Fri,  5 Feb 2021 18:01:07 +0000 (UTC)
Date: Fri, 5 Feb 2021 19:01:06 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: mdalam@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: Update register macro name for 0x2c
 offset
Message-ID: <20210205190106.58bf14dd@xps13>
In-Reply-To: <7ca35f62c4d3ba7833e192cab3a2701d@codeaurora.org>
References: <1612037236-7954-1-git-send-email-mdalam@codeaurora.org>
 <7ca35f62c4d3ba7833e192cab3a2701d@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_130111_229117_6A7802BC 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 manivannan.sadhasivam@linaro.org, sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgptZGFsYW1AY29kZWF1cm9yYS5vcmcgd3JvdGUgb24gRnJpLCAwNSBGZWIgMjAyMSAy
MzoyNjozMyArMDUzMDoKCj4gT24gMjAyMS0wMS0zMSAwMTozNywgTWQgU2FkcmUgQWxhbSB3cm90
ZToKPiA+IFRoaXMgY2hhbmdlIHdpbGwgcmVtb3ZlIHVudXNlZCByZWdpc3RlciBuYW1lIG1hY3Jv
IE5BTkRfREVWMV9FQ0NfQ0ZHLgo+ID4gU2luY2UgdGhpcyByZWdpc3RlciB3YXMgb25seSBhdmFp
bGFibGUgaW4gUVBJQyB2ZXJzaW9uIDEuNC4yMCBpcHE0MHh4Cj4gPiBhbmQgaXQgd2FzIG5vdCB1
c2VkLiBJbiBRUElDIHZlcnNpb24gMS41IG9uIHdhcmRzIHRoaXMgcmVnaXN0ZXIgZ290Cj4gPiBy
ZW1vdmVkLkluIFFQSUMgdmVyc2lvbiAyLjAgMHgyYyBvZmZzZXQgaXMgdXBkYXRlZCB3aXRoIHJl
Z2lzdGVyCj4gPiBOQU5EX0FVVE9fU1RBVFVTX0VOIFNvIGFkZGluZyB0aGlzIHJlZ2lzdGVyIG1h
Y3JvIE5BTkRfQVVUT19TVEFUVVNfRU4KPiA+IHdpdGggb2Zmc2V0IDB4MmMuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IE1kIFNhZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4gIAo+IAo+
ICAgIFBpbmchIElzIGFueSBhZGRpdGlvbmFsIGluZm8gbmVlZGVkIGZvciB0aGlzIHBhdGNoID8K
ClRoZSBwYXRjaCBpcyBmaW5lIGJ1dCB3ZSBhcmUgYXQgLXJjNiwgdGhlIE5BTkQgUFIgaGFzIGFs
cmVhZHkgYmVlbgpzZW50LCBJIGRvbid0IHBsYW4gdG8gYWRkIG1vcmUgcGF0Y2hlcyBmb3IgdGhp
cyByZWxlYXNlLiBJIHdpbGwgYXBwbHkKbmV3IHBhdGNoZXMgYXQgdjUuMTItcmMxLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
