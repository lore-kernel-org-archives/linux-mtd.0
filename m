Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FEDC55174
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvuUzXsLyxUWtgV3yMpGcVd2meZ6rx8Cm97v7WJHFis=; b=132NyR7HWhB0QZ
	0FEFtXmc/CusbaoMnZLHVuv96d91Gk8qBFom4H6by6fiJ1a5rvbBJctBwaCptBh3oFd8uy5xHAViq
	Q7Tgj/cVcgOWDe7U6i6pW3MSQBVkdEYd7OMvyIUmwgJeYSdS8z5f0ZjaI6F1O0uA1OxgkZPNyhjOM
	iPoDhf8ow65aVeZBomqaQ/ZIAqyu+z4QVIuYvFAgoCUyA/+/UWdlQkedb8fzMcRLrqCkNs3fONGwh
	NJlXL+wr5htAZjdgYYbiMY1Y5mST++WqcBlHx6Nz5dAuMJHVygm84M2MdarhzGdaO5aVVPf2LE5PN
	EkZ8Suchl4CDa8/My+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXAd-00000003Xgr-1xst;
	Wed, 05 Aug 2026 08:40:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrXAb-00000003Xg9-0FFX
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:40:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A72934E410C9;
	Wed,  5 Aug 2026 08:40:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E071602AB;
	Wed,  5 Aug 2026 08:40:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B905D11C34466;
	Wed,  5 Aug 2026 10:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785919203; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dUlH8XTCI78+G9mOKZwP8xBH06VJOdo4pK9PvS5/zVM=;
	b=mxN66oVPldZ4OaeyVRG2Kb8wXwNhj9VYxPoAxUZ0MuE8t0yj6Uy8GRJ2Cj5LNgzeh/PGSG
	CcgbvLqfuZT/0IyuRiXMd7LvpNFVMvSWJ55xWPlINdO4foNGfK4RN8MuNlk/fz5E1oOpTq
	nFk8CDiKv9QdqiA9j6Oca5kTj94IOySBOGS6yemyKLvN5RbfaSST40VbM24mN4Nx4r8Wfz
	zC21eefD0gI3Rjx801ofJsO07z0y2MIGTpqgWC2splnE38jv8Raw4rw07gXQC61GhkxpXZ
	0OnzmpBxyHFnje+WpIWy0ntRewhe0nMX4so81gXUW2+O0jt0BWda2K7ioS+wxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/28] mtd: spi-nor: Clean Winbond W25QxxJV family
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
	(Miquel Raynal's message of "Wed, 05 Aug 2026 10:02:25 +0200")
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 05 Aug 2026 10:39:58 +0200
Message-ID: <874ih9eza9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_014013_243666_92CB0437 
X-CRM114-Status: UNSURE (   7.30  )
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

SGksCgo+IFRoaXMgc2VyaWVzIGlzIHByZXR0eSBzdHJhaWdodGZvcndhcmQsIGl0IGlzIGhlcmUg
dG8gY2xlYW51cCB0aGUgSlYKPiBlbnRyaWVzIGJ5Ogo+IC0gQWxpZ25pbmcgdGhlIGNvbW1lbnRz
IGFuZCAiZml4aW5nIiB0aGUgY2hpcCBuYW1lcyBpbiB0aGVtCj4gLSBSZW9yZGVyaW5nIHRoZSBj
aGlwcyBieSBkZW5zaXR5IGFuZCBmYW1pbHkKPiAtIFRlc3RpbmcgYW5kIHNob3dpbmcgYWxsIHRo
ZSBTRkRQIGNvbnRlbnQgYW5kIHBhc3NpbmcgYWxsIHRoZSBTUEkgTk9SCj4gICB0ZXN0cyB0byBl
bnN1cmUgYSBnb29kIGxldmVsIG9mIHN1cHBvcnQuCj4gLSBBZGRpbmcgYWxsIHRoZSBsb2NraW5n
IGluZm9ybWF0aW9uIHdoZW4gaXQgaXMgbWlzc2luZy4KCnY1IGlzIHJlYWR5IGZvciBodW1hbiBy
ZXZpZXcuIEkgYWxyZWFkeSBhbnN3ZXJlZCBtb3N0IG9mIFNhc2hpa28ncwpjb21tZW50cyAoc2Vl
IGNoYW5nZWxvZyBpbiB0aGUgY292ZXIgbGV0dGVyKSBhbmQgdGhlIG5ldyBvbmVzIGFyZSBqdXN0
CnVucmVsYXRlZCBvciB0b3RhbGx5IHdyb25nLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
