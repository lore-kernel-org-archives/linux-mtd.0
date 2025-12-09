Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA50D1CDC6
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Dec 2025 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DeZU/w4iD+quBXxltblpNHJHrUOPeWw0Vu713bzyAnI=; b=p5sK1CdW6A383e
	lMzhHmEJKBv1NURNmhcimCY5cjji7EVbhYPvpEJGjeeg2x1xWknqpVVW9H5ETnNVkAQcAXQNFJjQc
	YQtnLhnAHhCUs6D57VobutRJndFsLJL4+gB0UpfO+sGCCuCWnlpCDzEwFD6VmD3x95Znl8geX0QDP
	4c3ECqKn06FJiVXW3m+5QSNUZgR0Ypvr5KSCLq4pQKft/ay+t1rBeD5jcmNFO8HaV7HkZG4oSPFui
	WdzTtZV5yXPRuo5/abMuQklOYkFJ927bp2L8E1zTsuyByDOOlIAX/RYRJMPkoY+2ewycyjvpKaTpG
	TybJCRCR36Hp4whl0l2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStsp-0000000E2Ic-3Y3l;
	Tue, 09 Dec 2025 09:19:47 +0000
Received: from mail.nexaro24.pl ([51.75.71.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStsm-0000000E2IF-23eK
	for linux-mtd@lists.infradead.org;
	Tue, 09 Dec 2025 09:19:45 +0000
Received: by mail.nexaro24.pl (Postfix, from userid 1002)
	id 8E5CAA8390; Tue,  9 Dec 2025 10:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nexaro24.pl; s=mail;
	t=1765271884; bh=ZC5JV21fWFTo+uXJYW+dr6G1mneZxc9rdVRgBpPDkO4=;
	h=Date:From:To:Subject:From;
	b=Org0Q6uko0kxbfcjsCdhBwznj2JTqMNH6Cgz8RPzoQMV1D1Uc8sVDt+YB74dPdgRw
	 MPs2/r0UzcypsRplEoGPCb0j6uiLo4+f6RqtFElCgSFMpJUmP2IuVjwUMiihJumD0R
	 esXEKPfWH4thhFdAiPrphQ1vlnXV8OfEPmd1yFKaHePNneAQsmxiAGtqSjorSIy+Q3
	 U5ZVa1hiaYcdOBgXnSmQ3VOv6UdN8z9CWFjmfZv63nWOpUVvcLNi55QPYcPfBirewf
	 h07ovx1pGZ7JaFrIn/TAtjjaM5RL+JU3HoZVQWE3mZobnH2zKbLw85Eyt3HVDHYMAm
	 dMiFTyoKq3YFg==
Received: by mail.nexaro24.pl for <linux-mtd@lists.infradead.org>; Tue,  9 Dec 2025 09:16:08 GMT
Message-ID: <20251209084500-0.1.qk.5p0zq.0.r7p0oeu710@nexaro24.pl>
Date: Tue,  9 Dec 2025 09:16:08 GMT
From: "Tomasz Chabierski" <tomasz.chabierski@nexaro24.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Dostawa_sprz=C4=99tu?=
X-Mailer: mail.nexaro24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_011944_815409_87119BE3 
X-CRM114-Status: UNSURE (   1.97  )
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

RHppZcWEIGRvYnJ5LAoKcmVwcmV6ZW50dWrEmSBkeXN0cnlidXRvcmEgc3ByesSZdHUgZWxla3Ry
b25pY3puZWdvIGkgSVQsIG9mZXJ1asSFY2VnbyBwb25hZCA5MCAwMDAgcHJvZHVrdMOzdyBvZCAx
IDEwMCBtYXJlayB6IG1vxbxsaXdvxZtjacSFIHd5c3nFgmtpIHRlZ28gc2FtZWdvIGRuaWEuCgpX
c3BpZXJhbXkgZmlybXkgdyBkb2JvcnplIG9kcG93aWVkbmljaCByb3p3acSFemHFhCDigJMgb2Qg
YWtjZXNvcmnDs3cgcG8gbm93b2N6ZXNuZSB0ZWNobm9sb2dpZSB6d2nEmWtzemFqxIVjZSBlZmVr
dHl3bm/Fm8SHIG9wZXJhY3lqbsSFLiBaYXBld25pYW15IHBlxYJuZSB3c3BhcmNpZSBla3NwZXJ0
w7N3IG9yYXogbW/FvGxpd2/Fm8SHIHByemV0ZXN0b3dhbmlhIHByb2R1a3TDs3cgcHJ6ZWQgd2nE
mWtzenltIHphbcOzd2llbmllbS4KCkNoxJl0bmllIHBvcm96bWF3aWFtIG8gdHltLCBqYWsgbW/F
vGVteSB3c3BpZXJhxIcgUGHFhHN0d2EgY2VsZSBiaXpuZXNvd2UuIAoKS2llZHkgbW9nbGliecWb
bXkgdW3Ds3dpxIcgc2nEmSBuYSByb3ptb3fEmT8KCgpQb3pkcmF3aWFtClRvbWFzeiBDaGFiaWVy
c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
