Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D711DCD6E4A
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OiNUI96lxwXT9Dj04mb8oOYUT1hyFaQM/gQdcxRv4I=; b=dQEvAMZB50ggrx
	U+MDq+jBfBV6CmrzVopdonBGa81uzZYYxqDi760OfMvN6ZlKYtrKxUPAvSbyiacZiuP9u3r+E18ob
	yEw1WkF86vBgSMwl/Ck8juDMbOGuHxEpbjqAoza2Qoa1vVYe8Y9MG1FRZ8bDzWyvFEpqAvyBqZWvu
	EQ20IcjdDTwPO7yPyhi/MxKc/HGDwsdImbrs2O2l29LSht11PX+j7iGxoIqG6AJ1lZJmW1d5gozEj
	yii3aDDCYNMO57Akh0qNKLzASoiJeX+knLhW89zNfRpRldy2ymXkcPXmugDcg8O/wgFuPhOdM1YOJ
	tMUJB3KQllD4B59SQMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2Hd-0000000GIDJ-0MwM;
	Thu, 04 Jun 2026 07:14:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2HZ-0000000GICi-3hnb
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 07:14:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF4FA4E40503;
	Thu,  4 Jun 2026 07:14:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 910585FEF7;
	Thu,  4 Jun 2026 07:14:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3CD8106A173C;
	Thu,  4 Jun 2026 09:14:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780557261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mch2Bg7cryJTjKT8MYD1B/J4muhxyP20EtAZ3/VXcdA=;
	b=g4CCWlRqCPHFmctTPJZrGv/lHwBZoYZJfY82Uov46VdGISP3Ol0WtQjBizs0npkiHcVgiR
	fmaD1FHs3F3fgInEirfZ9SwbUKPH2NlYQf2qbp23yLfBCWNKkwAJKtGQ+YDKXG43ieaxXi
	vQ75VE/PCZJEOabzNNUNORO/TmFcjLyM65wDaiut99qScvAGyQtvTb/bY7dJKqFiNVG/EC
	0MRiTAeKvoRTFfnDVUvWfRkOf1T4lxAcGWsIHAYiUKT72LhjeLbJf3O6S3WWBXBJ6kGsP8
	JpdpqnK0JGcpG1S0TKz7GB3a24RK+eiWPkEqe7HJkbRoa2jkqleMe1rbD4xwPg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260603-balance-encounter-94f69e1577f3@spud> (Conor Dooley's
	message of "Wed, 3 Jun 2026 17:40:15 +0100")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-2-s-k6@ti.com>
	<20260528-clergyman-kindling-20971775ba78@spud>
	<eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
	<87cxy92llq.fsf@bootlin.com>
	<20260602-aptly-bunkbed-1bd3a8d63d54@spud>
	<875x3zzkji.fsf@bootlin.com> <20260603-neatly-twine-e89b923f5cb6@spud>
	<87o6hry4d4.fsf@bootlin.com>
	<20260603-balance-encounter-94f69e1577f3@spud>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 04 Jun 2026 09:14:16 +0200
Message-ID: <87ik7yydyv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_001426_073386_FF7A4BED 
X-CRM114-Status: GOOD (  17.13  )
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

