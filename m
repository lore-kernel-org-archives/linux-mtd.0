Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EA5C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:10:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5AE613DE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5AE613DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BcQK6lHy1fNwX9vjozEvXwlMLt8eLrF/ZfpjnZiNzq4=; b=BBFIeTYBTq76jjH1mOLE3gLcL
	QYp8YSQjxa05VA7k1/Eey3R3dEPzXfkR8vzKnOfd87zzPI7dh+JthJSDntWa+GEqW9xhocDo5OJnF
	0NAmYynsmsTMqeTjT0afJGmgSUvE9oL8m8lT3trkQMIWakgcEwLLuX6CvPzto+RRdTzpT9xyntxCh
	9bwjFRbMrMwW4XQPOCDvstpLeUE24dm1NB/OAhsAdeKlIft6B8SfOVvyIU4/LOVAq0M+UaMhw89bL
	VifpuoMtksrmuzMdGs5tjWU3Z5iLOTeWxqkDUN5x5W669wZygTmrWqBLDFd1HIHpLMIeggjS3fPwO
	RIoKRyDDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg1vG-00DiPn-3u; Mon, 10 May 2021 09:09:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1ud-00DiMe-5l
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=c36iPKDZ9tPL3ARdgmW6Yx2IzIuQve3iQTZrdqUa0uw=; b=wGZNY+eWDGYmdL08jQK4k4ve/3
 sJ0mbOppqUWeiqSNPmIUuoIpHglVnyCh8iSEZOOEB+0AyCa3DozjDM3saOJCyjyVxsWj49+BOvmlL
 c/1dCXjDI2w+aa831gJsM/ZuLHntwSlubRMpCh8fIvd+p0Pg4Wi7ylXAHQTPo5ZfacCdfbvoXvb8J
 0SKGgiNHegZrnLPzfW5H/ui89TIAiqIF6JhqiZMVl4VKElYoDaDfroy3QWcmPqsorhsmwHZ7Hp8Y8
 wBkQtQnb3pTYsO9KQKwKka625R6ZvAepMqP//znxo98S7hKGcl8i8dM3Uzq473SgYbQOwdd7OJpu/
 ppyIDRfA==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1ua-008RRe-CJ
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:09:13 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 536A320001E;
 Mon, 10 May 2021 09:09:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v3 7/7] mtd: rawnand: txx9ndfmc: Fix external use of SW
 Hamming ECC helper
Date: Mon, 10 May 2021 11:09:07 +0200
Message-Id: <20210510090907.3392-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3f40801a2d1cc68324fe2c0ea147472b48b33866'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_020912_575618_762733E7 
X-CRM114-Status: UNSURE (   8.70  )
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

On Tue, 2021-04-13 at 16:18:40 UTC, Miquel Raynal wrote:
> Since the Hamming software ECC engine has been updated to become a
> proper and independent ECC engine, it is now mandatory to either
> initialize the engine before using any one of his functions or use one
> of the bare helpers which only perform the calculations. As there is no
> actual need for a proper ECC initialization, let's just use the bare
> helper instead of the rawnand one.
> 
> Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
