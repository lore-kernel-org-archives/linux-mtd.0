Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5453CC6B38
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ol1Qb9ycD/IgfY3MnAtrx10sSHEbO/WvQGsKiZhbw0M=; b=GuwYrDiBDy14nS
	M6ZHPtbALzIfHVPaby2RZKKUSylTANuXNTRyyQf8x9RnrHHBZ6qzp3VKRlEjiUA3jQePsHG9aO8Rl
	Z+1IDLE3G6SUH5HWeiw7ZxhLsR+6jDV8mmzu3yed2ocZWJ8d+Z4O4ub+84xn35ZYGw2oV6hqRHRbi
	/BBajx27xFzVn9cBTNXbYc9oZ7TzQ3/3YtNJnDoxXmbCO0Boi5Q/nZQZY+WFbO4MwQkL41UfWFLQG
	9ZfVYl5k0ykQmzduFYrMjuOIqcWbVajFxzYoIiZ/gyQLDOdHZRgyNUehgjlfyXwjNSt3BuHbYkqZP
	eJ/OBQphY7ETwJO1E9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQIM-00000001Aw0-3n54;
	Thu, 15 Oct 2026 18:35:14 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQID-00000001Arn-38Yc
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 18:35:11 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 99B6E200D2;
	Thu, 15 Oct 2026 20:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1792089290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWzJkDI/em5y6nh6j86gUEA89QfFvvGbbcLOG6nyaLU=;
	b=Da3adV0gloTJ32d9fYhXySL1K2qui+tJSJj6r8EFpqIPqrd2HX3+CYCrKAfEeiUf9Flrql
	OIZN484H6pocKqU1Rr4ezT3eyWPCJD5mVwNj/+df4rvSShfeh/al/uBn0rE64rcn39em8R
	AXCDpHKZG2yvjRKtyL1pVV1SyZnCvJzt5RcYYJp3DhrqEuOGz2MP5Ivd+j0keB3KU7a65F
	C1KeOcEjRABMxb1dn45KyzoWBvGPZU9stcBMro/ifFjxu9RGbMQRgTm7vQkX7wT7RcDdKM
	qCCtYEAPbs7TLiM5JyZ5GX6JWh/nWV0TpAIGIGRNN2ON1IdvsLMLPsmqWAoJBg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Thu, 15 Oct 2026 11:34:44 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org,
	Joern Engel <joern@lazybastard.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	sashiko-reviews@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
Message-ID: <atEcxC2Hp7idmr04@cashel.logfs.org>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
 <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
 <sashiko-outbox-172225@kernel.org>
 <87mrsfwck3.fsf@bootlin.com>
 <5ec61284-3ae9-4875-bba3-932cbede14b4@columbia.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ec61284-3ae9-4875-bba3-932cbede14b4@columbia.edu>
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 14.00];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[20.70%];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	LOCAL_OUTBOUND(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 99B6E200D2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_113506_230643_AA57830B 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 15, 2026 at 11:19:23AM -0400, Tal Zussman wrote:
> =

> It seems like it's a real but very rare pre-existing issue.

You should drop the "but very rare" bit. ;)

When it comes to bugs, being rare and hard to hit doesn't improve
things, it makes them worse.  Rare bugs result in crazy bug reports that
you cannot reproduce.  Instead of spending a few hours on them, they can
cost you days, weeks or months.

They are also often non-trivial to fix.  Instead of taking a bug report
and saying "ah, here is the problem", several times I've had to come up
with new debug code, make it robust enough to ship into production
(because rare bugs only reproduce at scale, which means on production
systems), refine it once or twice and then finally get enough
information to fix the bug.

On the plus side, such debug infrastructure tends to provide enough
clues to fix many bugs, not just one troublemaker.

J=F6rn

--
The cost of changing business rules is much more expensive for software
than for a secretaty.
-- unknown

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
