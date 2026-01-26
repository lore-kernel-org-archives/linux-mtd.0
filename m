Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B2C88E7C
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jan 2026 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DeZU/w4iD+quBXxltblpNHJHrUOPeWw0Vu713bzyAnI=; b=XL/lSxEQWwvUNV
	x6vGuIxnJenDhrpWDFlGV8c4n3CLGC/rmn95mHs9gBYcZAe3CEJhvUkD93ovZ4PHKvnL6NbDRsdr+
	5gfaQlt4nEJbSbvws3zQoEf9iUFdnt/gaaNZhL9qX+dLP0h+3xlkxS3OEEICqiCNnUYZrbbzjiSgL
	SE6kW/ujyoSBLcZj1x2AkV3WMxZQL+DASrc1Nspu2Q5cpMoLKbAFYk7s8W9hqMjlgCR5uerry7tgg
	mceM0wg+wa2y0qlWtLNhPfA9Vcn5Yu5Esn0hhoEWnMzBKJli0wzMpMNy2H0huuygG7j7pI4q2lw13
	RhRXiBECw9H/jWN2qZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIf6-0000000CA60-1JNR;
	Mon, 26 Jan 2026 09:13:32 +0000
Received: from mail.nexaro24.pl ([51.75.71.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIf1-0000000CA2n-1nlE
	for linux-mtd@lists.infradead.org;
	Mon, 26 Jan 2026 09:13:29 +0000
Received: by mail.nexaro24.pl (Postfix, from userid 1002)
	id 0B758A38BB; Mon, 26 Jan 2026 10:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nexaro24.pl; s=mail;
	t=1769418766; bh=ZC5JV21fWFTo+uXJYW+dr6G1mneZxc9rdVRgBpPDkO4=;
	h=Date:From:To:Subject:From;
	b=C4eNr/i8vQQPEwZdQEiRsbI6zQu9tIfMornGU/Audg0IOG5dzLxjIV8/Z0vdj6O/P
	 DLj3cNh5nz4rdxQyK0OyZuESMAgLjj/8u3MXwn0RYqmgL/5VqZ34vqLjmTiiBXDjBx
	 BsVFmfvcuoDcXkrUMsbq05h+hWtteLg7wd9mUmlaOifTQozW1l603evTOMxDkqwG1M
	 eYEOkVf+dSdE/+aA4vw3zLe9wyC2MnYL4kR05K6OZ50eRGq9q/MP9vEDhOyRLxnxCD
	 w/9tNGR3gOErN/pC2ZUDNAIpjuBPWiEYqKACpeN3XUi/UNWpliJUgKbvgb7EEF7pGK
	 /+VGvGozJ5srg==
Received: by mail.nexaro24.pl for <linux-mtd@lists.infradead.org>; Mon, 26 Jan 2026 09:11:53 GMT
Message-ID: <20260126093833-0.1.r7.5zo58.0.of4e2qr4eo@nexaro24.pl>
Date: Mon, 26 Jan 2026 09:11:53 GMT
From: "Tomasz Chabierski" <tomasz.chabierski@nexaro24.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Dostawa_sprz=C4=99tu?=
X-Mailer: mail.nexaro24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_011327_996874_AC3BAF2C 
X-CRM114-Status: UNSURE (   2.73  )
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
