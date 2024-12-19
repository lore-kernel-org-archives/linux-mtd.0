Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C599E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=AWKD+c9sszjcZ+
	bF+ip9Ia20IpCtW+mJM5TVlcTbh260O1+BZuuQ5lpFneYV3LVqYotHkG4nOeLX3lJUabb0UbV/eb+
	Djrd0bLaFzJt6HkE91BFOev2qnKinwXWPpSe4r7WaY8o/0VfwcPD/m6xfQVvjolCqXWKvNkuTJlag
	vq5VxLdjz9xmpzhk6yoX60W7kTbnyESXJVQXhJFw0s4YuHsJzlaI+dRsbuWdFWJ6mwv88VhHhSVi1
	RVPAyzv4y6fEuD0msobdnAcI+hDKZfMxJ0RGErwwgQr6+5jxqumX9/FDxvRiHQ7M7d277v7lu76rP
	rL6Pgn6GbgOMtzZWouZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCBn-00000001K9Q-0Y67;
	Thu, 19 Dec 2024 08:47:23 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCBk-00000001K7z-07v0
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 08:47:22 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 6197C251B1; Thu, 19 Dec 2024 09:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1734598034;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=O4p2leDB7PWGPBK9VmxG0RaA+ano8+92co3mf1fvBHFAhgSaUrcPOvZkw8swCflgX
	 E6DC5Nbp95OEvScVUi4In0lytNxv2j3bL7ofH4YIYIKeMOyELrypLVm0mx/sjSJSUd
	 MEWlne4DSbugNJ3TsFRj13Aa0RfPzkv+IT0owGeXFSjd41XbTDPf1mkzjq1/NmhLo9
	 gv/Gf2SeTRUPjSia3oPO/eOJqAFf6IAfFRPw3eYIRfMyxYzrWnMWagZ67iLmLIdGni
	 ss7VOX/dEAAPI3rEg7ZTG9PYSv/6oeqDl3Kwjk5oS2S0GGRj2MuwjWJAEzfwD+wgfh
	 eI1iBv2uxkcOQ==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2024 08:46:10 GMT
Message-ID: <20241219084500-0.1.fg.218i7.0.0f4lqmy64k@completesolutions.pl>
Date: Thu, 19 Dec 2024 08:46:10 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_004720_750040_37F89772 
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
