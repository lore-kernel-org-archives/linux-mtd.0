Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K49Gr-0002RS-Vf
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 06:48:26 +0000
Date: Thu, 5 Jun 2008 08:48:14 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Russell Fleitman <fleitman68@yahoo.com>
Subject: Re: Intel Turbo Memory
Message-ID: <20080605064814.GB17037@logfs.org>
References: <261293.50747.qm@web31815.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <261293.50747.qm@web31815.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 June 2008 15:58:34 -0700, Russell Fleitman wrote:
> 
> Hello, I have searched the archives of this list and have found no references to Intel Turbo Memory or Robson.
> 
> Has anyone heard of these chips working?
> 
> I have the output from dmesg and lspci ready to post but thought I would ask if I am barking up the wrong tree first.

It appears as if those devices are raw flash and could be accessed
through mtd - provided someone either has documentation or creates some
by reverse engineering.

I have tried to obtain documentation and failed.  My best guess is that
it is as dead as hybrid disks - those simply don't perform.  It would be
neat to use for different purposes, but Intel doesn't seem to see a
business case anymore and won't ship either a Linux driver or
documentation.

In short: forget about it. :)

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
