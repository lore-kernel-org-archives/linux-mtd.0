Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA46EC54E67
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6o5TeKQkL7Zd849dORnhnc5jOlPl00nvUQ0T5nWMFI8=; b=A9OlNX+vJ3Cs00
	od28LvcPcvxBo8AoxXEh5mNtxigR2GXQchr+drnoR6+FPZKB+7kPFlgRez33I4dG6SK4lguYz0em0
	aT7BFXkhb2CdO2F4/GpsTITCz4cQ411/994Y25UynIF/cHw4MnvrdEo2n2t4wTp/DzBWVOuHi9Mak
	lVpBDHw46cXJZbn526mnk3XM1ojrmHgHPwoSeJeQXR1G8SADGBPKypdSREOVmtz/DvS/GI4UcXg1s
	Vx49czOuWfgaRCoUBOVZfwNysrx5den0oy+Oc/BGDvXbJVaQ9Jstoij+2k4xInfflqNTOOe7s3iWx
	qtqkT1I+UUkZb1BFwsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqi-00000000oQn-2zIK;
	Mon, 11 Mar 2024 09:21:36 +0000
Received: from mail.buildbrigade.pl ([135.125.238.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjbqe-00000000oOM-1kfy
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 09:21:34 +0000
Received: by mail.BuildBrigade.pl (Postfix, from userid 1002)
	id A87B4A2C01; Mon, 11 Mar 2024 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=BuildBrigade.pl;
	s=mail; t=1710148255;
	bh=EYN951LA1I6x2LqQG9SRvdSsS/DbVhjOvb+nDwRFhwc=;
	h=Date:From:To:Subject:From;
	b=nFO7np1Sb94TWQOfgWs2CIrueuxNk/ZcD/sxwBeqpVykzjF9UtT3x+TWTTeGgYFb/
	 QxvNnJXhi7ha3mO5mjyv8i9Ki8h8w5ohsF3+yqTFa6NfjCtas5VBE6UkAAja2IEkvy
	 c/daB+fNGBsCScnEyxBR2qY4zK+xs/t1tZPJE4/ZV/C1ZpmuYhKg19fNLKRaXPo62x
	 RURJIGFy9/HOoEas5nXpQpA96Y7FZ8cYLHtt3eu3uLmNDjxjxcEcZ8rTfIceH72y96
	 uqqXrnXZkwqLe6576uKmv8c50YZP7zopYP8B40jOg0YKZ5O/k9vrBRwxbcieHltsml
	 xI4l/t3DEzqQQ==
Received: by mail.BuildBrigade.pl for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2024 09:10:28 GMT
Message-ID: <20240311074500-0.1.c1.1gy12.0.kufc1c640w@BuildBrigade.pl>
Date: Mon, 11 Mar 2024 09:10:28 GMT
From: "Tomasz Mrozowski" <tomasz.mrozowski@buildbrigade.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Niskokosztowa_modernizacja_o=C5=9Bwietlenia?=
X-Mailer: mail.BuildBrigade.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_022132_673794_697324E9 
X-CRM114-Status: UNSURE (   1.83  )
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

V2l0YW0sIAoKamVzdGXFm215IHBvbHNraW0gcHJvZHVjZW50ZW0gb3ByYXcgb8Wbd2lldGxlbmlv
d3ljaCwgZG9zdG9zb3dhbnljaCBkbyBwb3RyemViIHNla3RvcmEgcHJ6ZW15c8WCb3dlZ28uCgpO
YXN6eW0gY2VsZW0gamVzdCBwb21hZ2FuaWUgZmlybW9tIHByemVteXPFgm93eW0gdyBvc3pjesSZ
ZHphbml1IGVuZXJnaWkgaSB6d2nEmWtzemFuaXUgZWZla3R5d25vxZtjaSBwb3ByemV6IG1vZGVy
bml6YWNqxJkgb8Wbd2lldGxlbmlhLgoKUHJ6ZXByb3dhZHppbXkgbmllem9ib3dpxIV6dWrEhWN5
IGkgYmV6cMWCYXRueSBhdWR5dCBvxZt3aWV0bGVuaWEgdyBQYW5pL1BhbmEgZmlybWllLCBrdMOz
cnkgcG9tb8W8ZSB6aWRlbnR5Zmlrb3dhxIcgcG90ZW5jamFsbmUgb3N6Y3rEmWRub8WbY2ksIGph
a2llIG1vxbxuYSBvc2nEhWduxIXEhyBwbyB6YXN0b3Nvd2FuaXUgbmFzenljaCBvcHJhdy4gCgpE
emlhxYJhbXkga29tcGxla3Nvd28sIHBvY3rEhXdzenkgb2Qga29uc3VsdGFjamkgbG9rYWxueWNo
LCBwb3ByemV6IHByb2pla3Rvd2FuaWUgb3B0eW1hbG5lZ28gbmF0xJnFvGVuaWEgxZt3aWF0xYJh
LCBhxbwgcG8gcHJvZmVzam9uYWxueSBtb250YcW8IG5hc3p5Y2ggcHJvZHVrdMOzdy4gCgpPcHJh
Y293YWxpxZtteSBpbm5vd2FjeWpueSBtb2RlbCBmaW5hbnNvd2FuaWEgaW53ZXN0eWNqaS4KClBy
b3N6xJkgbyBvZHBvd2llZMW6LCBqZcWbbGkgamVzemN6ZSBuaWUgd3ltaWVuaWxpIFBhxYRzdHdv
IG/Fm3dpZXRsZW5pYSBuYSBMRUQgaSBqZXN0ZcWbY2llIHphaW50ZXJlc293YW5pIG5hc3rEhSBw
cm9wb3p5Y2rEhS4KCgpQb3pkcmF3aWFtClRvbWFzeiBNcm96b3dza2kKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
