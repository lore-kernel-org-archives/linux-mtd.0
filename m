Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17o5zE-00066B-00
	for <linux-mtd@lists.infradead.org>; Sun, 08 Sep 2002 18:36:40 +0100
Date: Sun, 8 Sep 2002 19:36:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: adr <mtd@mcmen.demon.co.uk>
Cc: Mtd <linux-mtd@lists.infradead.org>
Subject: Re: Writing an mtd user module
Message-ID: <20020908173635.GA19559@wohnheim.fh-wedel.de>
References: <200209081726.50430.mtd@mcmen.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200209081726.50430.mtd@mcmen.demon.co.uk>
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

On Sun, 8 September 2002 17:26:50 +0100, adr wrote:
> Having written a driver module for the Dreamcast flash cartridge/vmu, I am now 
> attempting to write a user module that works with the default fs on the 
> Dreamcast flash (see http://mc.pp.se/dc/vms/flashmem.html if you are 
> interested in knowing more about that).
> 
> Anyway, I am struggling with the documentaion (which, as I found with the 
> driver was way out of date) and the code.
> 
> Looking at the mtdblock driver, register_mtd_user(&notifier); only seems to 
> get called when devfs is being used, yet the documentation implies it should 
> be called every time.
> 
> What have I missed here?

The block devices don't need to be notified of any changes, devfs
does. When you "ls /dev/mtdblock", you want to see all the devices
currently registered.
To reach that goal, on 'insmod slram something", which creates a new
device, mtdblock has to be notified of the change in order to change
the devfs entries.

Now, for an fs, you only need one device, known from mount to umount,
so register_mtd_user() is pointless for that purpose.

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
