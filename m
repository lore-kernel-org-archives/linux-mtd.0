Received: from sc-smtp1.homechoice.co.uk ([212.187.157.195] helo=sc-outsmtp2.homechoice.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17o81y-0006Hg-00
	for <linux-mtd@lists.infradead.org>; Sun, 08 Sep 2002 20:47:38 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: adr <mtd@mcmen.demon.co.uk>
To: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: Writing an mtd user module
Date: Sun, 8 Sep 2002 20:49:02 +0100
Cc: Mtd <linux-mtd@lists.infradead.org>
References: <200209081726.50430.mtd@mcmen.demon.co.uk> <20020908173635.GA19559@wohnheim.fh-wedel.de>
In-Reply-To: <20020908173635.GA19559@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209082049.02572.mtd@mcmen.demon.co.uk>
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

On Sunday 08 Sep 2002 6:36 pm, Jörn Engel wrote:
> On Sun, 8 September 2002 17:26:50 +0100, adr wrote:
> > Having written a driver module for the Dreamcast flash cartridge/vmu, I
> > am now attempting to write a user module that works with the default fs
> > on the Dreamcast flash (see http://mc.pp.se/dc/vms/flashmem.html if you
> > are interested in knowing more about that).
> >

>
> The block devices don't need to be notified of any changes, devfs
> does. When you "ls /dev/mtdblock", you want to see all the devices
> currently registered.
> To reach that goal, on 'insmod slram something", which creates a new
> device, mtdblock has to be notified of the change in order to change
> the devfs entries.
>
> Now, for an fs, you only need one device, known from mount to umount,
> so register_mtd_user() is pointless for that purpose.
>
> Jrn

I'm not sure I fully understand this :-<

What was wrong, the documentation on the websiste or my interpretation of it? 
Am I to take it the notification functions are irrelevant except when devfs 
is being used?

Adrian
