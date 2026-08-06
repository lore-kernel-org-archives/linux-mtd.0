Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A2FC56208
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2026 09:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPGz5nxXPrEDKWsIxwyDr7UNzzjWsvPnSmqEXMRCk1Q=; b=mdgFm4pmwXwGzo
	d5hejWlMs9otHQF5kPK62kz2cjPYObEeAme7BxsnktRudXRmE3IXF7oD/5KECCC/eC/vtbZzLQlrV
	Rojj/9JwNQHMuWR2R9VwkhzEpAkbBNCCBRsOUEBSS/Olu60Nu1ATAfVGHsNFpbaeHel+ospBTAOd8
	1pMMU0ol1a7EjID+dySd52ZZyX6N3ajAlao0rQhQa7ZZoaGhB8DvWLXU6knO9QUCZNF9WCV4cahdG
	o3BQfi6pgFJwmM7dpiov+wosaOY0hP9gC78mm8gA4ojb5flOSc3mzC5SnzoWr7N0/1OPGf+PlHyVk
	5Juy49C5NmMVXp1fYGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruhm-00000005TGx-3frz;
	Thu, 06 Aug 2026 09:48:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruhj-00000005TG0-2fWz
	for linux-mtd@lists.infradead.org;
	Thu, 06 Aug 2026 09:48:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D7991A1466;
	Thu,  6 Aug 2026 09:47:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 232E5602B8;
	Thu,  6 Aug 2026 09:47:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83C7611C35E0A;
	Thu,  6 Aug 2026 11:47:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786009671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MGykurD3JoYTTA6KklkbihnpdkA936KbZxsQarWt4Z4=;
	b=IIIFNSan98DwZk5kRaG/iNl4PyIhh0Rt5X5bGW/5p4A4aijSmEPgMcwNWBwdwijN32haLt
	JxKFmOOmnZ0pDPVm+hqi+96KOSHkrqvNthzLmovY3NbJAoeoYWPy7938MjeWxgoiuVOIVc
	RQ2kDyB98l51xf8pQv8dmgfj3hWyv88A0AmPj6xrdn6LrPKFxgdAu5Ryw3bZ8YQZvRmV3v
	+AoBaav38L4gc29Reh8bOvLEYZDfCgj/DnIy+CS/C3U3JmxW4NY9uaPKazMUSJZZEj13eN
	5ziv2rX/MtWtozuCV28c3jJJL867NEanv8sodQCpElzbW3C2JQCO6/wUFbd6TQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/30] mtd: spi-nor: winbond: Stop filling the .name entry
In-Reply-To: <DJRJJB4NEUEP.168MF88DBSFDF@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 15:59:53 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-3-87e5d3122244@bootlin.com>
	<DJRJJB4NEUEP.168MF88DBSFDF@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 06 Aug 2026 11:47:46 +0200
Message-ID: <87mruzeg1p.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_024759_814738_B6D41C9E 
X-CRM114-Status: UNSURE (   7.08  )
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

SGVsbG8sCgo+PiBSZXBsYWNlIHRoZSBuYW1lcyB3aXRoIGEgY29tbWVudCBhYm92ZSB0aGUgZW50
cnkgd2l0aCB0aGUgbmV3bHkgaW5zdGF0ZWQKPj4gbmFtaW5nIHNjaGVtZSB0byBpbmRpY2F0ZSB3
aGF0IGNoaXBzIGFyZSBjb3ZlcmVkIGJ5IGVhY2ggZW50cnkuCj4KPiBUaGlzIGlzIGV4cG9ydGVk
IHZpYSBzeXNmcywgc28gdGhpcyBjb3VsZCBiZSBhIHJlZ3Jlc3Npb24uCgpXZWxsLCBhY3R1YWxs
eSBuYW1lcyBhcmUgbm90IGV4cG9ydGVkIHRocm91Z2ggc3lzZnMuIE9ubHkgdGhlIG10ZCBuYW1l
CmlzIGF2YWlsYWJsZSB0aHJvdWdoIHN5c2ZzLCBhbmQgaXQgaXMgc2V0IHRvIGBzcGlYLllgLiBU
aGF0IG5hbWUgaXMgb25seQphdmFpbGFibGUgdGhyb3VnaCBkZWJ1Z2ZzLCB3aGljaCBpcyBub3Qg
cGFydCBvZiB0aGUgc3RhYmxlIEFQSS4KCkkgc2hvdWxkIGhhdmUgY2hlY2tlZCBiZWZvcmUgZHJv
cHBpbmcgYWxsIG15IHBhdGNoZXMuLi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
