Received: from outmail1.freedom2surf.net ([194.106.33.237]
	helo=outmail.freedom2surf.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1ByImK-0007ka-Qw
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 19:26:38 -0400
Received: from wirenth (i-195-137-81-187.freedom2surf.net [195.137.81.187])
	by outmail.freedom2surf.net (8.12.10/8.12.10) with SMTP id
	i7KNQXnF025516
	for <linux-mtd@lists.infradead.org>; Sat, 21 Aug 2004 00:26:33 +0100
Date: Sat, 21 Aug 2004 00:26:33 +0100
From: Ian Molton <spyro@f2s.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20040821002633.13ba0927.spyro@f2s.com>
In-Reply-To: <20040820132332.42c78dcc.spyro@f2s.com>
References: <20040820132332.42c78dcc.spyro@f2s.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: supporting stupid chips part II
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I've hacked some new read/write functions and a new command function
too, and I can now get to the 24th block before it complains that every
subsequent block is a bad erase block.

The controller is a pest. for writes of commands, it needs bytes. for
the address it needs a word.

for everything else? god only knows. I think probably words for data
transfers.

having never used MTD before, Im not sure how to go about testing it.

Does it require userspace tools?
Should I see anything in /proc/mtd (or anywhere else) ?
What should I expect it to do, given the disk probably has a SSFDC DOS
filesystem on it (winCE handheld device)?
