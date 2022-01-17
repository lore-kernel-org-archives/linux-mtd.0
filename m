Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660A2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 06:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:From:To:Date:Cc:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=PhJS4YlwrCE8P8
	sOG3UaJ2Jgg/XKVkMTnFX0FRGsmF/amXWCoHV+qxtIH4Mj3Cj1jwEGNrlU+lzeguyMyCyGQPi10Vq
	wnRsqjOuPHxBDCNiGJZ6mSNbYeIQYx8kPTjPHwu+wgJK14pWbDdz5DS3hJorBwp/a75O8CwvlbEQK
	QmAXh6CYUBocH7xKJHC3JyX7ZrJkhhviIIjfJCmUoSnVNasMtdM/ncYMLc7rzUfY80bTN0ft5lXRy
	QKzFohlVR3PSXCt0QHtPvwicp8UwDl+w16ESW+DUcmp9k3iKWOF0rqDkqR1MMhZygfwXnbzmnfZIq
	XwBULYkCbVfkzBx1CPDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LJy-00DeHD-FT; Mon, 17 Jan 2022 06:16:50 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9LJv-00DeGV-Qd
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 06:16:49 +0000
Date: Mon, 17 Jan 2022 06:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-star.at;
 s=protonmail2; t=1642400206;
 bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
 h=Date:To:From:Reply-To:Subject:Message-ID:In-Reply-To:References:
 From:To:Cc;
 b=Y8XVFQJ/j7+gNpsikR4VGBcBRC19+NP1ho/cLz5ASZvD+OVAsf/kXYZKQNvyfHfCB
 zrk6ntA1XSZY3nLirL85xMBZZCKe4ooltRF30UUtZ3tcN71jEj8qapXVjRI1caEOMr
 mMoYi0spSdmsM7ieiM4EHC2W4shzff2bWfB7ZlPVl+yrg83PEd2HyAU/OLo8vubOXJ
 OmqztxGGGp3E8K8eO0EPAoCTMfO5eFy8b2LOzSAjw79G3ZFS2+JNfvW7UUHzZezPA7
 DnidG+elN4nkfvmLMP4gJYryDnIAvmnSMV2QfK3RrAjDoYxQ0UHGgpovytH6k75XTv
 VfhDRfCSiD4Xw==
To: Mike Frysinger <vapier@gentoo.org>, linux-mtd@lists.infradead.org
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH mtd-utils] fix test bashism
Message-ID: <8a158574-19a4-d243-5f79-a559b0d3bc37@sigma-star.at>
In-Reply-To: <20220112182234.13231-1-vapier@gentoo.org>
References: <20220112182234.13231-1-vapier@gentoo.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_221648_055534_A2FFE52C 
X-CRM114-Status: UNSURE (   1.96  )
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
