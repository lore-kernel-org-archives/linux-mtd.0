Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MTBJ-00020v-00
	for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2002 13:15:13 +0000
Date: Thu, 12 Dec 2002 14:45:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Geoffroy Stevenne <geof@hellea.com>
Cc: linux-mtd@lists.infradead.org, jch@hellea.be
Subject: Re: bbram access problems
Message-ID: <20021212134542.GB29974@wohnheim.fh-wedel.de>
References: <20021212140546.3607a3e0.geof@hellea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021212140546.3607a3e0.geof@hellea.com>
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

On Thu, 12 December 2002 14:05:46 +0100, Geoffroy Stevenne wrote:
> 
> We're trying to use BBRAM on a VersaLogic VSBC-6 m-b.  We use the slram
> driver and the 2.4.18 kernel.  The problem is that we can't acces the
> entire memory of the BBRAM, just the first 64k page.
                                             ^^^
> 
> Other problem: we added to our lilo.conf:
> 
> append="slram=BBRAM,0xE0000,+0x10000"
                              ^^^^^^^^
If you can read hex, you will notice that you told slram to map 64k.
Change the append line in your /etc/lilo.conf.

> We can write to the BBRAM but we noticed data corruption (not write
> operation was done) in this address range.  Is there a way to lock this
> memory area?  Is this the right thing to do?

> append="slram=BBRAM,0xE0000,+0x10000"
                      ^^^^^^^
slram took memory from the first Megabyte. Is this correct? Does you
machine have only 896k of memory plus the bbram? I doubt it. ;-)

> What we need is to mount a filesystem on the entire BBRAM, not just the
> first 64k. I can (and wish to) provide more information, test changes,
> report bugs, etc. I can read and understand C code but I don't feel
> competent in writing drivers on my own.

Figure out, how much memory you have, how much bbram and where the
bbram starts in the address range. Then you can come back or - better
yet - read up what the "slram=" and "mem=" parameters do.
Understanding the problem beats having it solved by someone else. :-)

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
