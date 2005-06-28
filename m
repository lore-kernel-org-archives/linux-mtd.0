Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DnLVb-0000fQ-8Z
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 15:12:36 -0400
Message-ID: <42C1A11A.2020108@ieee.org>
Date: Tue, 28 Jun 2005 15:12:26 -0400
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Brian O'Dell <brian@clarionsensing.com>
References: <42C03FFB.3080208@clarionsensing.com> <42C04A65.5040804@ieee.org>
	<42C180D4.1010607@clarionsensing.com>
In-Reply-To: <42C180D4.1010607@clarionsensing.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot doesn't compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian O'Dell wrote:

> Thank you for the quick response Dan.  DOCBoot does compile now, but 
> it freezes prior to any indication that it is trying to load the 
> kernel.  Here is what I get with DEBUG_BUILD defined:
> Installing DOCBoot.
> doc_seg = 0xE000           setup_seg = 0x2400
> int15/e801 returns 0x0F00    initrd_start = 0x0FFF0000
> top of low mem = 0x0279k    handler seg = 0x9E00
> -- Press any key --
>
> Prior to pressing any key, numlock and capslock respond normally.  I 
> can also reboot via ctrl-alt-del.  I press enter, then the system 
> freezes hard.  No numlock or capslock response, ctrl-alt-del does not 
> work.  Any thoughts or ideas are much appreciated.


Hmm.  Well, nothing appears odd in the debug messages.  Your DOC is at 
E000, you have 256Mbytes of RAM, you have 633k free low memory, etc.  
Let me get some more info from you:

- what type/size of DOC you're using
- size of your kernel and initrd
- what options you use when building DOCBoot (which interrupt, for 
instance).
- what other devices are in the system (video, harddrives, etc)

Hopefully you're able to boot your system normally (DOCBoot install will 
be skipped if you hold down shift, alt, or control at the appropriate 
phase of BIOS boot).

    -Dan
