Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C2CC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 08:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iu6eIEb3MZdm4e2caA/WBdsJeI0de6QD8c0z20CkwR0=; b=iij3dwBqq1YVxi
	DwPE3qHEtYeDVKydDjaleq9z8Mhfzxd96FdXeFFuW17ASt+2dD6831wezo951vLYDMQQs7VqJMJd5
	eJbCIpoLazvJe3J4ZhfdeJkDQpuDp4YAFMg/DeczhkvxoxErFuP0hNTcJJnXwaq5pKCrrMUx9/OzU
	UK2KZYK5B8MVjnHLhzm8NwbpJ8bmgOn7BTUyqzRtW1WTudT91gkmgn9xUnCG0458irmszaMiX7XZt
	fid/SetZOuxr9zXj0IcjnXd1Y06hs9PoV/hIRVO9u4mg+VVHDOZnRaawFAz2T0Mho+AoHr1WWxuXA
	ULX23Taro+z/64HTR7Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Nzt-00D9R3-Fy; Wed, 15 Jun 2022 08:03:29 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Nzp-00D9Pf-KW
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 08:03:26 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id 2BB86265FD; Wed, 15 Jun 2022 10:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1655280101; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=YXZdfqm+Z+23SEjx+Rv+hJQCSsyyveyc952NJ2MFoijezxFkT75Hy1eiE+ewseruc
	 XKYeMLy9BukWuFcs8JUwjmCsadwJTrkHvsglM4FFR4jESYMO5nFMrrLjkCIMs161cR
	 w52l6YyWuTbzzthq7T3a7LYJZk/lDblImyGKTF5ahZDJxCnkwLNPqmVuGHjuGRUTMu
	 T7TIUKP1kg5TzNfv4FjzsJVLqPuef+3sN0uc2ZwraRcG7AxSzGNGuK5uwvzL6D+KDU
	 CAGzDIfAuCaUDt0GJ4DpeueZ/83s3RiBNLkLyzWTznJ2uBCiNOPfiy21KrePyvW9sx
	 bby+42Sc0Mhzw==
Received: by mail.olerise.pl for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2022 08:00:27 GMT
Message-ID: <20220615084500-0.1.f.82vv.0.kr5rmg6hyt@olerise.pl>
Date: Wed, 15 Jun 2022 08:00:27 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_010325_844318_092DCAE7 
X-CRM114-Status: UNSURE (   1.33  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
