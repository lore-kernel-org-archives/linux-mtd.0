Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tmHV-0003dF-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 09:42:29 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id KAA32666
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 10:49:49 +0200
Date: Wed, 17 Oct 2001 10:51:43 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: MTD partitioning rewrite
Message-ID: <20011017105143.B319@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

I have currently started to do a rewrite of the MTD partitioning and
the project might even grow into a complete rewrite of the central MTD
code. We will see, how much is needed...

The work will break some current code and should _not_ be included in
the cvs for a while. I will maintain my own codebase for a while and
feed the changes to David when they mature.

Here are some quick pointers at my design goals:
- An MTD device will be the equivalent of a hard drive. There will be
several, named mtda, mtdb, mtdc,...
- Each MTD device can be partitioned into mtda0 (whole device), mtda1,
mtda2,...
- The ro-devices don't seem to be necessary. If noone has strong
objections, I will just discard those.
- The partitioning should stay out of the mapping drivers as much as
possible. The mapping driver only supplies a pointer to the partition
table parser. When the device is registered, the partitioning will
automatically be read.
- The physmap driver, being the most general one, should be
copied/changed to map several devices.
- Big goal: When given a new piece of hardware, I only want to change
the kernel configuration, compile, flash and be done with it. Any
piece of hardware that needs source code tweaks is a proof that we are
not done yet.

If anyone has questions, comments, code sniplets, ideas, anything, you
can contact me privately on through the list. I will only try to do
the best, _I_ can do and hope, David approves it.

Jörn

-- 
Often, the most striking and innovative solutions come 
from realizing that your concept of the problem was wrong.
