Received: from mail1.danielind.com ([12.19.96.6])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16QxSr-00074B-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 21:19:21 +0000
Message-ID: <3C45EE36.4477E99A@daniel.com>
Date: Wed, 16 Jan 2002 15:18:46 -0600
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: Herman Oosthuysen <Herman@WirelessNetworksInc.com>
CC: Cam Mayor <cmayor@iders.ca>,
 	linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: open question on flash speed/app blocking
References: <02011512182209.16722@kilauea.iders.ca> <000e01c19ec6$b2cd5980$0100007f@localdomain.wni.com.wirelessnetworksinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

http://www.embeddedlinuxworks.com/articles/jffs_guide.html

then

http://www.embeddedlinuxworks.com/articles/db_project.html

I've also done quite a bit of blocking time tests on JFFS2 (about 6-8 months
ago). See the (JFFS) list archives for details and graphs etc.

Vipin


Herman Oosthuysen wrote:

> Hmm, the problem is not writing to flash per se, but rather garbage
> collection, which requires the erase of dirty Flash sectors.  Erasing a
> sector on an Intel chip can take from a couple hundred milliseconds to about
> 15 seconds, depending on the age of the device - by the time a chip gets to
> 15 seconds, I usually toss them away.  Flash chips tend to get slower with
> age.  So, you have to repeat your tests a few hundred thousand times before
> you can draw any real conclusions.  This also means that the worst case
> performance will be about the same, irrespective of the file system used,
> since the hardware constraints will eventually dominate.
>
> If your system has to write to flash every few seconds, then consider using
> a file system that has a large write cache, to enable you to survive the
> periods when the system is busy erasing a sector.
> --
> Herman Oosthuysen
> Herman@WirelessNetworksInc.com
> Suite 300, #3016, 5th Ave NE,
> Calgary, Alberta, T2A 6K4, Canada
> Phone: (403) 569-5688, Fax: (403) 235-3965
> ----- Original Message -----
> From: Cam Mayor <cmayor@iders.ca>
> To: linux MTD mailing list <linux-mtd@lists.infradead.org>
> Sent: Tuesday, January 15, 2002 11:18 AM
> Subject: open question on flash speed/app blocking
>
> Hi all,
>
> We're making an app that periodically writes a persistance file to flash.  I
> haven't actually gotten a flash file system area working yet on my board, so
> i can't test this yet for speed.   I know that the results will vary with
> the
> hardware, the filesystem used, and a handful of other factors.  I'm assuming
> that a write to the flash will be blocking - that is, nothing else will be
> allowed to happen on the bus while that function is being performed.
>
> For a file the size of 32bytes, 1kByte, and 32kBtyes, what kind of blocking
> delay might one expect from linux writing to flash for each of those file
> sizes?  What would be an optimum flash filesystem to use for something like
> this?  (if there is one)
>
> cheers,
> cam
>
> ps. i'm using linux 2.4.6-rmk1-rayl1 and 2.4.16-rmk2.  I could use the
> latest
> kernel, too, i just haven't gotten around to it.  For development purposes,
> i'm using a cirrus CDB89712 development board, which has the cs89712
> processor and some Intel 28f320B3 flash on it.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
