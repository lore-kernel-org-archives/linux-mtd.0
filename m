Received: from server.bluewater.co.nz ([203.167.251.250]
	helo=smtp.bluewaternz.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Iy3y-0001Js-4S
	for <linux-mtd@lists.infradead.org>; Thu, 22 May 2003 22:57:26 +0100
Received: from benmore.bluewaternz.com
	([192.168.2.3] helo=bluewatersys.com ident=gordon)
	by smtp.bluewaternz.com with esmtp (Exim 3.03 #1 (Debian))
	id 19Iy4I-0001Mf-00
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 09:57:46 +1200
Message-ID: <3ECD47DA.7000503@bluewatersys.com>
Date: Fri, 23 May 2003 09:57:46 +1200
From: Gordon J Milne <gordon@bluewatersys.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <1028064443.23642.52.camel@mahi190.austin.ibm.com>
	<14660.1028067926@redhat.com> <3ECB640C.5040305@bluewatersys.com>
In-Reply-To: <3ECB640C.5040305@bluewatersys.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: "Read-only file system" error while writing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > I am having exactly the same problem with the same ST part (M28W320CB).
 > I am running uClinux (based on Linux 2.4.20). I modified the
 > do_write_buffer() code to print out the status value that was read back.
 > The value is 0xffff. It seems a bit strange to me that ALL the bist
 > should be 1s.
 >
 > I have tried using "unlock" to unlock the device (/dev/mtd3) but I get
 > the same result.
 >
 > The device (1f:03) is the root device and it has been remounted rw. I
 > verified this by checking /proc/mounts - everything was rw, as expected.
 > My system successfully boots and I can execute commands. It is just the
 > filesystem writes that are not working for me.

I received an e-mail from Guillaume Gourat who pointed out to me that this 
problem has already been discussed in August 2002 and a patch was listed in 
the e-mail message.

See http://lists.infradead.org/pipermail/linux-mtd/2002-August/005579.html

I grabbed the CVS head code for MTD around January 2003 so this patch has 
clearly not made it into the mainstream source yet.

The patch works but is slightly unsightly. Basically it over-rides some of 
the information coming back from the CFI query. Is this sort of patching of 
cfp_chip_setup() common? If so, we need a standardised way of implementing 
these patches - probably a table-driven one. If not, then point patches like 
this are probably the best way to proceed on a case by case basis.

Thanks for listening.

Gordon
