Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tqAX-0003wp-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 13:51:33 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id OAA20335
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 14:58:47 +0200
Date: Wed, 17 Oct 2001 15:00:41 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning rewrite
Message-ID: <20011017150041.A16970@wohnheim.fh-wedel.de>
References: <20011017105143.B319@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011017105143.B319@wohnheim.fh-wedel.de>; from joern@wohnheim.fh-wedel.de on Wed, Oct 17, 2001 at 10:51:43AM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Here are some quick pointers at my design goals:
> [...]

I forgot one:
- Devices may be assigned numbers. Device 0 will become mtda if that
one is still free or the first one that is free. Device 1 will become
mtdb,...

Jörn

-- 
Open your arms to change, but don't let go
of your values.
