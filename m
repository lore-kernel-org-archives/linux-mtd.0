Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3B6C3DA61
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jul 2024 08:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=ep2lc3T7WYLTyN
	7psD2LFxXz9cvQIIpuVMiYj7miK60cMwYZSnjLFWM8LI8kWR84RdKIRB347rhq3vfc+miv5yu7z3V
	Ym7E1Te7cX7xSpppip0Rtxmq2tPymezbW+VODwSIu8nqTZx0eb954L2kEjMvCGc/h2eUHqZ9OrBf1
	rgQtSI/p+SEvbm4v4NiH5T8ZGimzrcf44p0zJRcd5kAAA4h08C+fo+6fnkH3DMynqXR56V5EUa0Ln
	KfLGzxg8HOgaqOK9fJPWlKMlFuQreU2iP76epLlpKcaW33B85cpjd7ggVmj4XOlfX8plD1wETIGzF
	UopguIwHJqEW4B4qsdHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWX23-0000000EiuI-261N;
	Wed, 24 Jul 2024 08:07:31 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWX20-0000000EirC-16EJ
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jul 2024 08:07:30 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id C6DB925127; Wed, 24 Jul 2024 10:05:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1721808403;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=H/dellGzFDDG1YhPiJuRM+uvl5d+miFYnWukTLIxcHaWyQ35X3OX/dYqGgEgUBn0o
	 kbi0XRee8lZwALDLg5/1/9TEJljCHugh1j3oDJ2yEE8gjVIkXJxpTFg2D16+v/st+V
	 qh9NkMw+dp9Z5f5hWfJjXpLOf+E58ShSiRhSQUHsNyqgMt2HgMF5saBog/5kVHYLER
	 61AZPDeNKhMtBN9gMisILXnzG2ToEFE8R2VOb3HijeNa62PuVp7gPMVVR8kvuw3FQL
	 WK3D/akWyYnUxaPDc7uFuFShpIdslU1OUrAwufga184FU3Aq+GntMu4KsDvlidHEtK
	 cRwasL0nIrkXw==
Received: by mail.explorepulse.pl for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2024 08:05:26 GMT
Message-ID: <20240724084500-0.1.ck.xgg2.0.a3v4fcs4jw@explorepulse.pl>
Date: Wed, 24 Jul 2024 08:05:26 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_010729_032917_A11E055F 
X-CRM114-Status: UNSURE (   1.32  )
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
