Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HROuE-0003OS-Tu
	for linux-mtd@lists.infradead.org; Wed, 14 Mar 2007 08:32:27 +0000
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2E8P1Vj027380
	for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2007 04:25:01 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2E8Ow7F238046
	for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2007 04:25:00 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2E8OwK5023665
	for <linux-mtd@lists.infradead.org>; Wed, 14 Mar 2007 04:24:58 -0400
Subject: Re: [RFC] [PATCH] UBI: rewrite of sysfs.c
From: Frank Haverkamp <haver@vnet.ibm.com>
To: Artem.Bityutskiy@nokia.com
In-Reply-To: <45F6D46C.8030100@nokia.com>
References: <200703131610.20161.alexs@linux.vnet.ibm.com>
	<45F6D46C.8030100@nokia.com>
Content-Type: text/plain
Date: Wed, 14 Mar 2007 09:24:55 +0100
Message-Id: <1173860695.4114.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>,
	ext Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
Reply-To: haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

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

Josh is representing some users too. But just in case I suggest, that we
wait at least 2-3 days before we commit such interface changes, to give
yet anomymous (in the world which are not in the German/Finish/US
eastcoast timzone) users a chance to comment on this. I also discussed
with Alex that we might want to enhance our ubi-utils to support the old
and new interfaces to avoid possible trouble before we include the
changes.

Frank
