Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DD1C43460
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:30:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C0E961466
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C0E961466
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lpMfv99dPN9W6Es3Dihk5zJhLRZSOkEVSHpfmBA6iEE=; b=aPb2imEUkP8CaRJKFwtBA0MsX
	UhO7DUlbj9Tvvl63CilBE7iryZ0t2/qYXGY8asnlcSJxTmYDgaoEwJDPJwTm2UX4YtVHdPC9kvfpz
	W8ciWIPgHdkji0KZdMqOVQicDQZE8QpCJIgclUaMJmd5mtUxK/jlYDN5fJEN3VZPGHbluH0/Tt5AC
	PINdtMjm/19oElb7WI5kQG/zrMVN3jBA/1whrIBTn0YDGijTDQ/KvC82HcyJyJeR4eQyQBDJloXUf
	5ZrBWuzG6SxCLF+f2bEk1QRGrF0sI2bZRR2BZ/gFvWdLDCSf8Ws7j+yUxNA2ON0DLEwNfu+MDBUGq
	+5cIYqalw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2Dq-00Dlcy-6Q; Mon, 10 May 2021 09:29:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vm-00DiUY-IR
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=n2YiIlSI4wfMMOn6XOoXGC6NwIafLnNqbf0s1TL+AgY=; b=GR/jtQsUy2TFL2LYW9reLYEUGJ
 d2lOZ61+k2ZppRmGSo957f+gK45XxbdcuuLB0bjZP8P1eCOAnlZjfeDyFWZMNe8unI7wrr/MiZt5h
 ChokJjZlanbYAD07ItjnmUq7dCrpf/24k4zcjemiZvMRKagN8DC6QZ338o8bBkOPoLroKIqNe8YLj
 m3ETvQgqNyi9TmsrY2nJeGazeAn8LveuFhTwBsbI46SfMluZOa1uj5IMPfs83xvVgSFus6hcs74et
 k7mF0pre4VdqZCrElWFSVU+3O43NjbiKg+x2cDjTzdxl3zMiUjXUNJsqCLy31Wdx3SUXDD2f/weHH
 VT2CQNXg==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vj-008Rbx-T2
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:10:25 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 65F73200011;
 Mon, 10 May 2021 09:10:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wei Li <liwei391@huawei.com>, huawei.libin@huawei.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH RESEND -next] mtd: rawnand: Remove redundant dev_err call
 in hisi_nfc_probe()
Date: Mon, 10 May 2021 11:10:20 +0200
Message-Id: <20210510091020.4229-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210407100526.3278741-1-liwei391@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'03299d054047c32d864abe2e640533c55acda6c7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_021024_095609_FC99EEBD 
X-CRM114-Status: UNSURE (   5.82  )
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

On Wed, 2021-04-07 at 10:05:26 UTC, Wei Li wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Li <liwei391@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
