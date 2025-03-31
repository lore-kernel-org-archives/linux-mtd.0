Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D28C3600C
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Mar 2025 08:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=yhPVmxokGS2bb3
	tjdDMC8Wd6fccWwggHCYDkfOCNYWjhpRH4NMwXzOo1/Cx9n/FQgTbRRha0RlSXlQB2RfRZwZc/pcT
	vemJXfOpzo/IYsd+F9s3jOWQIcCv+ptHDmL/wZRkD0s2fq2bxm6mxPAWyC52eTOup98BvhsskiHDO
	WXMzQWqM1R5eEs9dJyF8AqKk5Cyk7jkhtgHHK/rZl54tu9Vg15cK9LhKhfZZGzmuwTCVCp7z0qTWd
	u+Jd4OaWjRXEJm98JkYVAgS1BNJ533ukY78qzkYM2dgHvmrrG+hapvdHT17/mLNbEMemhWKteimad
	/kUqMQyO/OVluOg71Hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA9X-0000000HIPt-2o1M;
	Mon, 31 Mar 2025 08:05:51 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzA6p-0000000HHup-34e5
	for linux-mtd@lists.infradead.org;
	Mon, 31 Mar 2025 08:03:04 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id 06EEB251CE; Mon, 31 Mar 2025 09:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1743407779;
	bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=evqw/NZO2X53VR6DXzkR4grnBLUKUQhhMxwhuiow81Req/qlmnbxOL+dzd+6Er/zd
	 NPdanT1f4iH1NeYwilu5NDMdDn2qFzT3GqvTD+VUSz4HFKUHN1zifk5dAEhRFVzWC5
	 vj7ko3WuLNTL675k+fqNC4iAGnwKvpBfjEl8mR/5vq3UX1byvu1XmgI+45QS63jymO
	 ZKjKvcvTcCMwt1DWgoSOHKXZDEF3Sv7BTZbv9AD2Nu9YiluyFn0JtnVBIoOM62ZZOC
	 hFaVkiich1MCBLRCnjfZy/9F+o7Sv8pwg0exlDYO1tn3IdEk9IwhVngWFd3u0fMmN6
	 HP0GJGENgToZA==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2025 07:55:53 GMT
Message-ID: <20250331084500-0.1.hc.2tpk7.0.lzdnq7t2id@completesolutions.pl>
Date: Mon, 31 Mar 2025 07:55:53 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_010303_905343_7198D651 
X-CRM114-Status: UNSURE (   1.26  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
