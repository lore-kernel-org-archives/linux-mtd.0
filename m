Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15xOwF-0000y5-00
	for <linux-mtd@lists.infradead.org>; Sat, 27 Oct 2001 09:35:32 +0100
Date: Sat, 27 Oct 2001 10:44:48 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: "W . Suika Roberts" <ssfr@unm.edu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: blkmtd command line specification?
Message-ID: <20011027104448.A1177@wohnheim.fh-wedel.de>
References: <20011027003752.E16430@misa.genom.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011027003752.E16430@misa.genom.co.jp>; from ssfr@unm.edu on Sat, Oct 27, 2001 at 12:37:52AM -0600
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

> I'm working on getting a jffs2 root file system running on my new Ipaq IA-1.
> 
> I can use blkmtd when it is built as a module, but I can't seem to figure out
> the coomand-line syntax for using it built into the kernel.
> 
> So, how do I specify what to do on the command line? 

With my kernel, I had to patch init/main.c. If you browse through the
code, you notice the large table of potential root devices. Add some
/dev/mtdblock0 to /dev/mtdblockn with the corresponding major and
minor numbers and enjoy.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer system are
those that aren't there  --  Gordon Bell, DEC labratories
