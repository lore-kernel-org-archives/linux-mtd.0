Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED63C10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:31:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AC9208C3
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:31:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQFAEQUV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qaWwg55L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AC9208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WX63XnjDxqTRhnfQytVDRxxOS97INzAA3vCSdVmg/LI=; b=bQFAEQUVT7U4JX
	Pu/kV+wu1buCb7RlWr67/iG7mwzmL98ct+rtzEcXZmNljeZFLPUHDLN81Kb+ehMYJg9vnbDxgp7jW
	JTClljpVFiIxLDjcRGkNIlZv3p4nNgqxCL+MSA/qCNMIAPZ+tLOASrKf3/KZLqW/f6lT16wHaTtKu
	i1vA+Hvea5HzMLvLKUry+wIAU8CoXC+4+lxL6j37HO5jl4UfsKfWSJfHoC0tEpk+a+CD5Wq0/oF9R
	sWwAGdJqSyirumI1r4M2HxA5/46P3dGtH/u68XIlQeXZSNRVSIJobDSRSrBl8AbDP5Paln3I48U3I
	YZ03lls6fhHYq9VUVopw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjfG-0004V1-Ff; Tue, 10 Mar 2020 18:31:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjeA-0003RY-EH
 for linux-mtd@bombadil.infradead.org; Tue, 10 Mar 2020 18:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3P81yqEW+Ifcj5TCERENWO5zhpoRWbsy+iCwo3MBMpE=; b=qaWwg55LgB2qQwP3JSpca3D9a/
 fIJoC0h6XHuTmVJhp8LD/E2xVHpAitYZOIVPJLxOzjP6cBDeO3FcbDqigmALJb/scjBkeeAJTdypi
 RTRBrDGjraf/2k8obLXTy+O791ayAie7p0AD17zju/G+iHyDWK/LCqhBEPWRXr5ro2cIBqAOexeQm
 n616AXHFYJgrnr2ObUiizmnh459BcM+ab9nPQRxr7Ycle25MzL/xuXqgIdmLpQLKDwG1Yyz9L9h6Q
 bAIrZYVN0c9yU5YZVtViZP3abKoJaHSK8YDoKmVDbtcXxXgXQKXPK7cJa920MmC2At2AHcqC4R+et
 nItlRAHg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBje5-00008l-Hz
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 18:30:28 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 726D360009;
 Tue, 10 Mar 2020 18:29:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [PATCH 4/4] mtd: rawnand: cadence: reinit complete before execute
 command
Date: Tue, 10 Mar 2020 19:29:36 +0100
Message-Id: <20200310182936.17670-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1581328530-29966-4-git-send-email-piotrs@cadence.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 335e1ad05264d4ec4727b2832f42be5f299651ff
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_183025_755949_429E1AB7 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-02-10 at 09:55:28 UTC, Piotr Sroka wrote:
> Reinitilaize complete object before executing CDMA command to make sure
> that done flag is ok.
> 
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
