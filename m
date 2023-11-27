Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DCCC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 09:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RA6gB+HjPUknUP+6Dk0PenSUN3ov9eZ0kr5+JPRirYs=; b=vDNFZ9cztILMcD
	+nAkt/MPtLdCWRTqGQtV107AbZ8BSQUZRJBJ3Y0Xg11OiL7rAPV309GFgK3iKSLAEDo6doxKBjhoc
	Y6MgTfrbGaXsYxc8RsxUaq510qFwbesgyhMXBjBN1K0oWfB0Nv9ZwpopQMCrrlUXHw/0ZPoZ63ATE
	eCdvwYRbhERFQ/fMBUA/UVN61i91wx1zerXn9X81ZCXWn+RIDM4MsnBCwJkXs6OFLk8lfjF3ikJg5
	c7DUdMCn1daLiKlzQThavZyZNwWKtmD2BD+120Vpk88sptzCHmCr8cQUv7XnUApXD2CdjB69rwmcg
	LZ1QiuiIP36eWDRetxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZb-001vAB-2d;
	Mon, 27 Nov 2023 09:06:35 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZZ-001v9M-2D
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 09:06:34 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 076FF24A14; Mon, 27 Nov 2023 09:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1701075942; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=SMVih+EFn1B5/DWWdT6q2f1e7mnIIxch9VmwdfoG81HwVZGUMgJ8nzdiLU2ePBRiD
	 hmmo5f992McLlI/ZfgPdQQ2Zb40igRUijCuba+BsxTaIgBhRHXT5mtWoMPL0BclXJc
	 9bSQH/9EgbKTbvG8qoHuDshm0vtqs1ZA9Gu4DS8t91njoqeK61dymyN9WGU55trxYA
	 wBuwZc4LLMUsL7+gKOEPCBkD8lw+Y11Rz++Rk4FJ4mWZnqDOImZSSPjl91XYXM9h9K
	 pAaIhYb6geKJq49ojhzAG2BpcN3GRIqW3OA2hjxdSV4wTtQ/PvRo9ZUibNGSIS/zCu
	 xTabrQKFf9mgg==
Received: by mail.thrivehub.pl for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 09:05:02 GMT
Message-ID: <20231127074500-0.1.35.1bovl.0.chyjjpqr6o@thrivehub.pl>
Date: Mon, 27 Nov 2023 09:05:02 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_010633_866080_9E76027F 
X-CRM114-Status: UNSURE (   2.16  )
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
