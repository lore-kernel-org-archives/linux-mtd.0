Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19AtWH-00034r-Iq
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 16:29:17 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HE500BD4XO9EV@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Wed, 30 Apr 2003 17:29:00 +0200 (MEST)
Date: Wed, 30 Apr 2003 18:28:17 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <Law11-F117Oc7wo95EF00013168@hotmail.com>
To: J B <mad_flasher@hotmail.com>, dwmw2@infradead.org
Message-id: <200304301828.17498.tglx@linutronix.de>
MIME-version: 1.0
References: <Law11-F117Oc7wo95EF00013168@hotmail.com>
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: moving MTD partitions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 April 2003 17:00, J B wrote:
>
> i'll have to check in our version of jffs2 to see if SIGHUP still works.
> using 2.4.18, so maybe...

SIGHUP still works, but it is hard to figure out, if gc has cleaned up 
everything. They only way for now is repeat -SIGHUP for a certain amount of 
time. Note that there is no real switch off for gc. So it will recycle clean 
blocks until you decide to stop it, so some hacking will be neccecary though.
The block shuffle stuff (partition magic) itself is no big deal. Find the 
empty ones and rotate the blocks until the empty ones are on top or bottom of 
the partition. This could be done from userspace.

> as for the special tool, i wonder if PowerQuest makes a version of
> PartitionMagic that can deal with MTD devices... ;)

I suggested a mtd-partition-magic project some minutes ago on IRC :)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