SGkgQ29ub3IsCgo+PiA+PiA+IFJpZ2h0LCBhbmQgdGhpcyBJIGd1ZXNzIGlzIHdoYXQgc2N1cHBl
cnMgbGV0dGluZyB0aGUgY29udHJvbGxlciBkcml2ZXIKPj4gPj4gPiBzb3J0IHRoZSBjb25maWd1
cmF0aW9uIG91dCBpdHNlbGYgYW5kIGxlYXZpbmcgdGhlIHByb3BlcnR5IGFzLWlzLgo+PiA+PiA+
IEl0IGNvdWxkIGJlIHRoYXQgdGhlIHNwZWVkIGluIHNwaS1tYXgtZnJlcXVlbmN5IGlzIGxvd2Vy
IHRoYW4gdGhlICJiYXNlCj4+ID4+ID4gc3BlZWQiIG9mIHRoZSBjb250cm9sbGVyIGJ1dCBiZWNh
dXNlIG9mIGJvYXJkIHJvdXRpbmcgb3IgZGV2aWNlCj4+ID4+ID4gY2FwYWJpbGl0eSB0aGF0IHRo
ZSB0dW5lZCBtb2RlIGlzIHN0aWxsIHJlcXVpcmVkLCByaWdodD8KPj4gPj4gCj4+ID4+IEkgZG8g
bm90IGFjdHVhbGx5IGV4cGVjdCBhbnkgdHVuZWQgbW9kZS9mcmVxdWVuY3kgdG8gYmUgbWFuZGF0
b3J5Lgo+PiA+Cj4+ID4gSSB0aGluayB5b3UgbWlzdW5kZXJzdG9vZCBteSB1c2Ugb2YgInJlcXVp
cmVkIiwgSSBtZWFudCB0aGF0IHRoZSBuZXcKPj4gPiBwcm9wZXJ0eS9pbmZvcm1hdGlvbiB3YXMg
bmVlZGVkIGluIHRoZSBzY2VuYXJpbyBJIGRlc2NyaWJlZCwgbm90IHRoYXQgaXQKPj4gPiBzaG91
bGQgYmUgYSByZXF1aXJlZCBwcm9wZXJ0eSBpbiBhIGJpbmRpbmcuCj4+IAo+PiBZZXMgSSBtaXN1
bmRlcnN0b29kIHRoZSB0ZXJtIGluZGVlZC4gSG93ZXZlciBJIHN0aWxsIGZhaWwgdG8gY2F0Y2gg
d2hhdAo+PiB5b3UgbWVhbnQgaGVyZSwgSSdtIHNvcnJ5LiBXb3VsZCB5b3UgbWluZCByZXBocmFz
aW5nPwo+Cj4gSSB3YXMgdGFsa2luZyBhYm91dCBhIHNjZW5hcmlvIHdoZXJlIHlvdSB3YW50IHRv
IHVzZSB0aGUgdHVuZWQgbW9kZSB0bwo+IGFjaGlldmUgdGhlIG1heGltdW0gcmF0ZSBiZWNhdXNl
IG9mIHRoZSBkZXZpY2UgYW5kL29yIGJvYXJkIGNvbmZpZ3VyYXRpb24sCj4gYnV0IHRoZSByYXRl
IGlzIGJlbG93IHRoZSBwb2ludCB3aGVyZSB0aGUgY29udHJvbGxlciB3b3VsZCBuZWVkIHR1bmlu
Zy4KPiBTYXkgdGhlIGNvbnRyb2xsZXIgbmVlZHMgdHVuaW5nIGFib3ZlIDggSHogYnV0IHRoZSBj
b25kaXRpb25zIHJlcXVpcmUKPiB0dW5pbmcgdG8gYWNoaWV2ZSBtb3JlIHRoYW4gNSBIei4gSW4g
dGhpcyBleGFtcGxlLCBpZiB0aGUgZGV2aWNlIGNhbiBkbwo+IDYgSHosIHNwaS1tYXgtZnJlcXVl
bmN5IChpbiB0aGUgY3VycmVudCBmb3JtKSB3b3VsZCBiZSBzZXQgdG8gNiBIeiwgYW5kCj4gdGhl
IGNvbnRyb2xsZXIgd291bGQgbm90IGVuYWJsZSB0aGUgdHVuZWQgbW9kZSwgbGVhZGluZyB0byBw
cm9ibGVtcwo+IGJlY2F1c2UgdGhlIGluZmxlY3Rpb24gcG9pbnQgZGV0ZXJtaW5lZCBmcm9tIHRo
ZSBjb250cm9sbGVyIGNvbXBhdGlibGUKPiBvZiA4IEh6IHdvdWxkIG5vdCBoYXZlIGJlZW4gcmVh
Y2hlZC4KCkkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBhIHJlYWwgc2l0dWF0aW9uLiBJZiB0aGUgImNv
bmRpdGlvbnMiLCBhcyB5b3Ugc2F5CihpZS4gUENCIHJvdXRpbmcsIG1vc3RseSkgcmVxdWlyZSB0
dW5pbmcgYWJvdmUgNSwgdGhlbiBzcGktbWF4LWZyZXF1ZW5jeQpzaG91bGQgYmUgNS4gSXQgaXMg
dGhlIGZyZXF1ZW5jeSB0aGF0IGlzIHJlYWNoYWJsZSB3aXRob3V0IGFueQp0dW5pbmcuIFR1bmlu
ZyBpcyBqdXN0IGEgcGx1cy4gSWYgdHVuaW5nIGZhaWxzLCB3ZSBmYWxsYmFjayB0byB0aGUKcmVn
dWxhciAiYmFzZSIgc3BlZWQsIHdoaWNoIGp1c3Qgd29ya3MuCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
