Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377EFE7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18eDhaoOO9vjmPaU82rdAIWpvKr0nkgMD5r53bkjGd0=; b=lCyItCaaoSbGoV
	TLGa1NvRz1Ll4JYnUXwEqSUNXvSeXWRTPgydvtzRo8ipL7C2Zs4FzriFea9ogJaZqUeix/DcaOmFv
	SmWTj2dYAAIWtD/bu/iX1DGEitbk78v0wiBskqvrznHtBx2nTynEx/+OSAwuFp1Mqy08M49ZLhDAY
	/B0nYHlBS2SrdEx+QSjb0FUkVUHE2HM3OTyLM+ztKqoudW5qkA7SbNq2DiHsZvrvId2uTjY+awh+7
	83lsdsoxKDfuTnFOfYLPippvrxcvls0TaGifBTOHLfdq7hIzBsIFu5pooy6ORx2kRdZzRN/oA5G5y
	+CZuaVKFXgIT5Q3PKKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDtN-0000000AZUW-1eMD;
	Mon, 16 Dec 2024 16:24:21 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDtI-0000000AZTo-2xw6
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 16:24:18 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EE443240028
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2024 17:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1734366253; bh=kBD4LKyaI5pNkdjsC2BG5LN22rvKATlpxrKfqmI/V4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=eclJUU3yMTyUrMdTxD11SXsDgIth6xudAeSmEiwrF8XhUx3DwK/7j4Lbq0LCgmSQ3
	 6wGbAbrAoZJ7uT2ppGx7uqelYL4AX7RCCJs+rUKGovMHN8IiiyJQzV/Q7A8W5ziQGO
	 CvjTMkk9sZC9T/j6eiewqtMCixykDAXLONyZ0KSrAJXKTrsfXMNxOEfwU69NnajNL7
	 C8MDX7/PaQ8kicH43j4AsUgxMBGRmhxK8rY03fnOM9pfQHpE2HIrbsyJ2AlfbN5naA
	 AD3CObdCO0q8TmJvIxVvCr+4QVtUC5C/85AF/5XsIU49cTC1d41/nwZUCegDySBu4Z
	 2hkgIIpNcfIEA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YBld70FGVz9rxL;
	Mon, 16 Dec 2024 17:24:10 +0100 (CET)
Date: Mon, 16 Dec 2024 16:24:10 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: David Malcolm <dmalcolm@redhat.com>
Cc: gcc-patches@gcc.gnu.org, linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add w25q01jv flash chip
Message-ID: <20241216172410.1c272b48@posteo.net>
In-Reply-To: <322b0d817a7244dbfa81ed98c94eb3283285fe1b.camel@redhat.com>
References: <Z2AOeyPwYWaam_lX@monster.localdomain>
	<322b0d817a7244dbfa81ed98c94eb3283285fe1b.camel@redhat.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_082416_900724_2FBC8FA6 
X-CRM114-Status: GOOD (  14.72  )
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

T24gTW9uLCAxNiBEZWMgMjAyNCAwODoyMjo0NSAtMDUwMApEYXZpZCBNYWxjb2xtIDxkbWFsY29s
bUByZWRoYXQuY29tPiB3cm90ZToKCj4gT24gTW9uLCAyMDI0LTEyLTE2IGF0IDExOjI2ICswMDAw
LCBXaWxrZW4gR290dHdhbHQgd3JvdGU6Cj4gPiBBZGQgV2luYm9uZCBXMjVRMDFKViAxMjggTWlC
IFNQSSBOT1IgZmxhc2ggY2hpcCwgdmVyaWZpZWQgd29ya2luZyBvbgo+ID4gdGhlCj4gPiBaeW5x
LTcwMDAgcGxhdGZvcm0gUVNQSSBjb250cm9sbGVyLiBUaGUgZmxhc2ggY2hpcCBoYXMgcXVpdGUg
aGlnaAo+ID4gcmVhZAo+ID4gc3BlZWRzIChhYm91dCA2MCsgTWlCL3MpLCBidXQgZXJhc2luZyBp
cyB2ZXJ5IHNsb3cuIFRoZSBzbG93IGVyYXNpbmcKPiA+IGlzCj4gPiBieSBkZXNpZ24uCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFdpbGtlbiBHb3R0d2FsdCA8d2lsa2VuLmdvdHR3YWx0QHBvc3Rl
by5uZXQ+Cj4gPiAtLS0KPiA+IMKgZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMgfCA2ICsr
KysrKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gPiAKPiBEaWQgeW91
IG1lYW4gdG8gc2VuZCB0aGlzIHRvIGdjYy1wYXRjaGVzQGdjYy5nbnUub3JnPyAgVGhpcyBhcHBl
YXJzIHRvCj4gYmUgYSBwYXRjaCBmb3IgdGhlIGtlcm5lbC4KCkFoIHdlbGwsIHRoaXMgaXMgYSBn
b29kIGV4YW1wbGUgd2h5IHlvdSBzaG91bGQgbm90IHN0aWNrIHRvIGNvcHkmcGFzdGUgd2hpbGUK
YmVpbmcgaWxsLiBNeSBmYXVsdC4KCmdyZWV0aW5ncywKV2lsa2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
