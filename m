Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50A7CCA464
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 18:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8qc8nOqL8LcFGwbt+aslxPKKKPO6Nw8XV2r1Sr6i2o=; b=hkskgEVB1u1OY2
	lgsyswIAKUVBxsrLc7vuqA1E/DV5RTgNElnTOexSHttGZU4T2EFlrt7XSgLa07OxJ5qkxTjJXinLn
	FiGpj6q4UyZvl2uXMGFv2kb5bK/LFf9KGP+M6L081xeDi34UoeEfB8SSlr1YeNynI6+OkMM3k7Sto
	0Kppqv02xLYdkySbKMu+/SlmfY8BwSTwRUkWIIo/WPhi8N2qshfytfg9VmMASTCvFWBkkqk7TPVbi
	s4eT115uuMuuqxqKwhSvBak6HJVTpFC5mEJDBzIN7SuQc1/cv82H4cxj3tZQBa9nptBa4AowWpKcQ
	EQZPpQMUHmQNXZigO2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQMT-00000001BZn-2Nak;
	Thu, 15 Oct 2026 18:39:29 +0000
Received: from mx01.bremer-it.com ([85.215.132.167])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQMQ-00000001BZ6-2O0Z
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 18:39:27 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id CB961200FB;
	Thu, 15 Oct 2026 20:39:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1792089563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMh6llIyZaU6gvbFXWPakzH4w8foKwyN30kmvQqNpoE=;
	b=XMCYAa9CjIlcTczVfRSEK5t4dEdUGefNq783V0QWKU+s0cFZD3yKMo9ci+8safo0f6XcOG
	vBeX5bsLyOS71SXaWquLI/GeaKYsbwAKZPCJA4XKFJESuSOtrGGnujySzlZX4FxKX1yrhJ
	hpwpGnDcIp27WmNaQGue8xtn1UolJjv4eBGBimwAcdRYhbnkz4Fyi+OvDZPc+f0T+BhTab
	Rb/zgcXVxNPnG6DCm1YIIKtezEN42jYA8Gu5P956M6n+Uz80/wjRwsYWzvnuAhiz9hA7oa
	1ZjQBbycLOsc+gEtHTl+/IbY9C0T0mW6m254+CZyLo6qmUvu7S04cAeJ/9uD5Q==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Thu, 15 Oct 2026 11:39:18 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mtd: block2mtd: convert to folios
Message-ID: <atEd1rbZ_TCXpqXd@cashel.logfs.org>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 14.00];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.00)[10.10%];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[barelysecure.org:from_mime,barelysecure.org:from_smtp];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	LOCAL_OUTBOUND(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: CB961200FB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_113926_750959_DD96BAE3 
X-CRM114-Status: GOOD (  10.84  )
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

On Wed, Oct 14, 2026 at 11:34:53PM -0400, Tal Zussman wrote:
> =

> The numbers below are from mtd_speedtest, in MiB/s, by folio size,
> except the last row, which is from the MEMERASE ioctl:
> =

> +------------------------------+-------+--------+---------+---------+
> | Test                         | Folio |   Base | Patched |  Change |
> +------------------------------+-------+--------+---------+---------+
> | Eraseblock read (128 KiB)    |   4K  |  12545 |   12863 |   +2.5% |
> |                              |  16K  |  12998 |   17229 |  +32.6% |
> |                              |  64K  |  13009 |   19135 |  +47.1% |
> +------------------------------+-------+--------+---------+---------+

Thank you!  Code size goes down, code seems subjectively easier to read
and performance goes up.  Good stuff!

The one pet complaint I have is that benchmarks should measure badness,
not goodness.  Humans tend to prioritize the big numbers.  If you
measure the bad thing (time in this case), they focus on the worst areas
where most time is spent.  If you measure the good thing, they tend to
improve things that are already too good to worry about even further.

Maybe you are immune to such psychological effects, but I am not and
measuring time instead of throughput makes a difference to my mind.

J=F6rn

--
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
