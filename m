Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BD9C43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 06:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BA320835
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 06:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cspz9ucG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H1+aHGzH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BA320835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lu1u1DEtMd5c0bKrhtYD6LHDmg5agXVKIN1Anm2b07Y=; b=Cspz9ucG6wIXMh
	k9JEIpYyq+fZVWCwsou7uJ5b/0wRJwFdp2eX0qmoUKFTT+mhC4st2x3QGthybbiDCnxH/L07rPqkn
	OiuOPAJyJNsK79aWYEgDJNmwzkdpLRKlUyntna8XuX4gwtYHjzNC1hLiOqLRAliSKhZuoC+WOZxqg
	LamNTG1J1rNk3ZWtgN3tL4J43xYyIJpsnDmug8jIQzV2SA2GdNS0Osa0ndngfAsreFCTdidTlzTgQ
	q3LzfVJBswByeRhoglNroF+oywhVRPTxr8UiMGv4rjq++f5Py7bCwv1IQ0YGvSqXZfLycuD8NFXfV
	ae2YCGK92/Jw82tQf/Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLMKu-0001Ct-Ji; Tue, 30 Apr 2019 06:33:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMKs-0001CU-PT
 for linux-mtd@bombadil.infradead.org; Tue, 30 Apr 2019 06:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2DKXYpumTVynwpBOvikXbGZEgOKGQWglUfpUwR8nA0w=; b=H1+aHGzH3zHaA0a6/v4Oekj3hO
 BH+cE6XBkwLhebxyAGd8Fot7ai9rrJYQGgbSzmZnxTJR3s1z41NC01JIgn35DY/THEKJI77jlNPDK
 wYLB0TJgyXHkzAMzbcmerQ1ssFzEpShaXqz/rwWRO+anWVwok/2qTb3yw3q8l+hU41qdbW2nGCzid
 n3v+YEPDJogCb3nD39Ni7ZtLwULn9XILwhBxpBWNrgguSkd27DKhV3B6b8F1INEq4MwUBswN0r2um
 SlRktXhbkfwGA51GO6OGi3Ld76FDTuVXwC4p0R1B6dhuU7zjGc+a2uu2KqOPXQwh6ljUQvTuDymul
 1wugYJqg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLMKp-0007Nd-Ng
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 06:33:49 +0000
X-Originating-IP: 81.185.165.117
Received: from xps13 (117.165.185.81.rev.sfr.net [81.185.165.117])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BF75B6000A;
 Tue, 30 Apr 2019 06:33:09 +0000 (UTC)
Date: Tue, 30 Apr 2019 08:33:08 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [PATCH 2/4] mtd: nand: Move ONFI code into nand/ directory
Message-ID: <20190430083308.1cd2d8ef@xps13>
In-Reply-To: <MN2PR08MB59511F374C25C091FF6EB316B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB59511F374C25C091FF6EB316B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_073347_819036_C9E326F6 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Christophe Kerello <christophe.kerello@st.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marek.vasut@gmail.com>,
 Liang Yang <liang.yang@amlogic.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Dmitry Osipenko <digetx@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmFtdXJ0aHksCgoiU2hpdmFtdXJ0aHkgU2hhc3RyaSAoc3NoaXZhbXVydGh5KSIgPHNz
aGl2YW11cnRoeUBtaWNyb24uY29tPiB3cm90ZSBvbgpUdWUsIDI2IE1hciAyMDE5IDEwOjUxOjU2
ICswMDAwOgoKPiBNb3ZlIGdlbmVyaWMgT05GSSBjb2RlIHRvIG5hbmQvIGRpcmVjdG9yeSwgd2hp
Y2ggY2FuIGJlIHVzZWQgYnkgU1BJCj4gTkFORCBsYXllci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
aGl2YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KClJldmlld2VkLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
