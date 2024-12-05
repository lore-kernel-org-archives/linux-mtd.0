Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E3FE7716C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96aCQH8XxJGE3VwWe8TT6fLBD2RIOybUX4QFO5jxnyg=; b=qoAu2B6YSsXj5G
	lVeXgY0IUnBm0Cbs7oQ5br2HMx3eiCyn+18kk0VvSXqemmeznee0PVv5nVW2ey8uiOjt0+nrk7TnK
	KjisQiodqA1uuuhJnuDKjY+UHqtPXV3K537s1POQh+kYcolyV9hAH9hu9LNLmqbDzEh4Z6DRTcyVN
	i/Zhb0TRbQNqzWOg3spKKiufS/mYIZ6iDjTwHTADI48/YgyZm3WeOylYa1jbwudT1lebHz1tHayFz
	FIK/lV3ICYP0MfoJ2QHLth0ONABiCmn4uqMBhdkXFopQA9GuUlFyBZXKQhGcoRmdHEMJSOcWvq2Qb
	8mVou1c+SmivSTOZ0MOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVp-0000000Fpn2-2Sib;
	Thu, 05 Dec 2024 11:59:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Kd-0000000FZyf-3VAW
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 10:43:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D2CCFF813;
	Thu,  5 Dec 2024 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733395418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oCEXJaSf7++tTh46Mti6qed6IitnOv00nmI1R0Mnfxg=;
	b=AbYNj6NomcLsuzjcRsuJz4yCTQsTwOdY067jlx85b6S9nPbBlNT7AJN6hnyhe0Sp+L5Krv
	vazjwko2Ul7c+uzVWZmM2D50OiJARdhazBAwLW9Oy0zw2kAefU2RQgUjWtB9LDGCPUmD/2
	p8lHzaOFZdJMTkp+2Z85TjhOtwaxWCCqY+TkAQxx9ni2jwpSxwI/dCN7qLKLAnQO0OGuRw
	OKXK8iXIzLGBG5PuhJQ+QqZyyUjAvEmVQYO7fN5lzolsoKKO8yaYxxKn7evWu9kzkyTKoF
	cPDPGfER4/D6cKkb/rrnfebmGimnc0smctpqmwLelQhbgat2bCr0NrIsoGUfWw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v3 0/3] mtd: spinand: Add support for SkyHigh S35ML-3 family
Date: Thu,  5 Dec 2024 11:43:30 +0100
Message-ID: <173339519120.766262.748266546836953897.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
References: <cover.1733193264.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024339_999989_EB5DDCD9 
X-CRM114-Status: UNSURE (   8.48  )
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

T24gVHVlLCAwMyBEZWMgMjAyNCAxMTo0Njo0NyArMDkwMCwgdGt1dzU4NDkyNEBnbWFpbC5jb20g
d3JvdGU6Cj4gRnJvbTogVGFrYWhpcm8gS3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24u
Y29tPgo+IAo+IFRoaXMgc2VyaWVzIGlzIHN1Y2Nlc3NvciBvZiB0aGUgcGF0Y2ggc3VibWl0dGVk
IGJ5IEtSIEtpbToKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXgt
bXRkL3BhdGNoLzIwMjQwODIwMDY0NTQ3LjUwMzUtMS1rci5raW1Ac2t5aGlnaG1lbW9yeS5jb20v
Cj4gCj4gQ2hhbmdlcyBpbiB2MzoKPiAgIC0gQWRkIEZpeGVzIHRhZyB0byB0aGUgcGF0Y2ggMS8z
Cj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8zXSBtdGQ6IHNw
aW5hbmQ6IFJlbW92ZSB3cml0ZV9lbmFibGVfb3AoKSBpbiBtYXJrYmFkKCkKWzIvM10gbXRkOiBz
cGluYW5kOiBJbnRyb2R1Y2UgYSB3YXkgdG8gYXZvaWQgcmF3IGFjY2VzcwpbMy8zXSBtdGQ6IHNw
aW5hbmQ6IEFkZCBzdXBwb3J0IGZvciBTa3lIaWdoIFMzNU1MLTMgZmFtaWx5CgpQYXRjaGUocykg
d2lsbCBiZSBhdmFpbGFibGUgd2l0aGluIGhvdXJzIG9uOgptdGQvbGludXguZ2l0CgpLaW5kIHJl
Z2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
