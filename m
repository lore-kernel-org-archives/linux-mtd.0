Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15H62b-0000dB-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 16:55:13 +0100
Date: Mon, 2 Jul 2001 12:00:12 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Vipin Malik <vipin.malik@daniel.com>, jffs-dev <jffs-dev@axis.com>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Problems with JFFS2/MTD upgrade to latest in CVS. 
In-Reply-To: <29076.994062929@redhat.com>
Message-ID: <Pine.LNX.4.33.0107021159150.11480-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Mon, 2 Jul 2001, David Woodhouse wrote:

>
> vipin.malik@daniel.com said:
> > > > jffs2_scan_empty(): Empty block at 0x00000000 ends at 0x00000000 (with 0x00031985)! Marking dirty
>
> > > Does reverting to an older version of scan.c fix this?
> > >         cvs up -r 1.46 scan.c
>
> > Yes!
>
> Nicolas - should I just revert to 1.46? Is there anything in 1.48 you'd
> like to (fix and) keep?

Well... What's the problem already?  I fear I didn't follow the conversation
closely enough lately.



Nicolas
