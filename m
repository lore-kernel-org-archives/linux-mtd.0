Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57FCC433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 07:26:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207E722249
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 07:26:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HRQaYqAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 207E722249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8KVjqA7JXGvwiO1E0Hzc2r5G1jOZoJxxs35RB4yDVLQ=; b=HRQaYqAWJlAaa522GgAUq71aX
	sM5363ipC4u3B0CqirNdkGClpr8TKulNJ7Dd5eF/Yfwt+bNEqnW1GVKOAzDH2a2g0y1MyWVpYUMOf
	xbCP9OqmPu8fiw1PvOpn3MAtiI1k+3J6CFQoSutKRlTFIEs9qdCo/FCGDlWcI2+IFeegYoLeXpDV4
	cfFDbBeFIkNkgApPcJ0DTPiWDoQNe/spR5lwD0VyhK4Vtlo17vFu2t3y46/BxiI+d34nkcL4CO9m5
	R4+ofO2G2mUwhm1/D56DXs2ZaavcU66LHgi97J7ZYwQ6ZjNzhXNkw9O52VGF3DvE1vBHDf5Uam1p5
	1ZK28JeFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSxdS-0007Cb-Dk; Thu, 15 Oct 2020 07:25:14 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSxdO-0007BY-Nt
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2020 07:25:12 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9E93C60002;
 Thu, 15 Oct 2020 07:25:03 +0000 (UTC)
Date: Thu, 15 Oct 2020 09:25:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <xhnjupt@gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type
 and the ECC byte placement
Message-ID: <20201015092502.2ea2a7fc@xps13>
In-Reply-To: <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_032510_874564_BB50497B 
X-CRM114-Status: GOOD (  18.23  )
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
Cc: Richard Weinberger <richard@nod.at>, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSGFuLAoKSGFuIFh1IDx4aG5qdXB0QGdtYWlsLmNvbT4gd3JvdGUgb24gV2VkLCAxNCBPY3Qg
MjAyMCAyMjowOTo1NiAtMDUwMDoKCj4gT24gV2VkLCBPY3QgMTQsIDIwMjAgYXQgODozNSBQTSBG
YWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEhhbiBY
dSwKPiA+Cj4gPiBPbiBXZWQsIE9jdCAxNCwgMjAyMCBhdCA2OjM4IFBNIEhhbiBYdSA8eGhuanVw
dEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBIaSBNaXF1ZWwsIHRoZSBjaGFuZ2VzIHRv
IHRoZSBuZXN0ZWQgc3dpdGNoIHN0YXRlbWVudCBtYWtlIHRoZSBsb2dpYwo+ID4gPiBvZiB0aGlz
IGJyZWFrIHdyb25nLiAgCj4gPgo+ID4gQ2FyZSB0byBzZW5kIGEgZml4LCBwbGVhc2U/Cj4gPgo+
ID4gV2UgaGF2ZSBzZWVuIEVDQyBOQU5EIHJlZ3Jlc3Npb25zIG9uIG14MjcgYW5kIExTMjA4OCBw
bGF0Zm9ybXMuCj4gPgo+ID4gSW4gd2hpY2ggcGxhdGZvcm0gZGlkIHlvdSBub3RpY2VkIHRoZSBF
Q0MgaXNzdWU/Cj4gPgo+ID4gVGhhbmtzICAKPiAKPiBIaSBGYWJpbywKPiAKPiBDSSB0ZXN0IHJl
cG9ydGVkIGFsbCBMUyBwbGF0Zm9ybXMgaGF2ZSB0aGUgRUNDIHJlZ3Jlc3Npb24uIFRoZSBlcnJv
cgo+IGlzICJEcml2ZXIgbXVzdCBzZXQgZWNjLnN0cmVuZ3RoIHdoZW4gdXNpbmcgaGFyZHdhcmUg
RUNDIgo+IAo+IEkgaGF2ZW4ndCB3b3JrZWQgb24gYW55IExTIHBsYXRmb3JtcyBzbyBJIHRlc3Rl
ZCBvbiBpLk1YIHBsYXRmb3Jtcwo+IHdpdGggZ3BtaSBOQU5EIGNvbnRyb2xsZXIsCj4gdGhlIGNv
ZGUgcmFuIGludG8gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVCBkdWUgdG8gdGhpcyBpc3N1ZS4g
U28KPiB0aGVzZSBhcmUgdHdvIGRpZmZlcmVudCBpc3N1ZXMsIEkgY2FuIHNlbmQgYSBwYXRjaCB0
byBmaXggdGhlIG5lc3RlZAo+IHN3aXRjaCBzdGF0ZW1lbnQgcHJvYmxlbSBidXQgd29uJ3QgZml4
IHRoZSBMUyBwbGF0Zm9ybSBpc3N1ZS4KCgpJIHRoaW5rIHRoZSBmYWN0IHRoYXQgdGhlIGV4ZWN1
dGlvbiByYW4gaW50byBOQU5EX0VDQ19FTkdJTkVfVFlQRV9TT0ZUCmhhcyBiZWVuIGZpeGVkLiBI
b3dldmVyIHRoZXJlIGlzIHN0aWxsIHRoZSBvdGhlciBpc3N1ZSB0aGF0IEkgYW0gdW5hYmxlCnRv
IGZpbmQganVzdCBieSByZWFkaW5nIHRoZSBjb2RlIDovCgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
