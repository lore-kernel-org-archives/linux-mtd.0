Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196ltc-0008Jw-0i
	for <linux-mtd@lists.infradead.org>; Sat, 19 Apr 2003 07:32:20 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDK00CALVH8PT@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Sat, 19 Apr 2003 08:31:57 +0200 (MEST)
Date: Sat, 19 Apr 2003 09:31:45 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <007e01c3062a$21cfde90$525deecb@noshel>
To: "Edward Lee (???)" <noshel@idis.co.kr>
Message-id: <200304190931.45258.tglx@linutronix.de>
MIME-version: 1.0
References: <002901c3021b$546a6fe0$525deecb@noshel>
	<007e01c3062a$21cfde90$525deecb@noshel>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: A question on ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 April 2003 06:14, Edward Lee (???) wrote:
> > That means, YAFFS supplies always a pointer to yaffs_oobinfo structure. 
> > Do the "I'ts not recommended ...." messages follow up the above message,
> > or 
 show they up elsewhere ? That means, are they really related to
> > accessing the YAFFS partitions ? Please provide a short debug output,
> > where I can see the context of those "It's not recommended ..." messages.
>
> 
> I'm currently not in the proper environment to send you the debug msgs, 
> but I can tell you that the 'It's not recommended...' stuff came out just
> 'before'
 the YAFFS msgs did. A bunch of 'It's not recommended...', and
> then another bunch of 'Real Chunk..'.
> I send you the output next monday, I'll have to newly setup a few things
> before 
 trying it again.

Add "rootfs=yaffs" to your commandline. 

The kernel tries various filesystems before it hits yaffs

> The first partition contains the state of the whole device, 
> the second and third has the kernel image, (the first three partitions are
> stored as raw binary)
 and the forth and fifth is used as YAFFS.

OK, but you don't access them from Linux ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
