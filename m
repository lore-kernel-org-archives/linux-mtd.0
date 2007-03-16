Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HSKkm-0000fi-QV
	for linux-mtd@lists.infradead.org; Fri, 16 Mar 2007 18:18:31 -0400
Subject: Re: [RFC] [PATCH] UBI: rewrite of sysfs.c
From: Thomas Gleixner <tglx@linutronix.de>
To: Artem.Bityutskiy@nokia.com
In-Reply-To: <45F6D46C.8030100@nokia.com>
References: <200703131610.20161.alexs@linux.vnet.ibm.com>
	<45F6D46C.8030100@nokia.com>
Content-Type: text/plain
Date: Fri, 16 Mar 2007 23:25:17 +0100
Message-Id: <1174083917.13341.310.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: ext Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-03-13 at 18:42 +0200, Artem Bityutskiy wrote:
> Alexander Schmidt wrote:
> > Hi,
> > 
> > I rewrote the sysfs interface to use struct device instead of struct
> > class_device. This implies an interface change, as sysfs files are now
> > ordered in a different manner:
> > 
> > /sys/class/ubi/ubiX/ for device files
> > /sys/class/ubi/ubiX_Y/ for volumes
> > 
> > Before we had
> > 
> > /sys/class/ubi/ubiX/ for device files
> > /sys/class/ubi/ubiX/Y/ for volumes
> > 
> > Please let me know if you got any objections on this or if you have
> > proposals for a better implementation.
> > 
> > Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
> 
> It seems we cannot preserve old sysfs structure...
> 
> It is fine with me. You and Thomas are the main users, so if it is ok
> with you - lets' apply this.

No objections. I will hack^Wscript my way around it and silently curse
at you :)

	tglx
