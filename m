Received: from 12-234-34-139.client.attbi.com ([12.234.34.139]
	helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1988P6-0001Bk-Fd
	for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2003 01:46:28 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: <dduval@oerlikon.ca>, <linux-mtd@lists.infradead.org>
Date: Tue, 22 Apr 2003 17:46:30 -0700
Message-ID: <007b01c30931$c816a2c0$675f040f@bergamot>
MIME-Version: 1.0
In-Reply-To: <MAIL7EjQxzmWecm9t0C000000d9@mail.oerlikon.ca>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: RE: Unlocking Intel K3 StrataFlash at boot time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I use the following:

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=1040/1

However, if you search the archives, you'll find discussions of better
solutions (which haven't been implemented yet).

-ch


> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Dominic Duval
> Sent: Tuesday, April 22, 2003 5:31 PM
> To: linux-mtd@lists.infradead.org
> Subject: Unlocking Intel K3 StrataFlash at boot time
> 
> 
> Hi,
> 
> I'm currently trying to boot from a XScale board which has some Intel
> StrataFlash banks (K3). However, it appears that the K3 flash 
> in locked by
> default, so I'm getting some errors when the root partition 
> is mounted by
> the Kernel in read/write mode.
> 
> I figured the only way to work around this problem is to unlock the K3
> Flash before the Kernel mounts the root partition. Since our 
> own bootloader
> doesn't support the K3 Flash, the only place left is right in 
> the Kernel,
> probably just before the MTD device gets mounted.
> 
> I'd therefore like to know if this has been done before. If 
> it has not, am
> I on the right track here? And is there a place in the mtd 
> code which would
> be particularly well suited for placing the unlocking stuff? 
> 
> I'm no expert in MTD Flash devices, so your advice will be 
> appreciated.
> 
> Cheers,
> 
> 		-Dominic
> 
> -- 
> Dominic Duval
> dduval@oerlikon.ca
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
