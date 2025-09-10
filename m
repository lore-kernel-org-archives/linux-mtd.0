Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FF5CA101F
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IqFbo4DR2CWse+e6i68I2d3XnTbpRmGbFvWbr76qfg=; b=Z6O1/SRD2L23d9
	pJQn+x4W0WF8q7Pva1hEIuPzVbA3QqxK6YKE+GB3MYZuj6nJcTtDB6rHZP88jtQpCP97Oh/FSMaTo
	dSDOlZDkbn9LnZwGgPjhxIXqBig355VlqXo+h5ZbT0tu+XszoBqYS0d1/8Ai9pUgL11kp5R0IXR6Y
	nTG1tDVCarZOfAMOLE+VbxpRM9keF4VMmGFF7jOKsQxBPP3IdfMuSZmzzd7Uy05ws3i0+RbVwAgkR
	BhrDrjWO3w7AA2t2aimA2povfsxLRnJVC7umyABvNTuAsBiOukIuCg8moWjysy+VF5ZthCiMvnBpt
	oq9RU2F3ma0oYLKcv3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG5Q-0000000CshK-3KWz;
	Wed, 10 Sep 2025 08:21:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwG5O-0000000CsfU-1sye
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 08:21:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10DAFC8F1D2;
	Wed, 10 Sep 2025 08:21:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9BDC606D4;
	Wed, 10 Sep 2025 08:21:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA2B7102F23C1;
	Wed, 10 Sep 2025 10:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757492505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NbAiRonudTxxn0Dt83kCP93jhH7iA1DD1uK9tgWHiiQ=;
	b=Dh6Tt8QA6S70Ghz0oNTxymUWY03z5vFwvRqdDkV12ToYE0rTRT08QfmezeuxMoIEqzcWl/
	cEOByp9wkD/cwK1RWAGKqg/P3BdtUSIQFagOXeU7fr9kzHduCLwk0zrMbqdmYsThRS5iom
	vImynl8vkdYhu/jfi2lxvheeX46HtQ/5oKVKcLPZEC/iZbrlWi2YL1fKtcBBg2ryP1j/x8
	05abcsmYL9k/3QBYaPhJ1Lsy+ZPq8aWpT7E1Oj0SPFKLP1B/DneTM8LkIniHVRlC3dNaB9
	9JI4nf1d989RLkND0p9cHN/YkDpXNvu3lTyIEMxadnItlTGBThb01P+5SRg7Sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <broonie@kernel.org>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <p-mantena@ti.com>,  <linux-spi@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <a-dutta@ti.com>,  <u-kumar1@ti.com>,  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <20250811193219.731851-2-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 12 Aug 2025 01:02:10 +0530")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 10:21:41 +0200
Message-ID: <87seguemzu.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_012150_690752_CF44B5B7 
X-CRM114-Status: GOOD (  13.01  )
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

