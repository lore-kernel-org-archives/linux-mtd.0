Received: from cbshost-12-155-143-237.sbcox.net ([12.155.143.237]
	helo=sb-lnx3.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Vt7Y-0003nn-Fu
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2003 14:18:32 +0100
Date: Fri, 27 Jun 2003 06:18:48 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: Vikram Mehta <vm6580@hotmail.com>
Message-ID: <20030627131848.GA3947@rinconnetworks.com>
References: <Law14-OE23bdHd2V4MT00030545@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law14-OE23bdHd2V4MT00030545@hotmail.com>
Content-Type: text/plain; charset=us-ascii
cc: mtd <linux-mtd@lists.infradead.org>
cc: "Uclinux-Dev@Uclinux.Org" <uclinux-dev@uclinux.org>
Subject: Re: JFFs2 usage questions
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 26, 2003 at 01:31:10AM -0700, Vikram Mehta wrote:
> 1.)  I cannot mkdir into the folder. I mount dev/mtdblock2 on  /mnt.
> If I do mkdir ,  the message comes
> no space left on device
I had a similar problem earlier this week and asked the list. In my case
the reason was that I didn't have enough erase blocks available for the GC
algorithm to be able to do its job. Make sure you have at least 5 erase
blocks available when you create the JFFS2 image.
 
> 2.) if I reboot the system /mnt is left as empty.
Did you verify the mount command gets executed during boot? Just add an
echo to the rc script and verify you see its output while rebooting.

Hope this helps.

Paul
 
> 3.) How can I provide that 1or 2 of my partions are readonly. That is they
> are not erased
> 
> 4.) I want that after booting, one partition is created as Jffs2. ( I can
> add the commands in rc) and I can write on it like on do on /var which is
> mounted on RAM
> 
> Regards
> Vikram
> 
> 
> 
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
