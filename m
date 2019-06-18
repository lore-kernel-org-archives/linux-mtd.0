Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475C6C31E51
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 06:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 185C7214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 06:20:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fp9+GE59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 185C7214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zAO346JbxepOeHqZDAZ46w3exi2g4jCXZQ6cL9rSA+4=; b=Fp9+GE59smyeRv
	kp6IeYJ6596v6XUJ1QV8d0Pt6NvS8YVglOPqn3Civ8V/OqrUPfZFujx/V5nb7ikhQ6ZfU9ved9hdW
	8mEnbDX4lCa3JcTmYPmGNNGvKONStW+IrDehduhaKmaCiGXSOpYnHai8nUC9GXAbsYlCvIjlyO/KV
	L+t992DSe3nwRDT222K3pLUW1SF+/P9WNeotoj4mncd7SZHzHCetWI7zhOI0uvo5u3ji3cHPMluZQ
	kMn3PBHBke1E16JJttOtNHbg6zp8hZcue0xrehVu/9P2QslAK1Md+A+rmY0fn0qlpFkpFJLWT0/gX
	psKit/XZnFExbj1mhWaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd7Ti-0004Vd-Dl; Tue, 18 Jun 2019 06:20:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd7TM-0002aA-T4
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2019 06:20:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A81DE60A3581;
 Tue, 18 Jun 2019 08:19:47 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9pWdrJ7_AVmW; Tue, 18 Jun 2019 08:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DA9546074CF4;
 Tue, 18 Jun 2019 08:19:45 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 87yI62wPtELB; Tue, 18 Jun 2019 08:19:45 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 99655611C994;
 Tue, 18 Jun 2019 08:19:45 +0200 (CEST)
Date: Tue, 18 Jun 2019 08:19:45 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Message-ID: <1318390798.95477.1560838785550.JavaMail.zimbra@nod.at>
In-Reply-To: <20190618030926.30616-1-yamada.masahiro@socionext.com>
References: <20190618030926.30616-1-yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] jffs2: remove C++ style comments from uapi header
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.8_GA_3025 (ZimbraWebClient - FF60 (Linux)/8.8.8_GA_1703)
Thread-Topic: jffs2: remove C++ style comments from uapi header
Thread-Index: deI3m5cpEftGIaGOraBr3ypIKbYSRQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_232001_099074_EDA60E43 
X-CRM114-Status: UNSURE (   6.19  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIk1hc2FoaXJvIFlhbWFkYSIg
PHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPgo+IEFuOiAibGludXgtbXRkIiA8bGludXgt
bXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+Cj4gQ0M6ICJCb3JpcyBCcmV6aWxsb24iIDxiYnJlemls
bG9uQGtlcm5lbC5vcmc+LCAiTWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+LCAiQnJpYW4gTm9ycmlzIgo+IDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+LCAiVmln
bmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25lc2hyQHRpLmNvbT4sICJNYXJlayBWYXN1dCIgPG1hcmVr
LnZhc3V0QGdtYWlsLmNvbT4sCj4gIk1hc2FoaXJvIFlhbWFkYSIgPHlhbWFkYS5tYXNhaGlyb0Bz
b2Npb25leHQuY29tPiwgInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJEYXZpZCBXb29kaG91
c2UiIDxkd213MkBpbmZyYWRlYWQub3JnPiwKPiAibGludXgta2VybmVsIiA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz4KPiBHZXNlbmRldDogRGllbnN0YWcsIDE4LiBKdW5pIDIwMTkgMDU6
MDk6MjYKPiBCZXRyZWZmOiBbUEFUQ0ggdjJdIGpmZnMyOiByZW1vdmUgQysrIHN0eWxlIGNvbW1l
bnRzIGZyb20gdWFwaSBoZWFkZXIKCj4gTGludXgga2VybmVsIHRvbGVyYXRlcyBDKysgc3R5bGUg
Y29tbWVudHMgdGhlc2UgZGF5cy4gQWN0dWFsbHksIHRoZQo+IFNQRFggTGljZW5zZSB0YWdzIGZv
ciAuYyBmaWxlcyBzdGFydCB3aXRoIC8vLgo+IAo+IE9uIHRoZSBvdGhlciBoYW5kLCB1YXBpIGhl
YWRlcnMgYXJlIHdyaXR0ZW4gaW4gbW9yZSBzdHJpY3QgQywgd2hlcmUKPiB0aGUgQysrIGNvbW1l
bnQgc3R5bGUgaXMgZm9yYmlkZGVuLgo+IAo+IEkgc2ltcGx5IGRyb3BwZWQgdGhlc2UgbGluZXMg
aW5zdGVhZCBvZiBmaXhpbmcgdGhlIGNvbW1lbnQgc3R5bGUuCj4gCj4gVGhpcyBjb2RlIGhhcyBi
ZWVuIGFsd2F5cyBjb21tZW50ZWQgb3V0IHNpbmNlIGl0IHdhcyBhZGRlZCBhcm91bmQKPiBMaW51
eCAyLjQuOSAoaS5lLiBjb21tZW50ZWQgb3V0IGZvciBtb3JlIHRoYW4gMTcgeWVhcnMpLgo+IAo+
ICdNYXliZSBsYXRlci4uLicgd2lsbCBuZXZlciBoYXBwZW4uCgo6LSkKIAo+IFNpZ25lZC1vZmYt
Ynk6IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+CgpBY2tl
ZC1ieTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNo
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
