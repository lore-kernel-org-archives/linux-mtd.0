Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 194KFs-0006b4-Nc
	for <linux-mtd@lists.infradead.org>; Sat, 12 Apr 2003 13:37:13 +0100
Date: Sat, 12 Apr 2003 14:37:14 +0200 (CEST)
From: Henrik Nordstrom <hno@marasystems.com>
To: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <5.1.1.5.2.20030411131136.0190b008@mail.arc.nasa.gov>
Message-ID: <Pine.LNX.4.44.0304121431070.9036-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: Newbie questions: MTD vs M-Sys, ... RTLinuxPro
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 11 Apr 2003, Edward A. Hildum wrote:

>          I'm also having problems with the 256MB DoC2000 with TrueFFS 
> 5.1.4.  I've built a recent kernel (2.4.18) with MTD.  When it starts, the 
> DoC is recognized as a DoC Millenium, and the driver says the flash chips 
> are not recognized.  I am trying now to get information about the flash 
> chips from M-Systems.  If I get this, it should be easy to update the table 
> of known flash chips so MTD can access the new DoC.
>          I'm also working on booting from the DoC using GRUB, but I am 
> having trouble getting information from M-Systems.  If I find a solution, I 
> will post it to this list.

What we currently do (pending the time to investigate having a fully
native GPL solution investigated) is to have the DOC formatted with the
M-Sys firmware, and then install GRUB on the block device offered by the
M-Sys firmware. Works great. If you use DFORMAT 4.x then using the MTD
Linux drivers should have no problem accessing the NFTL partition.

By not using the native GRUB DoC firmware you loose a hundred KB of flash
for the M-Sys firmware and a little boot time only.. not a big deal in my 
opinion.

Regards
Henrik
