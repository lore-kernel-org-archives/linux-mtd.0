Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wN0H-0003b7-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 13:19:25 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id OAA00648
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 14:27:20 +0200
Date: Wed, 24 Oct 2001 14:28:42 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning rewrite
Message-ID: <20011024142842.A16290@wohnheim.fh-wedel.de>
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

Moin!

> I have currently started to do a rewrite of the MTD partitioning and
> the project might even grow into a complete rewrite of the central MTD
> code. We will see, how much is needed...

The most central work appears to be finished. This is still unusable
for any practical purpose, but maybe I am lucky and find another
developer who has a look at the code and can show me some bug, give a
helpful hint or the like.
So if any of you want to try something really new and really broken,
download the tarball from
http://wh.fh-wedel.de/~joern/software/kernel/mtd-0.0.2.tar.gz

To install it, simply unpack it into a linux source tree, recompile
and - pray.

I will try to provide new versions nearly daily and might have a
running one sometime next week.

Jörn

-- 
Open your arms to change, but don't let go
of your values.
