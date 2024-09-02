Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBD2CA0ED3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2024 09:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ItUOAe6QfSCcpiQeUMxyB/egqmzH1iRiOVFP0ulVYYM=; b=ek0GT0NNH1YGlx
	fgO0/pJ7oAnQZwSG71GuorMeNChVtmLNPKiyFjblk2hj1LtUyDG9jmibmZNTk5xWh3zh9TjwJQVLo
	u5nzcAhEASKpXR1bLV5BwAACNy7KfqgVwTbK/WurBNWIt3Mfg62y4OVjnVoxnVphY1Ma9FhRE8noz
	o/TtWFczbMtowxU7QM3CMwrU5g99D6YQjJeWcF8a7eopklRKGj73kBifwBme6Tfnkbh0MxhiGuDXg
	O++0WLRu64fHxeTIPiYDTOZiCiSgfraKq87TGESyErTCe5BYWBGNzdDoJwAveHgd+1ULbNffZpFt4
	nVKOPKkUKDnIdMEAKlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl39d-0000000DexC-3pTv;
	Mon, 02 Sep 2024 09:15:21 +0000
Received: from mail.firmcentra.pl ([217.61.97.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl39Y-0000000DetZ-1hPQ
	for linux-mtd@lists.infradead.org;
	Mon, 02 Sep 2024 09:15:19 +0000
Received: by mail.firmcentra.pl (Postfix, from userid 1002)
	id 870F1829E6; Mon,  2 Sep 2024 11:14:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firmcentra.pl;
	s=mail; t=1725268500;
	bh=5s+RFFpEXY8XSxKCZzZ5oYRLo+owGFytidXbHzsnZPg=;
	h=Date:From:To:Subject:From;
	b=g+JFSKMc13KLyLfdkBiP4+EuPWmF72Avdzv0TFaSOWCk6NqRIkAtC+QDXCdfN4NIx
	 BsfBFaLFvRlIHJb/Oip6fCxGcziLvMdUcA1PPfJpTAkZsMUwVR/dp7VIy8DeDpWI5f
	 tNa46e0Ek+NGR1XTwfCPTp7injF0SIE4lI3UZVpaKYaTqZ83pcXdWwLOtLWKizXiRy
	 Edf6JZbnMCIpu/BxMm3SGUYagi/aT7ZlE8fjLjlKGosm6QKOYol8+xdCotYShT+tjH
	 cAMbTUUhikWOQKbpx0NeDtRyKTVfB4yJmBZfMchSLn5L61zKB8qYnNjep1AgLUO+s6
	 i9CmIMrScVHjw==
Received: by mail.firmcentra.pl for <linux-mtd@lists.infradead.org>; Mon,  2 Sep 2024 09:14:47 GMT
Message-ID: <20240902101625-0.1.22.ae4k.0.l00ja21lln@firmcentra.pl>
Date: Mon,  2 Sep 2024 09:14:47 GMT
From: "Ewa Szymkiewicz" <ewa.szymkiewicz@firmcentra.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Udzia=C5=82_w_post=C4=99powaniu?=
X-Mailer: mail.firmcentra.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_021517_144948_0EF6405B 
X-CRM114-Status: UNSURE (   2.15  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IG9kbm90b3d1asSFIFBhxYRzdHdvIHphbGVnxYJlIHDFgmF0bm/F
m2NpIG9kIEtsaWVudMOzdz8KClBvbWFnYW15IHdzenlzdGtpbSBwcnplZHNpxJliaW9yY29tLCBr
dMOzcnp5IHN6dWthasSFIGd3YXJhbmNqaSBiZXpwaWVjemXFhHN0d2EgaSBwxYJ5bm5vxZtjaSBm
aW5hbnNvd2VqLgoKQsSZZMSZIHdkemnEmWN6bmEgemEgaW5mb3JtYWNqxJkgY3p5IHPEhSBQYcWE
c3R3byB6YWludGVyZXNvd2FuaSBvZHp5c2thbmllbSBzd29pY2ggbmFsZcW8bm/Fm2NpLgoKClBv
emRyYXdpYW0KRXdhIFN6eW1raWV3aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
