Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A2FC33CB3
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:29:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F4B52075B
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NtD4jMf/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F4B52075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xwueh25+Y4B5Q8hg8zl3+e80+qbAudJ1GaUAwMI9WyI=; b=NtD4jMf/hmnQf7
	OkNlPj960bgQ2t5FPqqbaU673cvBWAMucyiNkIUX4Q6I+6e7xCrTvcJFfmtcyjvOgc8OyIR7vfuB7
	Skv70v8b3e8K2AbocIN3kmc+MIor/LQA42vNbLAtdc4itbjo9Ab7yuTCxqBXvPBrI9hNPQX4WxIbO
	AEX0arhNPY2+hEeOdf/MWdduTUMJcQbWIe2LTWNpCSGXvKHp0DKF9uN5qYg3uSYMEni6zr+nBht2m
	84I04k7QeW5Ib5GtiODf2lPUZIFtJxmr/jxDFmpVKb/It+PZfoi4cx/7r8VqSE4Dj1vc14C7SV86D
	026Bkp8IuZCtf5pezWFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irQ0E-0004is-SU; Tue, 14 Jan 2020 17:29:18 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irQ0A-0004ed-B0
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:29:17 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D0F5120000E;
 Tue, 14 Jan 2020 17:29:11 +0000 (UTC)
Date: Tue, 14 Jan 2020 18:29:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: brcmnand: Set appropriate DMA mask
Message-ID: <20200114182910.1d7d447f@xps13>
In-Reply-To: <20200114170710.1980-1-miquel.raynal@bootlin.com>
References: <20191218005635.31636-1-f.fainelli@gmail.com>
 <20200114170710.1980-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_092914_515123_556D9C3C 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBv
biBUdWUsIDE0IEphbiAyMDIwCjE4OjA3OjEwICswMTAwOgoKPiBPbiBXZWQsIDIwMTktMTItMTgg
YXQgMDA6NTY6MzUgVVRDLCBGbG9yaWFuIEZhaW5lbGxpIHdyb3RlOgo+ID4gTkFORCBjb250cm9s
bGVycyA+PSA3LjAgd2l0aCBGTEFTSF9ETUEgc3VwcG9ydCBwaHlzaWNhbCBhZGRyZXNzZXMgdXAg
dG8KPiA+IDQwLWJpdCwgc2V0IGFuIGFwcHJvcHJpYXRlIERNQSBtYXNrIGZvciB0aGF0IHB1cnBv
c2UuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlA
Z21haWwuY29tPiAgCj4gCj4gQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG5hbmQvbmV4dCwgdGhhbmtzLgoKQXMg
YW4gRllJLCB0aGUgc3ViamVjdCBwcmVmaXggc2hvdWxkIGhhdmUgYmVlbiAibXRkOiByYXduYW5k
OiBicmNtbmFuZDoiLiBJCmNoYW5nZWQgaXQgYmVmb3JlIGFwcGx5aW5nLgoKClRoYW5rcywKTWlx
dcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
