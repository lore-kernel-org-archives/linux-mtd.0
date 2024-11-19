Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2903DD6204A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Nov 2024 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5F4Tnvtg0AGYawaMLh460R6UZtN64a8nLMlAJF+PISc=; b=r+jPEiMdYMX7nU
	nBffxi4lyXc7id2aq4SgxARRxbpeQuaACaibke78wNDbyRJTQes/j3Dhq4j1s61d1+1FZJ79xS2qm
	1DLSCXMkptmK9vgUiYiWElbf768eQj6zFpxPnnHp7cAq5a41wAqa9HU2vkHWsJdqhUa8WJRMI2NCY
	LraI51H5CzBbC68MMrRUcSBt6SsEztFWFrYD+h6r9PdCC9c8s4WoAYQq474NVAZOpU2f6ZiSSy+ua
	y/ch9Zb2B6z06JpUA1jGPmSlabh+86JRaLPgP266hHy6E4MC3uZPwgGDO7ZhD2IpXrnNXckHMDNBJ
	QHfYQOk5Sy96qLMzYBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKGy-0000000Bqky-2IlC;
	Tue, 19 Nov 2024 09:11:48 +0000
Received: from mail.growthlink.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKGv-0000000Bqjl-17xf
	for linux-mtd@lists.infradead.org;
	Tue, 19 Nov 2024 09:11:47 +0000
Received: by mail.growthlink.pl (Postfix, from userid 1002)
	id BC51424D58; Tue, 19 Nov 2024 10:11:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growthlink.pl;
	s=mail; t=1732007499;
	bh=VEr2F169qzT63oiVS+CcillqGjWK7lC/CzjunkH1skc=;
	h=Date:From:To:Subject:From;
	b=DFKc2dKIlxzdCm8VTuW44QRWKIjLVM5qfJaY5E6SyaZBRmyqqMi5gVcUr4t919aYU
	 UnuTd3NY/OQgNtmtgEhFMnaIoESmjtA6pE7ZcESN9yyYgGPqcvREGwOLc7qZTf4LVq
	 oICI+pLwMos4nAvc2rMHZnr+RcCc3/f/MJR//95SWYptH8FaORaNOaV+gTlmTsXauJ
	 FnaftMPgPBM4xViFu6rUi1/WPqpvlQrIuX0e6sQhVwK9jlqT1m+VaQUzic3doMPzkX
	 w49VpvbYrOY0ftYQExMDfmtMHSgVkQebBBqj9U3WcKKnJudcNeV8LbOBk96otT7U+u
	 UvCy28rOefIKw==
Received: by mail.growthlink.pl for <linux-mtd@lists.infradead.org>; Tue, 19 Nov 2024 09:11:09 GMT
Message-ID: <20241119084500-0.1.ey.whzn.0.h320bkp4lq@growthlink.pl>
Date: Tue, 19 Nov 2024 09:11:09 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@growthlink.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Termin_p=C5=82atno=C5=9Bci_?=
X-Mailer: mail.growthlink.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_011146_000102_205D2F92 
X-CRM114-Status: UNSURE (   2.66  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIHBvZGrEmWNpZSBkb2RhdGtv
d3ljaCDFm3JvZGvDs3cgZmluYW5zdWrEhWN5Y2ggZHppYcWCYWxub8WbxIc/IAoKSmFrbyBmaXJt
YSBzcGVjamFsaXp1asSFY2Egc2nEmSB3IGRvcGFzb3dhbml1IHJvendpxIV6YcWEIGZha3Rvcmlu
Z293eWNoIGRsYSBwcnplZHNpxJliaW9yY8OzdywgY2hjaWHFgmJ5bSB3c2themHEhyBQYcWEc3R3
dSByb3p3acSFemFuaWUsIGt0w7NyZSBza3V0ZWN6bmllIHBvcHJhd2kgcMWCeW5ub8WbxIcgZmlu
YW5zb3fEhSBwcnp5IG1pbmltYWxueWNoIGZvcm1hbG5vxZtjaWFjaC4gCgpGYWt0b3JpbmcgcHJ6
eXNwaWVzemEgb2JpZWcgcGllbmnEhWR6YSwgdyB6d2nEhXprdSB6IHR5bSBuaWUgbXVzesSFIGp1
xbwgUGHFhHN0d28gb2N6ZWtpd2HEhyB6YXDFgmF0eSB6YSBmYWt0dXLEmSwgcG9uaWV3YcW8IG15
IHByemVsZWplbXkgxZtyb2RraSBuYSBrb250byBqdcW8IG5hc3TEmXBuZWdvIGRuaWEgcG8gamVq
IHd5c3Rhd2llbml1LiAKCk1vxbxlbXkgdW3Ds3dpxIcgc2nEmSBuYSB3c3TEmXBuYSBrb25zdWx0
YWNqxJkgIGkgd3Nww7NsbmllIHpuYWxlxbrEhyBrb3J6eXN0bmUgZGxhIFBhxYRzdHdhIHJvendp
xIV6YW5pZS4gSW50ZXJlc3VqZSBQYcWEc3R3YSBtb2phIHByb3BvenljamE/CgoKUG96ZHJhd2lh
bQpTemN6ZXBhbiBBbmRyeXN6Y3p1awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
