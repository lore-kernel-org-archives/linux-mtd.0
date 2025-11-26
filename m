Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964ACD10390
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Nov 2025 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2wEJJVjRyUHOqVc1FvVUz3gfk4jb89TPla5NCnWIayg=; b=bHWhvNIZHvrDod
	/unTzt7e/fkEMl5zCpOzeqjSirsGWsk210BOd4+K3tDMpihES3rjh+K2H6ydLIGMGi2CS64uXF9xV
	9/701LVGSPwK6sBFYDcUnBsgv9uX8aLy9l8q3hOCd2PArAFjZf2JUC/S/ZDP3OSNAtJnAwuKUKvaz
	OblvXRx5wxOhyRJbJyXujt+iAUhx93oVcV2synkQ6tUGNmuNxGzpVPVR4VHID/GeVUBe5soQWi0VX
	9c2M9qVI3USHOsDC/Cap5sRpGT0RQZsBTQ29jkDy1a3HnurqNolKDOz7ABDbkkYNsIGa32m2STucL
	TqSN4aURXEGpXJVsVMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBPI-0000000EfSP-3283;
	Wed, 26 Nov 2025 09:01:48 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOBPF-0000000EfRU-476w
	for linux-mtd@lists.infradead.org;
	Wed, 26 Nov 2025 09:01:47 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id 5F72BA8547; Wed, 26 Nov 2025 10:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1764147704; bh=Q6Mp/vCJCiZNgk6fb7utkqIErbcoVoR/CugPofoeCtU=;
	h=Date:From:To:Subject:From;
	b=tyQfKUK+NoqaqnCIYzowqbWGWvtQfUrI0BGc/HmM8ZIM62n/RXownVUdIcaayCn1d
	 vwz1QHZOWLaT6vRGZti8Y8kLSE1DnfDKigymmrIOTdrZO+V5G0x/mWtPqewJly7Og7
	 U51Z39lCdcyDVOTVwA3PIurNbinZfmPfYUqq1Gvqs7Wib0P2SrMHw9KOphZR9TFEGA
	 wNLW90XhNQnb6ZQRw+SEsG7uTooLDJ2d55kQrsPpZ80NZJmQeZXDsUo8PTIjY3z9l4
	 ciXCbbg8fTvID3lt5pgezyRJUm2/2pfOO48qsRNPQq6gk5/C6uPe3C8Ab+F6DSh5zH
	 wMP/lPyfwlpKg==
Received: by mail.vexro.pl for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2025 09:00:51 GMT
Message-ID: <20251126084500-0.1.ot.4m8la.0.n0apbfh8lx@vexro.pl>
Date: Wed, 26 Nov 2025 09:00:51 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_010146_156987_FB34BE23 
X-CRM114-Status: UNSURE (   2.61  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtCkFkYW0gRHJ6
ZXdpZWNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
