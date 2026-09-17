Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4783FC982D6
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 15:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HJZ/RqI9li9mO2Kht2g4SOmClyXkdjOrysaYr71o/Qo=; b=eVmGHWi7IfhVdtRnVIgxgvgEeG
	V+DPlR0nhO4hejjJ/gNfXbSevoIU/JEvnuWkhL5zuyWWoqTKzwUjAJVoj2mNQl6V5wqjVtt6ptvZO
	ZicSB/cZV1klpWUB3DzWzSjhSScet5TLfbr86a/DnIwaOkFUkBwX49lHG6cqigWIH9aj9og/gyCrJ
	or6QzUy6/nmP494fuYRgPoRWYdSuntYMNA2sekNY+m4znM5B/w64k1jJmansib5suzx2tLI/aSt5l
	mSPDQwmGjdfESCFvvSRQnvnLrnxW1b3G7ufepMLn44O4L2aYWAe6+rATpXNl2Krb+12JSZekwOhDH
	Viw8ENjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DqA-0000000BegF-1vhv;
	Thu, 17 Sep 2026 15:15:58 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Dq6-0000000BefW-3kHP
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 15:15:56 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789658141; bh=qtb0mgeKfScFxGZo1EOooQz
	0tDlyEIhzKLAY0pGX1z4=; b=923WAEfJca86uEoGBAZ2h1JME8+/mbPuhBiilW4cmsiezLuXFn
	x6tKSBB6R7lix7pO3f5g09fyRfFQZOXTSBBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1789658141; bh=qtb0mgeKfScFxGZo1EOooQz
	0tDlyEIhzKLAY0pGX1z4=; b=vEe9ZUl+wMx+kEFHTVYv4RQ5h1Ue0Fiy5SA2ffnxMe/OHbw3vC
	JW5jbNJO8BkyRiXO6knu9mMySAfQhUAgcSLQK6FtCxuDcNJW8YetFB0FyIo2h7s+duN6t3A/rgH
	tR6S7nGD4WXLU+qhlaLw40scm2Kt9NEmFdz/Shux+PdOFi0puOWWaOfbaR3W1hJM4yjtJKwvD3R
	IcfNn1Lo8zswf6zVMblTFfIDxRwIOvP/JXl91M7u1f86KQwnkLhuZ+3Trg3zw7j4PHZo3n6uHhH
	QRU6sECQFGsY3fen0/Zn1iy2fm2XbJhk1XJQKmFh7pANyNqcSyZKczRbzkfD/csCTjA==;
From: "Richard Weinberger" <richard@nod.at>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger (sigma star gmbh)" <rw@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, 
	<vigneshr@ti.com>
Subject: AW: [PATCH] mtd: Call get_wunit() on the master partition
Message-ID: <mu5o8zxl.c40d2780-5266-436b-a769-1014589d8df3@nod.at>
In-Reply-To: <87ik43j4fm.fsf@bootlin.com>
References: <20260917145329.380628-1-rw@kernel.org>
	<87ik43j4fm.fsf@bootlin.com>
Date: Thu, 17 Sep 2026 15:15:41 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_081555_076809_A287A1B2 
X-CRM114-Status: UNSURE (   7.50  )
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

Am Thu, Sep 17, 2026, 17:14 schrieb Miquel Raynal <miquel.raynal@bootlin.com>:
> On 17/09/2026 at 16:53:29 +02, "Richard Weinberger (sigma star gmbh)" <rw@kernel.org> wrote:
> 
> > From: Richard Weinberger <richard@nod.at>
> >
> > The code checks whether master has get_wunit() but still calls
> > it on the child. Fix this.
> 
> Ha :-)
> 
> Shouldn't we add Cc: stable?

Fine by me.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
