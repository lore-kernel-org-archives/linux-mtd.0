Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DTKX-0008Hz-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2001 16:58:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <993224949.73422@email.aftek.com> 
References: <993224949.73422@email.aftek.com> 
To: ashwinp@aftek.com
Cc: Vipin Malik <vipin.malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: Re: Is my flash being detected? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 22 Jun 2001 17:04:10 +0100
Message-ID: <25291.993225850@redhat.com>
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


ashwinp@aftek.com said:
> 	I got the mistake the fucntion check_cmd_set in cfi_probe.c assigns
> the probe function using inter_module_get_request .Since my kernel
> does not have module support the function returns null.For the time
> being I have assigned the address of the function cfi_cmdset_0002 to
> probe

Fixed in CVS. If the command set code is built-in, it get called directly. 
The inter_module_xxx crap in 2.4 is, well, crap. :)


ashwinp@aftek.com said:
> unable to handle kernel paging request at virtual address 8f80000
> I think I know the reason this may be the readb from _memcpy_form_io
> may be trying to read from a wrong addres as the readb reads form
> PCMCIA_IO and I think I know the way to fix this .

Is the flash paged - allowing the CPU to see only a 0x80000-byte region at 
a time? There are examples (octagon-5066.c) of how to deal with this.

> 	I can't use the latest kernel so I am  forced to used the mtd on a
> older kernel. 

The code in CVS should work on older kernels. Please use it.

--
dwmw2
