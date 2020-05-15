Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA20AC433E3
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 20:50:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A996120756
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 20:50:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r06BRaqe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A996120756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBoAHyNGncqe+umtYBHHE5a66qN2NPiDDD9vVrJBj+M=; b=r06BRaqe1kV7XG
	uvtQWFb9WR1tOgQLv7rIBRYxNPB7Ug9NaYASa72FDa+irFFfc3/uwS1gvNeJ9SOyWrp2kHH1DZK2B
	Z/50YgIIoZfmso+YS3t5t/KZpArTPm9DmDcwJ2lBFCdgz8+ztUZ5Zro2nvdHHi03dX7pAwuDIrqEj
	ug/uZY0gKBwncCYqaHuZSj1XyXhx8TZxa+8R+RV0YQSpvknG2U3AIeWyRNdy60W92FPnJ/HY0+EYU
	VQ8Sm/HbWUeU6ro41JZ82l4RZbOne3w3JaqrqhKTsB6P/HUyRgmRojpVlXTfrd4z0B1yqP3qMnEOr
	11LxKGAotuIDfLglgOMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZhHq-0002KN-3l; Fri, 15 May 2020 20:50:30 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZhHm-0002DB-Go
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 20:50:28 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9190D6224FDF;
 Fri, 15 May 2020 22:50:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AdrSYIIR5X19; Fri, 15 May 2020 22:50:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 2F4F160CEF22;
 Fri, 15 May 2020 22:50:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DHwh6sPgqHHu; Fri, 15 May 2020 22:50:15 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0B2AC6224FDF;
 Fri, 15 May 2020 22:50:15 +0200 (CEST)
Date: Fri, 15 May 2020 22:50:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <568077266.223149.1589575814867.JavaMail.zimbra@nod.at>
In-Reply-To: <20200515191704.GE1009@sol.localdomain>
References: <20200502055945.1008194-1-ebiggers@kernel.org>
 <20200504071644.GS5877@pengutronix.de>
 <20200515191704.GE1009@sol.localdomain>
Subject: Re: [PATCH] ubifs: fix wrong use of crypto_shash_descsize()
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: fix wrong use of crypto_shash_descsize()
Thread-Index: z+OnJhSOitcsTV8I0Jz25cDAthIH9w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_135026_705929_DC20F4AB 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkVyaWMgQmlnZ2VycyIgPGVi
aWdnZXJzQGtlcm5lbC5vcmc+Cj4gQW46ICJTYXNjaGEgSGF1ZXIiIDxzLmhhdWVyQHBlbmd1dHJv
bml4LmRlPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBDQzogImxpbnV4LW10ZCIgPGxp
bnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgIkxpbnV4IENyeXB0byBNYWlsaW5nIExpc3Qi
IDxsaW51eC1jcnlwdG9Admdlci5rZXJuZWwub3JnPiwgInN0YWJsZSIKPiA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4KPiBHZXNlbmRldDogRnJlaXRhZywgMTUuIE1haSAyMDIwIDIxOjE3OjA0Cj4g
QmV0cmVmZjogUmU6IFtQQVRDSF0gdWJpZnM6IGZpeCB3cm9uZyB1c2Ugb2YgY3J5cHRvX3NoYXNo
X2Rlc2NzaXplKCkKCj4gT24gTW9uLCBNYXkgMDQsIDIwMjAgYXQgMDk6MTY6NDRBTSArMDIwMCwg
U2FzY2hhIEhhdWVyIHdyb3RlOgo+PiBPbiBGcmksIE1heSAwMSwgMjAyMCBhdCAxMDo1OTo0NVBN
IC0wNzAwLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4+ID4gRnJvbTogRXJpYyBCaWdnZXJzIDxlYmln
Z2Vyc0Bnb29nbGUuY29tPgo+PiA+IAo+PiA+IGNyeXB0b19zaGFzaF9kZXNjc2l6ZSgpIHJldHVy
bnMgdGhlIHNpemUgb2YgdGhlIHNoYXNoX2Rlc2MgY29udGV4dAo+PiA+IG5lZWRlZCB0byBjb21w
dXRlIHRoZSBoYXNoLCBub3QgdGhlIHNpemUgb2YgdGhlIGhhc2ggaXRzZWxmLgo+PiA+IAo+PiA+
IGNyeXB0b19zaGFzaF9kaWdlc3RzaXplKCkgd291bGQgYmUgY29ycmVjdCwgb3IgYWx0ZXJuYXRp
dmVseSB1c2luZwo+PiA+IGMtPmhhc2hfbGVuIGFuZCBjLT5obWFjX2Rlc2NfbGVuIHdoaWNoIGFs
cmVhZHkgc3RvcmUgdGhlIGNvcnJlY3QgdmFsdWVzLgo+PiA+IEJ1dCBhY3R1YWxseSBpdCdzIHNp
bXBsZXIgdG8ganVzdCB1c2Ugc3RhY2sgYXJyYXlzLCBzbyBkbyB0aGF0IGluc3RlYWQuCj4+ID4g
Cj4+ID4gRml4ZXM6IDQ5NTI1ZTVlZWNjYSAoInViaWZzOiBBZGQgaGVscGVyIGZ1bmN0aW9ucyBm
b3IgYXV0aGVudGljYXRpb24gc3VwcG9ydCIpCj4+ID4gRml4ZXM6IGRhOGVmNjVmOTU3MyAoInVi
aWZzOiBBdXRoZW50aWNhdGUgcmVwbGF5ZWQgam91cm5hbCIpCj4+ID4gQ2M6IDxzdGFibGVAdmdl
ci5rZXJuZWwub3JnPiAjIHY0LjIwKwo+PiA+IENjOiBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU+Cj4+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bn
b29nbGUuY29tPgo+PiAKPj4gTG9va3MgYmV0dGVyIHRoYXQgd2F5LCB0aGFua3MuCj4+IAo+PiBB
Y2tlZC1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgo+PiAKPiAKPiBS
aWNoYXJkLCBjb3VsZCB5b3UgdGFrZSB0aGlzIHRocm91Z2ggdGhlIHViaWZzIHRyZWUgZm9yIDUu
OD8KClN1cmUuIEkgYWN0dWFsbHkgd2lsbCBzZW5kIGEgUFIgd2l0aCB2YXJpb3VzIE1URCByZWxh
dGVkIGZpeGVzCmZvciA1LjcuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
