Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C800C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RA6gB+HjPUknUP+6Dk0PenSUN3ov9eZ0kr5+JPRirYs=; b=Ua3x9n2CvVZ+TH
	HqLtnOQ0Ph26HGPZdVX7D5gfyuLdG4rZjWKAAVYIdx+D/LotzEDPR+Kjg/655PcERiio3OAlrOtCd
	uG8C5qFDEk5speagQ0kxdzo2tPYxIZR8V+Q3hXQm//v2DvOMWKj3nO+rJYLZafyCrY7ndVgIG1vNQ
	fWIffT5kZrrodVYfzfjqrhEfYKX3lJxhUdN2Am5esfcUXVI4RZshA/3LUUZUHv3nnHBMZUS+4ME59
	25NTyZrRwJesF/fZAPCH6NhaJn+O+g0doD+bbvgIlngnGYgjwhx9XjSFEisS62VPqBWBMc8505lGB
	YTRyzGTnPqy1AFzfR+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5t5-00000004Olr-2Kbp;
	Thu, 22 Feb 2024 10:01:07 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5t0-00000004OkD-19eC
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 10:01:05 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id A61C62566C; Wed, 21 Feb 2024 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1708505161; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=HvcnNtRWyET82cStlh1fPuUREjVcqvudGgu6D/ihxx1nxWcj6VyLHwtPOAGLQdMe+
	 gjjO8arTDJCbe7t6F3oFOUVHtQo4i0pT6z26YYrKwObDdDzOTCuTUk0KMpdA/YhMIb
	 yvGj4+0keh20F+xj1OUtAzM1QPsICJNEQnpaTf9wUmghsDswGBeen2iEqGjH7TkBqY
	 zhI4HAlGuwcpqU6WJ3dlOMZnUIwOK4RNOw5Gq8mwI1wLjdj+yH9A0yi+7k0xXYegL1
	 xFmt2oDws+r2wzJl53rkylkGqV7NPMhjNyhfZYtbYktjXBc7XOGv4o5ZcUrLl5ToGC
	 2BcllhaL6jhCA==
Received: by mail.thrivehub.pl for <linux-mtd@lists.infradead.org>; Wed, 21 Feb 2024 08:45:49 GMT
Message-ID: <20240221074500-0.1.4r.233ht.0.8gzolvi81q@thrivehub.pl>
Date: Wed, 21 Feb 2024 08:45:49 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_020104_658496_7F082473 
X-CRM114-Status: UNSURE (   1.92  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpTenlt
b24gSmFua293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
