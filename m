Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A6CCF6C1B
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jan 2026 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DeZU/w4iD+quBXxltblpNHJHrUOPeWw0Vu713bzyAnI=; b=RY6wiNuwDu7h+s
	6nYMTk8ql9m1G5qQPBSzdiKRqP4jxMv0AdQr4+dvrQeUqP5144jWbJxA+5tuVLlFKaQ5cc6jcLv/z
	YLNogrKdF65QEB9Jy3fmVgCXFfd0Z4r3VTX/vktlfHbsCv+fOjDMQAbgc9fJ5VMs/K+Eem3uDnmwo
	O5sSQLszT34K19eUAPj4FFdo/rrL3VMBXBHnY7SK1OdbBmi7kgavfNMhC2gStuDA/TtkH7Uew7qK1
	J2Uw7ru56BVFEJmpnlS5kNEqyxMAmOibpJl0fsfsv2EW83dYta09ewWpdJJQkj+R6K+SJgldLAmuS
	PoXkMl8SdpWrVo9yPraA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPhI-0000000EVd5-4B8r;
	Wed, 07 Jan 2026 09:19:20 +0000
Received: from mail.nexaro24.pl ([51.75.71.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPhE-0000000EVcP-2Riq
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jan 2026 09:19:18 +0000
Received: by mail.nexaro24.pl (Postfix, from userid 1002)
	id 1D419A5283; Wed,  7 Jan 2026 10:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nexaro24.pl; s=mail;
	t=1767777493; bh=ZC5JV21fWFTo+uXJYW+dr6G1mneZxc9rdVRgBpPDkO4=;
	h=Date:From:To:Subject:From;
	b=HXzmdHuJxpSOUZN0H06zFrE1JdF6nAGciOjIYvtP8YOL9+eLHRohNRNSOae1abe4J
	 QAgg49CWztelx+jB6yXMorMn/zjLETjOehsNtoi+uEcXH1d0jVU6r2j/MB7VdW03o0
	 2mdgBupCuExkUSDGyfPptaSlhCE2Wc5png14Sgawayp6h889dcCYTFq2rDq8x9Sp9u
	 uXLhWfc28AAgGZjsHmFJhNVsf2W47BR93b/+hkn0+GHMwG+nZHxa23jT6nCrfvFUta
	 bv+hkPxweI+5wn2Cl7d7F8YPsUL9JpIfnFWhKp4y0PvAGq9A61M/fW124w9U5fjE4J
	 48yK908nOdBeg==
Received: by mail.nexaro24.pl for <linux-mtd@lists.infradead.org>; Wed,  7 Jan 2026 09:16:17 GMT
Message-ID: <20260107083400-0.1.r0.5wit1.0.d71ag9bdc3@nexaro24.pl>
Date: Wed,  7 Jan 2026 09:16:17 GMT
From: "Tomasz Chabierski" <tomasz.chabierski@nexaro24.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Dostawa_sprz=C4=99tu?=
X-Mailer: mail.nexaro24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_011917_088294_7773E43C 
X-CRM114-Status: UNSURE (   2.26  )
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
