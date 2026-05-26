Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F29CD5BC8
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCp69+uZWZNDBtvPz+W1Ij8DuIu5xASsUthX6BT8qKM=; b=Eh+VA9UstnULdC
	0OMjh/c5dIET0xzOeMD7ocmtDRGf5M8vK3jezw7qlSld395Pq7ZphbwEyqFmBAFGvzNnqQ7LiHoBj
	ebCaeao50aMkXcXVNjd8ACd+Vo9So8GK9wgE3NDVcQDzIyjvKhRekjZ+OZkNyCSoDPHPZVcTdZKRl
	fCInDUaMdWYeNOQWHcfswlEBtgHycu2c2Ep9/i6icP3OLL4CoKHsn1SxeAOF2HZclZm51SOFH4/jo
	Gd4kOP0agd+Qz+X7rjiNLaJYu4434xVgYttxYesvGtjo/Pabbj4+BuRlxDz277peLWrvJxZju1D9a
	Jq+QvhhM1fkvmrt3pbKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt11-00000002Cmv-2sDv;
	Tue, 26 May 2026 14:44:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt0z-00000002Cly-0Ech
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:44:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 137AFC79ABD;
	Tue, 26 May 2026 14:44:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8456F6011D;
	Tue, 26 May 2026 14:44:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FAF110888872;
	Tue, 26 May 2026 16:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779806652; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p5nt9YTtEoTZf0kfn3EpHA1X6rrmupT53YJix95PNrU=;
	b=Vv+hmA47N3XhbjDiDUSrk2tGTIMJ10KaA1NKpWXwAmBiOjPjMsNPt2J5UkiXHZi56+XWtF
	leSfo1gOjz2HrKiDS52d9Yt4e8EALXnMNdjRqUtAPgzVAA3Jpt/X2G6DDBU9j3G5g9y3nK
	VQt16fM+ArBXKbfKfkrFTlQX6SrIsfw5U2v05n8X5GNjDvAHCYof4JVnQ1zKzE6nvwRrl2
	FBSX+611O3XCO4Fr49q56FDiEwgb2D90rJv5HUPQok3ztqfKrTCpAttu0yTm53Tk9YonB3
	FLOTPMJFLvBtoq6fkfwjh46zZC+Ud+qHiDgy4D0obi/gzvZDRkvHfvVg9m6jQw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <2vxz8q965ub7.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	26 May 2026 12:39:08 +0200")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
	<87o6i7o0tj.fsf@bootlin.com> <2vxz8q965ub7.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 26 May 2026 16:44:05 +0200
Message-ID: <87v7cakz7u.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074417_261058_2B860A09 
X-CRM114-Status: GOOD (  12.73  )
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

SGkgUHJhdHl1c2gsCgo+IEFuZCBoZXJlJ3Mgd2hhdCBJIGFtIHRoaW5raW5nOiB0aGUgZmlyc3Qg
OSBwYXRjaGVzIGFyZSByZXZpZXdlZCBhbmQgZ29vZAo+IHRvIGdvLiBJIHdhbnQgdG8gbGFuZCB0
aGVtIGluIHRoaXMgbWVyZ2Ugd2luZG93IHNvIHdlIGN1dCBkb3duIHlvdXIKPiBwYXRjaHNldCBh
bmQgbGFuZCBzdHVmZiBzb29uZXIuCj4KPiBVbmZvcnR1bmF0ZWx5IEkganVzdCBjYW4ndCBzZWVt
IHRvIGZpbmQgdGltZSB0byByZXZpZXcgdGhpcyBzZXJpZXMgc28gSQo+IGhvcGUgdGhpcyBoZWxw
cyBzb21lIGF0IGxlYXN0LgoKSSBrbm93IHdoYXQgdGhlIG1haW50YWluZXIgbG9hZCBjYW4gYmUs
IHNvbWV0aW1lcyBpdCBkb2VzIG5vdCBwbGF5IHdlbGwKd2l0aCB0aGUgcmVzdCBvZiB0aGUgeW91
ciBwZXJzb25hbCBhbmQgcHJvZmVzc2lvbmFsIGR1dGllcy4gQnV0IHRoZQpzZXJpZXMgaGFzIGFs
cmVhZHkgYmVlbiBvbiB0aGUgbGlzdCBmb3IgYWJvdXQgOCBtb250aHMsIGl0J3MgYmVlbiBsb29r
ZWQKYXQgYnkgb3RoZXIgcGVvcGxlLCB0aGUgb25lcyB3aG8gaGFkIGVub3VnaCB0aW1lIHRvIGRl
ZGljYXRlIHRvIGl0LiBGcm9tCm15IHBlcnNwZWN0aXZlLCBhc2tpbmcgc3VjaCBjb250cmlidXRp
b25zIHRvIHdhaXQgaW5kZWZpbml0ZWx5IGFuZCB0aGVuCnN1Z2dlc3RpbmcgcGFydGlhbCBhcHBs
aWNhdGlvbiB3aXRob3V0IGEgdGVjaG5pY2FsIHJlYXNvbiBpcyBub3QgYQpzdXN0YWluYWJsZSB3
YXkgdG8gaGFuZGxlIGNvbnRyaWJ1dGlvbnMuIFRoaXMgc2VyaWVzIGhhcyBub3QgbW92ZWQgbXVj
aCwKaXQgY291bGQgaGF2ZSBiZWVuIGFwcGxpZWQgKm11Y2gqIGVhcmxpZXIuIEkndmUgbm93IGFk
ZHJlc3NlZCBtb3N0IG9mCnRoZSBjb21tZW50cyBmcm9tIFNhc2hpa28sIHY2IGlzIGNvbWluZywg
ZnVydGhlciBpbXByb3ZpbmcgdGhlIHF1YWxpdHkKZm9yIHN1cmUsIGFzIHRoZXJlIHdlcmUgYnVn
cyAtIHRoZXJlIGFyZSBhbHdheXMuIEkgYW0gb2YgY291cnNlIGhhcHB5IHRvCmFkZHJlc3MgZnVy
dGhlciB0ZWNobmljYWwgY29uY2VybnMsIGlmIHRoZXJlIGFyZSBhbnksIGJ1dCBJIHdvdWxkCnN0
cm9uZ2x5IHByZWZlciBtZXJnaW5nIHRoZSBzZXJpZXMgYXMgdGhlIGNvaGVyZW50IHNldCBpdCB3
YXMgaW50ZW5kZWQKdG8gYmUsIHJhdGhlciB0aGFuIG9ubHkgdGFraW5nIHRoZSBwcmVwYXJhdG9y
eSBwYXJ0cy4KCk9uIHRvcCBvZiB0aGF0LCBhcyBtZW50aW9uZWQgcHJldmlvdXNseSwgSSBub3cg
aGF2ZSBhZGRpdGlvbmFsIHNwaS1ub3IKaW1wcm92ZW1lbnRzIGFuZCBjbGVhbnVwcyB3YWl0aW5n
IGJlaGluZCB0aGlzIHNlcmllcy4gS2VlcGluZyBzdWNoIGEKbGFyZ2Ugc3RhY2sgb2Ygb3V0IG9m
IHRyZWUgcGF0Y2hlcyBmb3IgbW9udGhzIGlzIGJlY29taW5nIHBhaW5mdWwgdG8KbWFpbnRhaW4u
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
