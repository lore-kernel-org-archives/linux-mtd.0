Received: from iliade.campus.uniroma2.it ([160.80.1.66] helo=lisa.rhpk.springfield.inwind.it)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oOkK-0001pZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Oct 2001 13:34:03 +0100
Date: Tue, 2 Oct 2001 14:36:01 +0200 (CEST)
From: Cristiano Paris <c.paris@libero.it>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: MTD newbie 
In-Reply-To: <32452.1001969371@redhat.com>
Message-ID: <Pine.LNX.4.33.0110021433460.250-100000@lisa.rhpk.springfield.inwind.it>
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

I've just finished compiling 2.4.10-ac3 and I've tried to mount the jffs2
volume as usual.

I've tried :

modprobe mtdcore
modprobe mtdram total_size=16384 erase_size=8
modprobe mtdblock
modprobe jffs2

mount -t jffs2 /task-familiar-etc /mnt

After that the system just hangs (no kernel ooops shown). David, have you
tried yourself with the mtdram fake device ?

Thanks

Cristiano

On Mon, 1 Oct 2001, David Woodhouse wrote:

>
> c.paris@libero.it said:
> >  Maybe I'm using the wrong version of Linux or a more recent snapshot
> > would sove the problem.
>
> Please see if you can reproduce in 2.4.10-ac3
>
> --
> dwmw2
>
>
