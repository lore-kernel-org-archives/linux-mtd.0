Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBFEC5DF82
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 03:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9nqFA6akRePo5pwndOkXaCMfThdJ8pmohvLWApoW1RY=; b=w5Q7a0aO4cjCaI
	kmDh9ZItN7w7uFaixyPcBJwcZOiQuBNMM0wofAquG/C+K89vPCGxIj2yOcLe5oCJ8DELg+InNfCLa
	kGhVLoE5dTMoaAnE9CjUcd2bmBhhmeKfBvZROTG8JLEsshgEbbx0c0ltFR8MTaRqqGtikaq8HdsK+
	vA1mmwBHvvyiNa6uGrE/sPhpXSn24WtNEjw4No5v/U5aCg17fmS7QE5mrTDCVPKNDNdUyYLpwaPIi
	x7WAOyIpWBFePmKgRVw6ohJbXRRHgsRMemQb24b9K42xEzybTYi3aTvmMNpavx3RKUzhq2ApyzYVD
	zbmgQZbILRdCkoY36pAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwX2j-00000008wT7-0AqD;
	Wed, 19 Aug 2026 03:32:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwX2f-00000008wT1-2vDR
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 03:32:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A11F60204;
	Wed, 19 Aug 2026 03:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D348A1F00A3A;
	Wed, 19 Aug 2026 03:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787110360;
	bh=RiO6nRyKaGYmjg+34S9Vf5gENfCuW58pMcX1iAk9eN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IjGLVxC1a81rwsj3b62g+MZV8vcxtkY8V+fMP7/J62XGYTiiwbU2iu6W7CSRpypXX
	 TohKV7Wf6ztqrA506flHOAtenJH6QUZ1D832pf7z/9OXlrfxg0r7Zg6SGw2AtXRLTZ
	 Uh2DG2L6AY+glqV8Kk4yMV97OxZgYsuuAvpb/nWb1Eb0Kbp8j68qfXrTi/1OYmBwri
	 nCknIuP3Iq3dzy3dr9Ls4WfWOgsIugEzdbsuqKfwmxUVFoiWpP55DxHA0plG4i6qN3
	 inFdnDQ/FR4K/3LZJmA2Hc05iVfCnRPLyh2kmGIp7O4SNdlTvxkyqZD9kMMkT+f1pJ
	 l7D0eMC8Neayw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dominique Martinet <dominique.martinet@atmark-techno.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Liyuan Pang <pangliyuan1@huawei.com>
Subject: Re: [PATCH 0/2] Backport fixes for UBI
Date: Tue, 18 Aug 2026 23:32:22 -0400
Message-ID: <20260818220420.8@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
References: <20260818-ubi-backports-v1-0-324d6816d2ae@atmark-techno.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2026 at 02:09:33AM +0000, Dominique Martinet wrote:
> While looking at recent UBI patches I found these two commits that I
> believe are worth backporting.

Queued for 6.18 and 6.12, thanks - 6.18 is missing both as well, so it
gets them first.

-- 
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
