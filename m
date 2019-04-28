Return-Path: <SRS0=50Qk=S6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE826C43218
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 13:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D8AE206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 13:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jQw96BOU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D8AE206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbT0KzN4nURgjmbkSyyL5GFn+o9J11vhfUPAZUsg2zU=; b=jQw96BOUpYvNkP
	VtGG1WJ/C5QhY2l0G6z0Dv6qBJxzD5/zsCgbGSa4jyaN10+eAhWyf8zwLaNUODVkXml6ZlZIJ8m6N
	0Ce19etYoXCHmWZeUGsDK6kkYfi85qeRdp0O+4vY/dsKHsEeNpdgHNu7t7MWOnWEYyN+Tl4qGtKT/
	QXsRmQx1LgJ2GwF45t2G1DLmDqS4sZjOPiX+xyTwXn5ASZW9a9x+3YFGenpsPzjvdoR4NKW3q+/cU
	cY8/Mx6gqKwcBQCIZea5snaaD9X9su2fNarLyjV6SRh4uNIaSlbCo2bxOSW/6UR1pK3Ly329gfJ9r
	afTgIbvX1NjXaoJWeUCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKjXB-0006LU-L4; Sun, 28 Apr 2019 13:07:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKjX7-0006Kq-HX
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2019 13:07:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A3033608A3BE;
 Sun, 28 Apr 2019 15:07:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ID3tvGIp-Uex; Sun, 28 Apr 2019 15:07:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 30E4B608A3B5;
 Sun, 28 Apr 2019 15:07:41 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 44u92UxJ-Uwy; Sun, 28 Apr 2019 15:07:41 +0200 (CEST)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 90B5A6089E20;
 Sun, 28 Apr 2019 15:07:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: Clean the controller state
 before each operation
Date: Sun, 28 Apr 2019 15:07:40 +0200
Message-ID: <2565820.SR17ECleB1@blindfold>
In-Reply-To: <9a8a3963-1b8a-9f9b-8e54-200945518f99@zonque.org>
References: <20190408083145.13178-1-miquel.raynal@bootlin.com>
 <20190414105019.5bac65d3@collabora.com>
 <9a8a3963-1b8a-9f9b-8e54-200945518f99@zonque.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_060753_730713_FEACB067 
X-CRM114-Status: GOOD (  13.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Daniel,

Am Sonntag, 28. April 2019, 14:20:49 CEST schrieb Daniel Mack:
> On 14/4/2019 10:50 AM, Boris Brezillon wrote:
> > On Mon,  8 Apr 2019 10:31:45 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> > 
> >> Since the migration of the driver to stop using the legacy
> >> ->select_chip() hook, there is nothing deselecting the target anymore,  
> >> thus the selection is not forced at the next access. Ensure the ND_RUN
> >> bit and the interrupts are always in a clean state.
> >>
> >> Cc: Daniel Mack <daniel@zonque.org>
> >> Cc: stable@vger.kernel.org
> >> Fixes: b25251414f6e00 ("mtd: rawnand: marvell: Stop implementing ->select_chip()")
> >> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> >> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Has this one been queued in any tree yet?

Isn't it visible in linux-next?
I was about to send a final PR to Linus later today.

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
