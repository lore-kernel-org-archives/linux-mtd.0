Received: from sc-smtp1.homechoice.co.uk ([212.187.157.195] helo=sc-outsmtp1.homechoice.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17r2b2-0000GJ-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2002 21:35:52 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: adr <mtd@mcmen.demon.co.uk>
To: "MTD" <linux-mtd@lists.infradead.org>
Subject: fs driver
Date: Mon, 16 Sep 2002 21:37:32 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209162137.32991.mtd@mcmen.demon.co.uk>
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

I recently wrote a driver module for the Sega Dreamcast flash (see 
http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/linuxdc/linux-sh-dc/drivers/mtd/maps/vmu-flash.c?rev=1.11&content-type=text/vnd.viewcvs-markup 
) and now I am attempting to write a file system driver for the vmu's 
proprietary filesystem (file system described here: 
http://mc.pp.se/dc/vms/flashmem.html, code written so far here: 
http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/linuxdc/linux-sh-dc/fs/vmuflash-fs.c?rev=1.2&content-type=text/vnd.viewcvs-markup 
).

Now the code written so far essentially does what the mtdblock driver did/does 
when used on the Dreamcast (though my code is not as sophisticated) - for 
which thanks - and that is not a surprise as large chunks of my code are 
essentially copied over from the mtdblock driver.

But I want to do more - mount the filesystem basically - but I am rather at 
see as I don't really understand concepts such as superblocks and so on.

I wonder if someone might point me towards some code/a site/a mailing list/a 
book that tells me what I need to know about building a filesystem for 'nix.

I have the O'Reilly Linux Device Drivers and Understanding the Linux Kernel 
but they appear to be either too simplistic or too ext2 specific to be very 
useful (at least on first reading).


Adrian
