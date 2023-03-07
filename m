Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEDF0C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKlAzX0FDbRMdCdxNh4qAeHPYICcuCMuq1DPZYmF3nc=; b=AQSEzT09x9nmoF
	4YeIA/Uigm70x/zq26fC9i1k4Nt7wOeVDN1VbHn3DiE3uuA+89foh3pah/qg9tedvsytza3l3OPvd
	kb2BXmP37qqjld16tdjQQwq+ZvclPDyQxcTvRSAEhMyMEOVy7vLwDMRLBEbgsXBOcZQPnsFn6rVx5
	YjnMp/yNFtndymkRKLo5IhWYQubKXQ8gJZFnyCXwu0BqsjekQzi/kAlkC4qeGfBIvDaKtCtSkw4r9
	LRTcs4Bh+xHVqXc6iR7H29qlkHF6EEuC3H/SCiz9dEEMXJalZ1/NHKufTYYoqWo5LShKPjCKynmJh
	aLvIx8GnIIuhZ+rwFy1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSUZ-00GeuP-EM; Tue, 07 Mar 2023 08:16:15 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSUW-00GetZ-0b
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 08:16:13 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id F03A65C013F;
	Tue,  7 Mar 2023 03:16:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 07 Mar 2023 03:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1678176970; x=1678263370; bh=8C
	6VRDlcxQhH+mSpw+nDDgGpxEIKQm9RL18lCT50WgQ=; b=N8RZhZsHo49RtxHhXw
	eIIUbw2NFCNlTZbpZ9Tb9n7m9U8jpOkbuQyD8MDvJynsAzzGqWWvr8U3Ydt3VF7m
	0oQTKWO3wF+3/vs85ZLKWq5ofm9fntOwAfcrzN00x5QGyleNeQs12kfOESuY1G5u
	nqKKrtRTCZv3Ot3zNRRjzlv6ft/YlWQhIllf+pe32fvkbib65DqdoipTxi4WXLZJ
	qBGCl5vO3imvGX/0m/sibUq2O4Sac/yrV+0FMEfxuX8jLxdaolFK7Jg+0Eco/76t
	E9EhGpAaWxeOq05tLIaP/eDl1UkBZ601+fU32NEMOxr13mwkgqGGL346hAMZ7lHL
	hb8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1678176970; x=1678263370; bh=8C6VRDlcxQhH+
	mSpw+nDDgGpxEIKQm9RL18lCT50WgQ=; b=oYBKZNa2k+kbf6GRcK2SQFkYf55sJ
	hF//TPcdDfl81FggoAOg/Ado4CtID9mymJDqhFAVOhUnUvTqxPpu4nY33IpLzbd0
	dasK94wHOAXu/NVgW2qJJ63tqawoxXvg0Vr0+AdgxlAtxY0OgfwVSnJaCKF8R3P+
	V90rZbuQMzX15HfoIthX/O16jRx8wg6A+RVFtkdEtX0yoe62OfhGOM8bTuv+GkOz
	N5Zf5Im4Vf4JeGSZ8x3vp+5yWxJJRHAiK0yf079J/E/16e3O47q/mBdptLp3wyrV
	7m205vQgLtXv1Lf35YnClj2GcO8KpMMnMD+tUYA+Ae/igN9AEjonuG8XA==
X-ME-Sender: <xms:yvIGZM0Yybb5PhVUQ3udu_2OKChQFsPHEnKjXth8E4c_lrg_RJE9-g>
    <xme:yvIGZHHZ2WqH9A7L0MfSpRhvSes4_T94uSrx_J09K3yPhPMrmysbo5cRZK8Pcnx2a
    RSd_MWEpAbMuDCswMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtledgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:yvIGZE5zqaF0cM3HRyIFRF5zCBj5snQdOENGGLlv9V0KcJVV17daUQ>
    <xmx:yvIGZF2YiUepTP5aTlW837uM0rB2EJ538_m72vALVev3SO9gcfQFLg>
    <xmx:yvIGZPExeWxW_d1SGJ0LHKlKSKc2JQX8WI0BUPR6mFn19i8R1xcMVg>
    <xmx:yvIGZDjhMMAVNutvq8vUxcH6VRw61DzMNZ2jp5VDXLSgi-Jcs2SZhQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 73950B60086; Tue,  7 Mar 2023 03:16:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-206-g57c8fdedf8-fm-20230227.001-g57c8fded
Mime-Version: 1.0
Message-Id: <61c230da-a826-4cbf-8e4c-79e607ce5878@app.fastmail.com>
In-Reply-To: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
References: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
Date: Tue, 07 Mar 2023 09:15:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_001612_141912_B9DD69EC 
X-CRM114-Status: UNSURE (   8.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 7, 2023, at 08:40, Lukas Bulwahn wrote:
> Commit 568494db6809 ("mtd: remove tmio_nand driver") removes the config
> MTD_NAND_TMIO and its corresponding driver.
>
> Remove the reference in MTD_SHARPSL_PARTS to that removed config.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Arnd, please ack.
> Miquel, please pick this minor non-urgent patch on top of the commit above.

Acked-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
