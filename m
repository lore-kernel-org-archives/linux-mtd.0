Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FFEC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtTQu+YIYw7d2FVTEvDkm0ljlAkB+B+yVCae9lQt2nU=; b=BRyduc+nbWcXed
	Mz8AXBcLxnLpkDaufJwU5NQh0/UtEw3MLBPx5OogPbUUrB8CGnT+CQt7M6ftvnTUN3yI5PSRV8Nr5
	MM7mZ/0b9it6rsRBPV82pKEzyWVTpIMyujhcilzZgKVrwr8WQNdQXVLTRcIVaOc3KnDB3blw15lVk
	k/c1QXwJTO31fzC9DWqzQe6lAzECFjkX26EsmI3xI0E6ll8LXn31+nwLCGOk4L5jsz99VSM4V6T9d
	apMijMT2U4idSK4XMDuAZ19oMM2QjxUKuCOuYOxWafcjRVm2XW/SYU0h9Uov+b02XWs1rFsdQchpg
	G8wZsIgFVBNQ8eIkqcDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9pY-0000000CyoQ-3Shu;
	Wed, 15 Jan 2025 20:17:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8hj-0000000Cqxr-3rlZ
	for linux-mtd@bombadil.infradead.org;
	Wed, 15 Jan 2025 19:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F2jtsM4iFmAwPDGJ48GZ7Yhx6Ks7S2FfUOnYP4ZtXK8=; b=HFVrRlT2j0gsPeCn98IUeY+kA3
	0do07a+ypuUtl7R6hCWKU1RCYQoL/N+QAXc+H6KisaQOAHib/aFx1d0/K5n2NMThX1NGffIWT7XD1
	4QEtfhHeAE5AYkDWr4xjueFbS1vKHi1eN6yVlz9GmDmHyLZJQmIc/d3AH2q19hVq6hlZXsml2YkKk
	dz/77eZS+sAs/qOToxe/7MYBilWL32zbEdBPiAPYk3R8rl5giUJLpgyhKSWU7KZBowpUfd1FX1Jd+
	okNX0/2Xe/7EQ5MEb/3O+UAuXf2NGeKQeNgmuPRdjS+JmD6vJK0RDE8hyb7V9jd/dG7Zs1LO+Tj6z
	3bNq3AjQ==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8hg-0000000AvDK-1Dgz
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 19:05:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3CD540006;
	Wed, 15 Jan 2025 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736967920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2jtsM4iFmAwPDGJ48GZ7Yhx6Ks7S2FfUOnYP4ZtXK8=;
	b=QLwpLVmNjOAd3v02JXwQ3/QxmxI9/YWWU9EHO32d6Gx8beo7LU3Vci4Desx+p5itw/UAMJ
	OK+0PkxAZBogYf7dMpMAmnPrvRPZ+AaPKl2QvdrvjkK7Zfe+x0hRsKXfaDNPg7+rXrW0PC
	R60JkWj83jXQUIiIrezzjuVYTGRK0MTbH/uq+IHcqo0sS3eqweCWwi5xbAIsUH+fO4Qogh
	SvbegI+OlVYT2A14ImIRYAcKgHB16NjHIl147CB32ERWOUtklt1/zs4983QcVT4xStAleA
	DuKLPxzDeRjoTWt4RrnUrgdA7K+iSBKEEXEkP6ckBR0v6fJrkN2D9B7oR8hX4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumar.l.rabara@intel.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux@treblig.org,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  u.kleine-koenig@baylibre.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: rawnand: cadence: improvement and fixes
In-Reply-To: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
	(niravkumar l. rabara's message of "Wed, 8 Jan 2025 21:52:31 +0800")
References: <20250108135234.3107502-1-niravkumar.l.rabara@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 20:05:19 +0100
Message-ID: <87jzavnbio.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_190524_498564_A1B935B3 
X-CRM114-Status: UNSURE (   7.71  )
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

SGVsbG8sCgpPbiAwOC8wMS8yMDI1IGF0IDIxOjUyOjMxICswOCwgbmlyYXZrdW1hci5sLnJhYmFy
YUBpbnRlbC5jb20gd3JvdGU6Cgo+IEZyb206IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2a3Vt
YXIubC5yYWJhcmFAaW50ZWwuY29tPgo+Cj4gVGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIGltcHJv
dmVtZW50cyBhbmQgZml4ZXMgZm9yIGNhZGVuY2UgbmFuZCBkcml2ZXIuCj4gVGhlIGNoYW5nZXMg
aW5jbHVkZToKPgo+IDEuIFN1cHBvcnQgZGVmZXJyZWQgcHJvYiBtZWNoYW5pc20gd2hlbiBETUEg
ZHJpdmVyIGlzIG5vdCBwcm9iZWQgeWV0Lgo+IDIuIE1hcCB0aGUgc2xhdmUgRE1BIGFkZHJlc3Mg
dXNpbmcgZG1hX21hcF9yZXNvdXJjZS4gV2hlbiBBUk0gU01NVQo+ICAgIGlzIGVuYWJsZWQsIHVz
aW5nIGEgZGlyZWN0IHBoeXNpY2FsIGFkZHJlc3Mgb2YgU0RNQSByZXN1bHRzIGluCj4gICAgRE1B
IHRyYW5zYWN0aW9uIGZhaWx1cmUuCj4gMy4gRml4ZWQgdGhlIGluY29ycmVjdCBkZXZpY2UgY29u
dGV4dCB1c2VkIGZvciBkbWFfdW5tYXBfc2luZ2xlLgoKVGhlIHBhdGNoZXMgbG9vayBnb29kIGJ1
dCB0aGV5IGFsbCBtaXNzIHRoZSBGaXhlcyBhbmQgQ2M6IHN0YWJsZSB0YWdzLAphcyBJIGJlbGll
dmUgdGhlc2UgZml4ZXMgc2hvdWxkIGJlIGJhY2twb3J0ZWQuCgpQbGVhc2Ugc2VuZCBhbiB1cGRh
dGVkIHZlcnNpb24gd2l0aCB0aG9zZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
