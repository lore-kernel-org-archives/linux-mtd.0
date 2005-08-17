Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E5JfK-0005nC-PI
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2005 04:52:59 -0400
Date: Wed, 17 Aug 2005 10:52:54 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Ryan B. Lynch" <rlynch@bway.net>
Message-ID: <20050817085254.GB675@wohnheim.fh-wedel.de>
References: <43029CAF.5000509@bway.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43029CAF.5000509@bway.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: removing block2mtd devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 17 August 2005 02:10:55 +0000, Ryan B. Lynch wrote:
> 
> A while back, Jorn was kind enough to help me out with using the
> "block2mtd" driver.  He explained that once the driver has been loaded
> (either as a built-in driver or a module), it's possible to setup new
> devices with:
> 
>     echo "/dev/sda1" > /sys/module/block2mtd/parameters/block2mtd
> 
> Which gives you new mtdblock* and new mtd* devices.
> 
> So my question is:  Is it possible to stop "block2mtd" devices after
> they've been loaded?  Is there a mechanism like the sysfs one shown
> above, or do you have to remove the module, or reboot, or something like
> that?  I'm using the entire MTD subsystem, including the block2mtd
> driver, as built-in, to avoid having to screw around with initrds, so
> I'd be interested in knowing what the deal is.

Right now you have to unload the module or reboot.  This sucks, I
know.

Please keep bugging me about this.  The code should be relatively
simple, maybe a day of work.  All I need is a constant reminder to
keep the item high enough on my personal todo list.

Jörn

-- 
The competent programmer is fully aware of the strictly limited size of
his own skull; therefore he approaches the programming task in full
humility, and among other things he avoids clever tricks like the plague. 
-- Edsger W. Dijkstra
