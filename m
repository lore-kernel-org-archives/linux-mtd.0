Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB88C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 08:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94A7661050
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 08:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94A7661050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uzi5F/Ouzjb5d/OPTA+UvfYrWqLWEc7BjZpI9BbkTQ=; b=1/b/yYur1Yx/Ki
	DLaI2e8yIYEdKSrxD9qjrmkGkMRE1hMmKs5FjjknZU4pkSVoQ2EHnm9Fj1b40tZvaby2+rdiIp7KD
	Oelc7vDzbphV9smacuHJ6Ec8vJIvr0sOAnMltukiA2Dh6rjqXa6Iqoqdfa1Z3cXQ5XIWsPlyzj8ZZ
	fFb1OimmHPHw0+JhMxVjryF/i+P4jNoUXH06Wq4V1qVcgO2NCYGErMw/ULKcz2UWqxdxL3pTljZUy
	6ly+EuemXhy1xdoiT5vij223nzb0Q6oa6qNZiYb9nkjCtuubv11LKcY7hTF7mCfY5RG96Ohxy8u9Y
	DirFpdIgkfPe/nvoUdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhpOX-000yBH-R3; Tue, 02 Nov 2021 08:43:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhpOU-000y9o-Vo
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 08:43:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3FB181F4417D;
 Tue,  2 Nov 2021 08:43:43 +0000 (GMT)
Date: Tue, 2 Nov 2021 09:43:35 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mtd: rawnand: nand_bbt: hide suspend/resume
 hooks while scanning bbt
Message-ID: <20211102094335.0e7c80de@collabora.com>
In-Reply-To: <20211101084623.xrpwwvweez24svib@skn-laptop>
References: <20211026055551.3053598-1-sean@geanix.com>
 <20211026055551.3053598-2-sean@geanix.com>
 <20211101083824.236b9983@collabora.com>
 <20211101084623.xrpwwvweez24svib@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_014347_221071_2855DA11 
X-CRM114-Status: GOOD (  18.86  )
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

On Mon, 1 Nov 2021 09:46:23 +0100
Sean Nyekjaer <sean@geanix.com> wrote:

> On Mon, Nov 01, 2021 at 08:38:24AM +0100, Boris Brezillon wrote:
> > On Tue, 26 Oct 2021 07:55:48 +0200
> > Sean Nyekjaer <sean@geanix.com> wrote:
> >   
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > The BBT scan logic use the MTD helpers before the MTD layer had a
> > > chance to initialize the device, and that leads to issues when
> > > accessing the uninitialized suspend lock. Let's temporarily set the
> > > suspend/resume hooks to NULL to skip the lock acquire/release step.
> > > 
> > > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")  
> > 
> > I think I already mentioned this Fixes tag should not be there.
> >   
> 
> No, I didn't recall that, but nevermind :)
> 
> Hmm when ('mtd: core: protect access to MTD devices while in suspend')
> is backported we want to live with the use before init of the rwsem?

It's not meant to be backported. You'll need something simpler...

> 
> /Sean


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
