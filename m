Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA64AC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:55:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522D961936
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 522D961936
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xY1nTqpFbTbSS/0VLccmF+NnmxSdVJ1p9s/wYTc50CQ=; b=rH9DcE1NeobDIzrPWW4EQERg+
	Ka0f7zK4pwDPkfYRWAjjodj5X2NEurVFlx3ZzCwmSXQ1j/8xBALdmUmE3LJsK1l3LEp0omb8pVCAL
	IuqdjPuPL89e5kRghaLiRqBJqc4ZEDWY9kVyj6qC5glgBDzfd5/qy5SGdLGDo9Q2QzBGtIZV6/KK6
	sHJTrgC8K+mSMNU5h+SDafHZCYvIebtZvRbh4lcGKrA+PioXY74UbQFqoQ/zje5RQa2ISxajXbLLu
	gC/k785TDnbemm874kBbTdN6eflm7pOoffRbujKUEdq+oWhnvXC8qcnh7lsuwJN78Fuofehro64qB
	Dk8Ak+0/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw5T-000x1a-42; Mon, 29 Mar 2021 17:54:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoxf-000Zfp-R6
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=A4XAMjBT00eBEof4X5oPzDpJGcmABtZoszytBvPzLy0=; b=YH2n/uh8q3Xi2KdDX+nkif6w4u
 3g7I3Co+3xY/1ERnuMDuCdL1LHgzIVTe/PJaxIJYMQh4HhnFfCKKSpEP5b9FdnmBpS2wVzBi3R5Tt
 8ZIWl4cZzXhKPAdYue0C4I0iyms81XKHWHUTRjj6KAgd2tnvmaDh74cNkrphP+ZeBdVnxBLIVxS8U
 bsN9Sad/faX+zXONUtC5O5Ff1CEPGy/aFYPciStZFC8iqDMAgKzVcg9mTDQ9apvA85BvYoBCPuuF8
 UYoK47m8tPFf6Xk3GqgzuA0rXkaFALgBr7VoA/OCQfr+uSsA9W8ujoGMCj/AuajjYbDCz2xIebx4l
 cRGcVc5Q==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZDP-000Kfx-3Z
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:28:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 606B8240005;
 Sun, 28 Mar 2021 17:28:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] devicetree: nvmem: nvmem: drop $nodename
 restriction
Date: Sun, 28 Mar 2021 19:28:21 +0200
Message-Id: <20210328172821.9939-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312062830.20548-2-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'52981a0fa9f7d68641e0e6bb584054c6d9eb2056'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_182846_905200_440A7215 
X-CRM114-Status: UNSURE (   5.98  )
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

On Fri, 2021-03-12 at 06:28:20 UTC, Ansuel Smith wrote:
> Drop $nodename restriction as now mtd partition can also be used as
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
