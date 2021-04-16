Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4899CC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 08:09:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AA8F6113D
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 08:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AA8F6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mailfence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Cc:To:From:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oODq+lslswI5zuPWklcC09WRqeGW/uSil/H4eCGAtNA=; b=dDDNGVTjy9g5QM2/LRh+PVafX
	8qpI2I95HTO0byEu7dr/L6NXlMIJEUVCQ4DVHi5BVBZt3l9TFwq1v2F4pBpdnx4ntxxZoPuUSF/kH
	rfpDG3jZ+2uVu2vYUhdwRBBYCZJK7dYJAIbH4A89TGD8/ldG6y++8IXS+8rbxXqb1CICZychEi9Nv
	TLi1dwSxbDkP5pONbKxbYvFENReXOWwNH3cIssocC13KNMYyDQVm8NTvn5KZ4Gf0iSXcyCZTt/fC0
	D9tfECNdXU5f/GPLD3uxssYErusLJjvw+NfuDSmOO/Gz+cEd77I5whdr45ysMSoTQvrOVwDRoCJFn
	cgvudTryg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJUk-001HYD-9V; Fri, 16 Apr 2021 08:06:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXJAb-001EFZ-8w
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 07:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
 Reply-To:From:Date:Sender:Content-ID:Content-Description;
 bh=7+WOuV+UT2MTORBsH4jugcAr9RiJXmv4urT4Fg3sUhw=; b=Bf+EAfGh5d9DzX8mQ9N5bGMyna
 LqoUvKI9lFWQrTfHnpg98G7hObAbz5WKoG2ZzWegXhoYfxw+ktP9waAbUeFsAsSnTTwk64ltl+TFO
 fHTZc2fMu/L9/U64rmo7vNGUXsR1qe5TPopw8sX3D1YWX3rJ1n4uSSf9frIxyQweRKXwO8yn54WTd
 gKEkzSYi5cyosjPUPJbBLvjAlh/dbcGPKtaeIHxvWlFKLNyIHeT9G2VW3vUZ5jUZ4XJ7cjpxvrVGY
 oVgk1x61cPENEKXt77VdTr4Cl6L6u98hLiNyMthCL0/M+HEO5oEpbRsWWEeOw64NnS41ZMosnXMki
 Il1OoyaQ==;
Received: from wilbur.contactoffice.com ([212.3.242.68])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXJAX-009A6g-La
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 07:45:39 +0000
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
 by wilbur.contactoffice.com (Postfix) with ESMTP id 2191798A;
 Fri, 16 Apr 2021 09:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1618559130; 
 s=20210208-e7xh; d=mailfence.com; i=sandberg@mailfence.com;
 h=Date:From:Reply-To:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 l=315; bh=7+WOuV+UT2MTORBsH4jugcAr9RiJXmv4urT4Fg3sUhw=;
 b=xY16+Mz4DILoutMZol5/MDPnsJrzb7Ar/vu9ZLd1r7+QI+nEAs6gD7Gt44pEggfs
 GgI1ojikMp8tiK0L5EIjEslm2phNTmpn0CplpZHSUsWVV/vT57zS5R2bdRkqlh8NGDj
 QwUa69Gx+YnazD2R+qb5+ElJVpoH6mKZDwLOtOKhMPEuudqlLJlCZj7GpPbo6MvGxg/
 4w555G9f0OrAalb7HAEBgA7IoZ4H+TsEnTf+vYfi3jnAM8CqKJI4dStpSVPpn3jlHZw
 MUKold3oM56Y0kdvLEX7nqXBDMO3pL7A/gdh/fJ//6aHj5Via1Fn091KzHfWeAnzrPl
 2JObiqBcUA==
Date: Fri, 16 Apr 2021 09:45:26 +0200 (CEST)
From: Mauri Sandberg <sandberg@mailfence.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, Vignesh Raghavendra <vigneshr@ti.com>,
 richard@nod.at
Message-ID: <1218260672.1047367.1618559126352@ichabod.co-bxl>
In-Reply-To: <161833061201.9818.14636884633616951588.b4-ty@ti.com>
References: <20210223170052.963927-1-sandberg@mailfence.com>
 <20210309174859.362060-1-sandberg@mailfence.com>
 <161833061201.9818.14636884633616951588.b4-ty@ti.com>
Subject: Re: [PATCH v2] mtd: cfi_cmdset_0002: AMD chip 0x2201 - write words
MIME-Version: 1.0
X-Priority: 3
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:250217426
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_004538_057211_62BA5655 
X-CRM114-Status: UNSURE (   1.76  )
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
Reply-To: Mauri Sandberg <sandberg@mailfence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> ----------------------------------------
> From: Vignesh Raghavendra <vigneshr@ti.com>
> Reworded the $subject to:
> 
> 	mtd: cfi_cmdset_0002: Disable buffered writes for AMD chip 0x2201
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git cfi/next, thanks!

Thanks for the review!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
