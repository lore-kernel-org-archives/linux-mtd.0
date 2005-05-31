Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dd95A-0006zG-JA
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 11:55:13 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j4VFt6aj032723
	for <linux-mtd@lists.infradead.org>; Tue, 31 May 2005 11:55:06 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j4VFt6eQ152882
	for <linux-mtd@lists.infradead.org>; Tue, 31 May 2005 11:55:06 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j4VFt59m026106
	for <linux-mtd@lists.infradead.org>; Tue, 31 May 2005 11:55:06 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1117554669.12591.284.camel@hades.cambridge.redhat.com>
References: <429C5347.1080208@anagramm.de>
	<1117542307.14566.79.camel@tglx.tec.linutronix.de>
	<1117554669.12591.284.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Tue, 31 May 2005 10:55:33 -0500
Message-Id: <1117554933.4821.2.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, Clemens Koller <clemens.koller@anagramm.de>,
	linux-mtd@lists.infradead.org
Subject: Re: Oops on rmmod mtdblock module while in dev dir.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-31 at 16:51 +0100, David Woodhouse wrote:
> On Tue, 2005-05-31 at 14:25 +0200, Thomas Gleixner wrote:
> > Thats not a problem of mtd. Its a problem of sysfs/devfs
> 
> IIRC it's because we register more than one gendisk with the same major.

It's even more complicated when working with partitions.  A MTD
partition is actually a whole new device to MTD, whereas a partition in
general block terms is just a subset of a particular device.  Things in
this area need some help.

josh
