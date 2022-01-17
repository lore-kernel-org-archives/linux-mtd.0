Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038CAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0sZorDsVvLiVJiUlJKcUiAB2g8nBKrIwR1nIW7sB6k=; b=wDwF5OfpPndkRw
	TO4PvWjzbL9+Izk+7qTAnUgpnYIXiMfY0zbT8XWLFukq2jqaBjulirKMqkUd11zuSW0lUKxQ8x3uo
	Ok8+5w154JHeLsgw77lApCLNgJjSOTV+piUmKsnFTBOgg4VnQ8wRUSeCVlt9X8etgLrlsfJGdNJ2E
	BaC65JINdQILI9AQaZ9fR/Be68C89sGhiPicY0JmG9DndxrQ4TL46N7vfjAcMLUjJxTozi9OKsjbf
	g5fz/k87ua2rqytTd1iY0T4V/qY0LnBdki1fbO29+NBC0LljTTYXKjT5+0Cn1U3kR4Pphbr905r9/
	cSTp7Lp0ZjetwxmKkBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Mqw-00DzoI-BT; Mon, 17 Jan 2022 07:54:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Mqt-00Dzmd-NH
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 07:54:57 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5C75F1F43428;
 Mon, 17 Jan 2022 07:54:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642406086;
 bh=Ruxz52GcOQAu6AptUfv1ReGiDTTFDcgWyb0TxyTLhh8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e84ZFONaA5ZPi7C+AabqaK/tr/OISWLE0uiysgtphJOcc+fuEEM3tOfx1XZun9Xgz
 6SJrJjFuga7QU/XWXd51VhbMNauqOmJ1V2sxNs5KpkZMuG/CaffomsK5LWuHVAySXT
 3qoUlqWbSwP40h9iWPslRwza6g5VsWDY7/66jD4cnyFAgU8Z480hL3TDqC7oEzV7wi
 ABhCGtBgsL9XHhBfzcRdC6urNRnRs5TlYHMX533v2bKzMpOXhjfDIl+bJUCSorokIL
 MknKDYMGN2GtWXc9mULCLXAa3JG6tK5Yo7t9fUFN2elRIA4ZpJbW/4zsvM0mZKOJcu
 9BeNu0b47IzCQ==
Date: Mon, 17 Jan 2022 08:54:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: protect access to rawnand devices while
 in suspend
Message-ID: <20220117085442.7f19182e@collabora.com>
In-Reply-To: <20220117074339.ctuaxnetz47j45z4@skn-laptop.hadsten>
References: <20211220130015.3630975-1-sean@geanix.com>
 <20220117074339.ctuaxnetz47j45z4@skn-laptop.hadsten>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_235455_996197_3C0003C4 
X-CRM114-Status: GOOD (  16.89  )
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

On Mon, 17 Jan 2022 08:43:39 +0100
Sean Nyekjaer <sean@geanix.com> wrote:

> On Mon, Dec 20, 2021 at 02:00:15PM +0100, Sean Nyekjaer wrote:
> > Prevent rawnend access while in a suspended state.
> > 
> > Commit 013e6292aaf5 ("mtd: rawnand: Simplify the locking") allows the
> > rawnand layer to return errors rather than waiting in a blocking wait.
> > 
> > Tested on a iMX6ULL.
> > 
> > Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---  
> 
> Hi Boris and Miquel,
> 
> I know the kernel test robot is complaining a bit about uninitialized
> values.
> But is this OK? If I fix the unitialized values?

With the 'uninitialized ret' issue fixed, it looks good to me:

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

But you probably want to add a Cc:stable tag.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
