Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14w3kc-0004QV-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 16:13:43 +0100
Date: Sat, 5 May 2001 11:13:57 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Alice Hennessy <ahennessy@mvista.com>, "Fry, Dan" <dfry@bb.directv.com>,
        <linux-mtd@lists.infradead.org>
Subject: Re: Improper Command Sequence 
In-Reply-To: <2053.989061087@redhat.com>
Message-ID: <Pine.LNX.4.33.0105051113080.15370-100000@xanadu.home>
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


On Sat, 5 May 2001, David Woodhouse wrote:

>
> ahennessy@mvista.com said:
> > > Chip reports improper command sequence: status 0xa800a8
>
> > a800a8 looks like the error status for low programming voltage detected -
> > you need to add some code to handle set_vpp (and unset_vpp) for your board.
>
> Bah. And I need to fix the blinkin' error reporting so it prints the
> correct message.
>
> -		if (chipstatus & 0x30) {
> +		if ((chipstatus & 0x30) == 0x30) {
>  			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%x\n", status);

... and don't forget possible chip interleaves.


Nicolas