T24gMTIvMDgvMjAyNSBhdCAwMTowMjoxMCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBGcm9tOiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9y
Zz4KPgo+IFNvbWUgY29udHJvbGxlcnMgbGlrZSB0aGUgQ2FkZW5jZSBPU1BJIGNvbnRyb2xsZXIg
bmVlZCB0byBwZXJmb3JtIGEKPiB0dW5pbmcgc2VxdWVuY2UgdG8gb3BlcmF0ZSBhdCBoaWdoIGRh
dGEgcmF0ZXMuIFR1bmluZyBpcyBuZWVkcyB0byBoYXBwZW4KPiBvbmNlIHRoZSBkZXZpY2UgaXMg
c3dpdGNoZWQgdG8gYXBwcm9wcmlhdGUgbW9kZSAoc2F5IDhTLThTLThTIG9yCj4gOEQtOEQtOEQp
LgoKVGhpcyBpcyBhY3R1YWxseSB3cm9uZy4gVHVuaW5nIGlzIHdheSBtb3JlIGdlbmVyaWMgdGhh
biB0aGF0IDopCgpJZiBzb21lb25lIHdhbnRzIHRvIHVzZSBhIGNoaXAgYXQgYSBoaWdoIGZyZXF1
ZW5jeSAoNTBNSHogaW4geW91ciBjYXNlLApidXQgd2hhdGV2ZXIsIHRoZXJlIGlzIGEgdGhyZXNo
b2xkIGFib3ZlIHdoaWNoIGFkZGl0aW9uYWwgY2FyZSBtdXN0IGJlCnRha2VuKSwgaXQgbXVzdCBn
byB0aHJvdWdoIHRoZSBjYWxpYnJhdGlvbiBzdGVwLiBJdCBkb2VzIG5vdCBtYXR0ZXIgaW4Kd2hp
Y2ggbW9kZSB5b3UgYXJlLiBDYWxpYnJhdGlvbiB3b3VsZCBzdGlsbCBiZSByZWxldmFudCBpbiBz
aW5nbGUgU0RSCm1vZGUuCgoKVGhpcyA1ME1IeiBib3RoZXJlZCBNYXJrIGJlY2F1c2UgaXQgaXMg
dG9vIENhZGVuY2Ugc3BlY2lmaWMuIE1heWJlIHRoaXMKc2hvdWxkIGJlIGEgY29udHJvbGxlciBw
YXJhbWV0ZXI/IElmIHRoZSBzcGktbWVtIGNvcmUgKG9yIGV2ZW4gdGhlIHNwaQpjb3JlLCBieSBl
eHRlbnNpbm8pIHNlZXMgdGhhdCB0aGUgZGVzaWduIGFsbG93cyBydW5uaW5nIGF0IFhNSHogKGR1
ZSB0bwp0aGUgU1BJIHBlcmlwaGVyYWwgcHJvcGVydGllcyBvciBzaW1wbHkgdGhlIGFic2VuY2Ug
b2YgYW55IGxpbWl0YXRpb24pLAphbmQgaWYgdGhlIGNvbnRyb2xsZXIgc3RhdGVzIHRoYXQgaXQg
cmVxdWlyZXMgYW4gZXh0cmEgdHVuaW5nIHN0ZXAgYWJvdmUKWU1IeiAoYW5kIFggPiBZKSwgdGhl
biBpdCBsYXVuY2hlcyB0aGUgY2FsaWJyYXRpb24uCgpGcm9tIGEgY29yZSBwZXJzcGVjdGl2ZSwg
SSB3b3VsZCBsaWtlIHRoZSBjYWxpYnJhdGlvbiBob29rIHRvIGJlIGFzCnNpbXBsZSBhcyBwb3Nz
aWJsZSwgYmVjYXVzZSB3aGF0ICJjYWxpYnJhdGlvbiIgbWVhbnMgaXMgaGlnaGx5CmNvbnRyb2xs
ZXIgYW5kIGNoaXAgc3BlY2lmaWMuCgpUaGUgQ2FkZW5jZSBTUEkgY29udHJvbGxlciBkcml2ZXIg
Y291bGQgcmVxdWVzdCB0aGUgcGF0dGVybiB0aHJvdWdoCnRoZSBudm1lbSBpbnRlcmZhY2Ugb3Ig
bWF5YmUgd2UgY2FuIGV2ZW4gaW5jbHVkZSBpdCBpbiB0aGUga2VybmVsCnRocm91Z2ggc29tZSB0
eXBlIG9mIGZpcm13YXJlIGludGVyZmFjZSAoaXQgY291bGQgYmUgc3RvcmVkIGFueXdoZXJlKQph
bmQgaWYgaXQgZ2V0cyBpdCwgaXQgd3JpdGVzIGl0IHRvIHRoZSBkZXZpY2UgY2FjaGUuIE9uY2Ug
ZG9uZSwgaXQgdGFrZXMKdGhlIGZhc3Rlc3QgYXZhaWxhYmxlIHJlYWQgb3BlcmF0aW9uIGF2YWls
YWJsZSBmb3IgdGhlIGNoaXAgYW5kIHBlcmZvcm1zCml0cyBjYWxpYnJhdGlvbi4KClRoZSBjYWxp
YnJhdGlvbiBob29rIG5vIGxvbmdlciBuZWVkcyBhbnl0aGluZyBTUEkgZHJpdmVyIHNwZWNpZmlj
LiBJCmRvbid0IGtub3cgaWYgc3RpbGwgcmVxdWlyZXMgYW55dGhpbmcgY2hpcCBzcGVjaWZpYyB0
aG91Z2ggKGxpa2UgdGhlCm9wdGltYWwgcmVhZCBvcGVyYXRpb24pLCBidXQgY2FuIHlvdSBwbGVh
c2UgdHJ5IGltcGxlbWVudGluZyB0aGF0IGFuZAp0aGVuIHdlJ2xsIGRpc2N1c3MgdGhpcyBmdXJ0
aGVyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
