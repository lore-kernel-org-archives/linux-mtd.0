Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8241DECD993
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxG6leSGUc/7rxKeuhLTadTclczpBwgxP75INGY5o5U=; b=jeDkhprQJn8iVS
	K57iqwSZXMwBfrRQjMi00cik2zCkpiyhIbL+FHAlIQ0mLsgxPl+EIMx4KxAClI05Ey92oKVu+jJok
	8pfOScLcjLcagt/CSHu2dOhuGrmu7L2DQniDLfnFJrH6tfDC0+paOLGrrV2O3vomopi9kQCgvCS5q
	FIL2zHa3lIC4eEOw32zIcdkus1LuNvWZxvKSIkdHHP/y+3/sqqsxUEIE5Dt87/dfUA+MCRABveZfV
	x12gZTgK6EkLwiXkp3D1x4larjqdpkn1MQ7Lwm7fPhbGXoL+TVLLXotDubEL/pKOG1Ropj/slXWNp
	39Ck5hbjqqf+XQjgisUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Nj-0000000AJfr-04OI;
	Thu, 05 Feb 2026 17:43:07 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Ng-0000000AJf5-07vR
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:43:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 40DA6C243B0;
	Thu,  5 Feb 2026 17:43:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08F036074D;
	Thu,  5 Feb 2026 17:43:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9186F102F2A49;
	Thu,  5 Feb 2026 18:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770313381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qiN/3v4/7cTvLyPOBDwDVYZwm4UqwWylArbTyjrlN9M=;
	b=koOhIqByf1PKGszpESdoit5d4AOL4n2V9Nxu9ktt8LL5DiM5CImtOiM3/utZPP/fdkxvoy
	10PaaCTcKImUUMy9Td74AjclkZOzhX/AYXMkEZm8ClxTAwxilQaMW2RIdrKxVzn1NKhXmd
	a18epp3JweKiXzaltKKgeovGL1frD7c5NqdB48l2WhYyE5Dg4yQY1WbxHk6LLDsS+9VG2r
	/yK0ER5r+NkOePxvU1rCmzTJmhb9Bfn4AlUnle7Imef/fb+CSyrILNh+PJNrJmMOjDezXf
	kOqAPH9oHk7NcRiIlQT3qof/MStz4uzgz4CiRQRlwjzTsCLOzU5JBKC+EgNZqA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 10/12] spi: cadence-quadspi: implement PHY tuning
 algorithm
In-Reply-To: <20260113141617.1905039-11-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:15 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-11-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:42:57 +0100
Message-ID: <875x8bgk7y.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_094304_208323_9E642D56 
X-CRM114-Status: UNSURE (   9.66  )
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

T24gMTMvMDEvMjAyNiBhdCAxOTo0NjoxNSArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBJbXBsZW1lbnQgUEhZIHR1bmluZyBmb3IgU0RSIGFuZCBERFIgbW9k
ZXMuIFBIWSB0dW5pbmcgY2FsaWJyYXRlcyBSWAo+IGFuZCBUWCBkZWxheSBsaW5lcyB0byBmaW5k
IG9wdGltYWwgdGltaW5nIGZvciBoaWdoLXNwZWVkIG9wZXJhdGlvbi4KPgo+IEFkZCBETEwgbWFu
YWdlbWVudCBmdW5jdGlvbnM6Cj4gLSBjcXNwaV9yZXN5bmNfZGxsKCk6IFJlc2V0IERMTCBhbmQg
d2FpdCBmb3IgbG9jawo+IC0gY3FzcGlfc2V0X2RsbCgpOiBDb25maWd1cmUgUlgvVFggZGVsYXlz
ICgwLTEyNykKPgo+IEFkZCBwcmUvcG9zdCBjb25maWcgZnVuY3Rpb25zIHRoYXQgZW5hYmxlIFBI
WSBtb2RlIGR1cmluZyB0dW5pbmcgYW5kCj4gcmVzdG9yZSBub3JtYWwgb3BlcmF0aW9uIGFmdGVy
d2FyZC4gUEhZIG1vZGUgY29uc3VtZXMgb25lIGR1bW15IGN5Y2xlLAo+IHNvIGFkanVzdCBkdW1t
eSBjb3VudCB0byBtYWludGFpbiBjb3JyZWN0IGZsYXNoIHRpbWluZy4KPgo+IFNEUiB0dW5pbmcg
dXNlcyAxRCBzZWFyY2ggYWNyb3NzIFJYIGRlbGF5cyBhdCBmaXhlZCBUWC4gU2VhcmNoIGZvcgo+
IHR3byB2YWxpZCB3aW5kb3dzIGF0IGNvbnNlY3V0aXZlIHJlYWRfZGVsYXkgdmFsdWVzLCBzZWxl
Y3QgdGhlIGxhcmdlcgo+IHdpbmRvdywgYW5kIHVzZSB0aGUgbWlkcG9pbnQuCj4KPiBERFIgdHVu
aW5nIHVzZXMgMkQgc2VhcmNoIGFjcm9zcyBSWCBhbmQgVFggZGVsYXlzOgo+IC0gUHJpbWFyeSBh
bmQgc2Vjb25kYXJ5IFJYIGJvdW5kYXJ5IHNlYXJjaGVzIGF0IGRpZmZlcmVudCBUWCB2YWx1ZXMK
PiAtIEJpbmFyeSBzZWFyY2ggZm9yIGdhcCBib3VuZGFyaWVzIHdpdGhpbiB2YWxpZCByZWdpb24K
PiAtIFRlbXBlcmF0dXJlIGNvbXBlbnNhdGlvbiB3aXRoIG1pZHBvaW50IGNhbGN1bGF0aW9uCj4g
LSBTeXN0ZW1hdGljIGJvdW5kYXJ5IHNlYXJjaGVzIHVzaW5nIDQtc3RlcCBpbmNyZW1lbnRzCj4K
PiBUaGUgRERSIGFsZ29yaXRobSBmaW5kcyB0aGUgZm91ciBjb3JuZXJzIG9mIHRoZSB2YWxpZCBy
ZWdpb24sIGlkZW50aWZpZXMKPiBnYXBzLCBjYWxjdWxhdGVzIHRlbXBlcmF0dXJlLWF3YXJlIG1p
ZHBvaW50cywgYW5kIHZhbGlkYXRlcyBmaW5hbCBzZXR0aW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6
IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPgoKVGhpcyBjb21taXQgaXMgZ29sZCwgdGhh
bmtzIGEgbG90IGZvciB0aGUgZGV0YWlscyBpbiB0aGUgY29tbWVudHMuCgpJIGhhdmUgbm8gYXV0
aG9yaXR5IG9uIHRoaXMgcGFydCB0byBhY2tub3dsZWRnZSBpdCBmb3JtYWxseSwgYnV0IEkKYmVs
aWV2ZSB0aGlzIGlzIGdyZWF0IHdvcmsuIExvb2tpbmcgZm9yd2FyZCB0byBzZWUgaXQgd29yayBp
biBvY3RhbCBEVFIKbW9kZSBub3cgOy0pCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
