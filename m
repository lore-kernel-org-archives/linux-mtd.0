Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD139C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=5GPPDDYaUK4Y6i
	Fu0+gIlrRW5nls9pYjk6CzuFusXY7BSbTLgZBfazrPaqPvNZTbBfOhZkI/BVMlaf95r6eF3kDrVcB
	NeQINcvqsjp0JI8S/oVrIyE6NxiEbeqM2x1gLLm+Wp7y5bv9iDLiIyI0MxdA766ETGiiP9vElih9e
	FBpvSYwDCFHPPSvwIy9NnddSwHWSC940HE8LFyyhiOAVVboKTLlUVjzO8y1z9iVmhOxNWoqRmgHjT
	CCK+e9zM0zcRf1kbnmAGz1q+AW6yfTRemyV+h6JV+cIIATpBIgA1EdZWuWolLnV81JM5Ib3m0wZNO
	4YzJ/13eTWbwLML5389g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mu2CP-002H5A-Nc; Mon, 06 Dec 2021 00:49:45 +0000
Received: from mail-4022.proton.ch ([185.70.40.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mu2CM-002H2O-Og
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 00:49:44 +0000
Date: Mon, 06 Dec 2021 00:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail; t=1638751778;
 bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=Ids29/SXzOXfzCa2Gnty+zMm37q9jFh2LG5TnW7Wa6sHgnWSmvqVsTxtnwPeS3rPY
 hyMRSha5zV617k2Ny3XURnfEJvRHoWLsqwrLdkMm0t5Wf9dohGeY0IhjLtUrRqqDC9
 ubgI7IbSEXbU46LOBfsnyvKNy9j4SC4PlaqwMVGW+oe6r10n/A4ZD9u0QzBZuZd4Tw
 oRhqmhLti4Tp/9uViUBuNKhzTniBMSiFtwfH4AdEVlg0AEvSRsTIrDzD1VSBf1uIL/
 rXR4h1Kf28ql7vGhkEDIKa/wI94J7ZTXYCPa/2fhpJWTf9MSsAbnMvSWmQ3Tpq/uDL
 oWbuH+qN6KYZw==
To: Ralph Siemsen <ralph.siemsen@linaro.org>, miquel.raynal@bootlin.com
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd-tests: use pages during readtest and stress
Message-ID: <dfa25f7c-9276-df95-1ecb-cae65f25bda1@sigma-star.at>
In-Reply-To: <20211202143852.3132942-1-ralph.siemsen@linaro.org>
References: <20211202143852.3132942-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_164943_621930_4D89F9C5 
X-CRM114-Status: UNSURE (   2.56  )
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
Reply-To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
