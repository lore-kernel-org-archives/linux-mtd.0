Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDFFC282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 18:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F31F20881
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 18:05:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mimUItnA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F31F20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QQC7BFVHlOS66Rc9f9bXzMZeyrUL7B7DduxeIyue2cg=; b=mimUItnANIjsOB
	T038OAlm+gVfZ8JH8ikggJybpxthCesoIyCjmfqY8UCf+Vc1tOsLWcGpIkLPTXdKKju4gIMa3V746
	j1eCkEqwyGmpWAoAyKZwsC451Q2NyQciWgfsrhicAxJtXSyfUAglytGGfQuYI0C50eW8la5gCmLHk
	SuK2y6I/s5co1gTJsTrwKHBoOTF53Tbatj6rrOR3Nt8789hWY3ucFZYzj1jD7RLzAQ+VoHRsXGNGx
	ZFTQ5mmYYyh3MJk6txkfdlplJHMnNlTdu01fA2AAfeAmAgmWyRJK3w+PWHiTCifWb6uvHhxjkqp2E
	bXzKsIJpMHXpyikw+b8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTVbr-0006Wx-DX; Wed, 22 May 2019 18:05:03 +0000
Received: from gateway22.websitewelcome.com ([192.185.47.228])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTVbn-0006EV-Ry
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 18:05:01 +0000
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id A106439C5D
 for <linux-mtd@lists.infradead.org>; Wed, 22 May 2019 13:04:58 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id TVbmhA9vWdnCeTVbmhqH8A; Wed, 22 May 2019 13:04:58 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=44510 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hTVbb-003Hxx-Rn; Wed, 22 May 2019 13:04:57 -0500
Date: Wed, 22 May 2019 13:04:46 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH] mtd: onenand_base: Avoid fall-through warnings
Message-ID: <20190522180446.GA30082@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hTVbb-003Hxx-Rn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:44510
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_110459_986675_9553E051 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tk9USUNFIFRIQVQ6CgoiLi4ud2UgZG9uJ3Qga25vdyB3aGV0aGVyIHdlIG5lZWQgZmFsbHRocm91
Z2hzIG9yIGJyZWFrcyB0aGVyZSBhbmQgdGhpcwppcyBqdXN0IGEgY2hhbmdlIHRvIGF2b2lkIGhh
dmluZyBuZXcgd2FybmluZ3Mgd2hlbiBzd2l0Y2hpbmcgdG8KLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aCBidXQgdGhpcyBjaGFuZ2UgbWlnaHQgYmUgZW50aXJlbHkgd3JvbmcuIlsxXQoKU2VlIHRoZSBv
cmlnaW5hbCB0aHJlYWQgb2YgZGlzY3Vzc2lvbiBoZXJlOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3BhdGNoLzEwMzYyNTEvCgpTbywgaW4gcHJlcGFyYXRpb24gdG8gZW5hYmxp
bmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgdGhpcyBwYXRjaCBzaWxlbmNlcwp0aGUgZm9sbG93
aW5nIHdhcm5pbmdzOgoKZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOiBJ
biBmdW5jdGlvbiDigJhvbmVuYW5kX2NoZWNrX2ZlYXR1cmVz4oCZOgpkcml2ZXJzL210ZC9uYW5k
L29uZW5hbmQvb25lbmFuZF9iYXNlLmM6MzI2NDo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBt
YXkgZmFsbCB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgaWYgKE9ORU5BTkRf
SVNfRERQKHRoaXMpKQogICAgICBeCmRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jh
c2UuYzozMjg0OjI6IG5vdGU6IGhlcmUKICBjYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMkdi
OgogIF5+fn4KZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jOjMyODg6MTc6
IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGljaXQtZmFs
bHRocm91Z2g9XQogICB0aGlzLT5vcHRpb25zIHw9IE9ORU5BTkRfSEFTX1VOTE9DS19BTEw7CmRy
aXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYzozMjkwOjI6IG5vdGU6IGhlcmUK
ICBjYXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMUdiOgogIF5+fn4KCldhcm5pbmcgbGV2ZWwg
MyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCgpUaGlzIHBhdGNoIGlzIHBhcnQg
b2YgdGhlIG9uZ29pbmcgZWZmb3J0cyB0byBlbmFibGUKLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4K
ClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNTA5MDg1MzE4LjM0YTlkNGJl
QHhwczEzLwoKQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+ClNp
Z25lZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+
Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVu
YW5kX2Jhc2UuYwppbmRleCBmNDFkNzYyNDg1NTAuLjZjZjRkZjlmOGMwMSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCisrKyBiL2RyaXZlcnMvbXRk
L25hbmQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwpAQCAtMzI4MCwxMiArMzI4MCwxNCBAQCBzdGF0
aWMgdm9pZCBvbmVuYW5kX2NoZWNrX2ZlYXR1cmVzKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCQkJ
aWYgKCh0aGlzLT52ZXJzaW9uX2lkICYgMHhmKSA9PSAweGUpCiAJCQkJdGhpcy0+b3B0aW9ucyB8
PSBPTkVOQU5EX0hBU19OT1BfMTsKIAkJfQorCQkvKiBGYWxsIHRocm91Z2ggLSA/ICovCiAKIAlj
YXNlIE9ORU5BTkRfREVWSUNFX0RFTlNJVFlfMkdiOgogCQkvKiAyR2IgRERQIGRvZXMgbm90IGhh
dmUgMiBwbGFuZSAqLwogCQlpZiAoIU9ORU5BTkRfSVNfRERQKHRoaXMpKQogCQkJdGhpcy0+b3B0
aW9ucyB8PSBPTkVOQU5EX0hBU18yUExBTkU7CiAJCXRoaXMtPm9wdGlvbnMgfD0gT05FTkFORF9I
QVNfVU5MT0NLX0FMTDsKKwkJLyogRmFsbCB0aHJvdWdoIC0gPyAqLwogCiAJY2FzZSBPTkVOQU5E
X0RFVklDRV9ERU5TSVRZXzFHYjoKIAkJLyogQS1EaWUgaGFzIGFsbCBibG9jayB1bmxvY2sgKi8K
LS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
