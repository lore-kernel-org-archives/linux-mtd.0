Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89635E91290
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qs0bgkeGRpy+a5mkrsTb/klGy1nYwq/sl7URNSGmQw4=; b=yZdN08NKNMNx+A
	HumaJux+21rSflc6wssENbUpaVtiikcJ0z0zN3p5ZJB4KrHL85LVnc0aI0QhJ/2aOlXpY/28VMltX
	hxwPtwNr7u4/pcg358ObngddFeyyZPOpKdG32G465VoBxt9yF/v+GSda6a8izhevKR2TUsPDcWhGx
	Tzd4lTGeTXfuR8vJInHQGcMCbzgqKxhU0iOFnSanDqUAz4CRrJX2T4bSQMB46GGNMvGDzoa1voNmc
	/f/b/GPtqbiaHvydAGUNim5Kv15bgopTRWEEYb/x4Lwqd0fOI35YA/VtFMj930XVxH9R88riFo5Pm
	ywj7Tjz/nVOpYeGKCvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnun7-00000009c6G-2a9j;
	Thu, 05 Feb 2026 08:32:45 +0000
Received: from mail.venturex.pl ([141.95.86.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnun4-00000009c5r-2rdA
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 08:32:44 +0000
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id F1C1C23E78; Thu,  5 Feb 2026 09:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1770280354; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=JcfJxvc4+LA/XDzBsqhNGwM9zDvWIALNZ5G+gvd5ogWFIg7IKwa7adM39Pp2A51WX
	 pYio60P3eVvIfV18l92A5CZCMJEN8Iujn4Px+Kko0SsUkNnuOLYVjysgJBQ1m+XbjG
	 1z5dMsoVgTUtO6OQ31D2nwEVzpa1o9fSFgOsEoehu1M8U6D81InqvnQkr0knW/X9Q+
	 ScMeNkFOAN+bwHQsuJEwMsVCKCjR3og7bL6eTu09szD73f2VjXTB1D0502wusca45o
	 hOXElWiSnguTHsoIL7IDWPrsU7PB6AzCVCTjztHNao8XEwEX8Rm4TNiXPICAHbmD7G
	 hnW+3KHC1CLXA==
Received: by mail.venturex.pl for <linux-mtd@lists.infradead.org>; Thu,  5 Feb 2026 08:30:49 GMT
Message-ID: <20260205084500-0.1.ci.2jdat.0.0fkqifbyny@venturex.pl>
Date: Thu,  5 Feb 2026 08:30:49 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_003243_312707_3CC576B1 
X-CRM114-Status: UNSURE (   1.61  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgYnlsaWJ5IFBhxYRzdHdvIHphaW50ZXJlc293YW5pIHJv
em1vd8SFIG8gbW/FvGxpd3ljaCByb3p3acSFemFuaWFjaCBkbGEgc3dvamVqIGZpcm15IGkgcm9k
emlueT8KCk5vd2VsaXphY2phIHVzdGF3eSBvIEZ1bmRhY2phY2ggUm9kemlubnljaCBvdHdpZXJh
IHByemVkIHByemVkc2nEmWJpb3JjYW1pIHp1cGXFgm5pZSBub3dlIG1vxbxsaXdvxZtjaSBvY2hy
b255IG1hasSFdGt1IGkgcGxhbm93YW5pYSBzdWtjZXNqaS4gRnVuZGFjamEgUm9kemlubmEgcG96
d2FsYSBvZGR6aWVsacSHIGFrdHl3YSBvZCByeXp5ayBiaXpuZXNvd3ljaCwgcHJhd255Y2ggaSBw
b2RhdGtvd3ljaCwgYSBqZWRub2N6ZcWbbmllIHphY2hvd2HEhyBrb250cm9sxJkgbmFkIHN3b2lt
IG1hasSFdGtpZW0gaSB6YWRiYcSHIG8gamVnbyB0cndhxYJvxZvEhyBkbGEga29sZWpueWNoIHBv
a29sZcWELgoKQ28gaXN0b3RuZSwgcG8gdXDFgnl3aWUgMTAgbGF0IG9kIHduaWVzaWVuaWEgYWt0
eXfDs3cgZG8gZnVuZGFjamksIHJvc3pjemVuaWEgbyB6YWNob3dlayBwcnplc3RhasSFIG9ib3dp
xIV6eXdhxIcuIFVzdGF3b2Rhd2NhIHByemV3aWR6aWHFgiByw7N3bmllxbwgbGljem5lIHp3b2xu
aWVuaWEgcG9kYXRrb3dlIG9iZWptdWrEhWNlIG0uaW4uIGRvY2hvZHkgeiBkemlhxYJhbG5vxZtj
aSBnb3Nwb2RhcmN6ZWogY3p5IHd5bmFqZW0gbmllcnVjaG9tb8WbY2kuCgpCxJlkxJkgd2R6acSZ
Y3pueSB6YSBpbmZvcm1hY2rEmSwgY3p5IGNoY2llbGlieSBQYcWEc3R3byBwb3puYcSHIG1vxbxs
aXdvxZvEhyBzdHdvcnplbmlhIEZ1bmRhY2ppIFJvZHppbm5laj8KCgpQb3pkcmF3aWFtCk1pa2/F
gmFqIFJhawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
