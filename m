Received: from sccmmhc91.asp.att.net ([204.127.203.211])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FhGaN-0006aK-KJ
	for linux-mtd@lists.infradead.org; Fri, 19 May 2006 21:48:58 -0400
Message-ID: <446E7581.2040501@mchsi.com>
Date: Fri, 19 May 2006 20:48:49 -0500
From: Joe Robertson <jmrobert5@mchsi.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <051920061605.8551.446DECB60001E21100002167219792676103010CD2079C080C03BFCA9B9D0A0D019D0306@mchsi.com>
	<1148071495.2566.3.camel@shinybook.infradead.org>
In-Reply-To: <1148071495.2566.3.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Need a working gub_firmware.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, DINFO 5.1.4 reports them as NFTL.

However I notice that DINFO 5.1.4 reports the TrueFFS as 5.1.4, BUT 
using DINFO 5.1.2 on THE SAME CHIP reports TrueFFS as 5.1.2!?
So the diagnostic tool may be wrong. Could be part of my problem.

I am going to go thru the grub-0.92 patch thouroghly sometime this 
weekend.  If anyone has any specs or docs they can share with me on the 
2202(or 2200) series (Msys 5.1.x tools), I would appreciate it.  I've 
got to understand my build chain and find out what works.  I know lots 
of stuff that doesn't work.

I need Grub because we use the serial/console choice, boot menus and a 
few other features.  This all worked once upon a time, but we've updated 
compilers and tools and other parts.  Grub 0.92 won't even compile under 
gcc 3.3.x.  I need to fix all this.

Also what is the difference between the code in patches/ for grub-0.92 
and the code in the grub/ folder???

Thanks, and have good weekend.

Joe
jmrobert5[at]mchsi.com


David Woodhouse wrote:
> On Fri, 2006-05-19 at 16:05 +0000, jmrobert5@mchsi.com wrote:
> 
>>Shouldn't a MSys 5.1.4 tools work with 2202 chips?  Which one writes the NFTL
>>Header?  It seems like my grub_firmware can't read the header. 
> 
> 
> Are the 2202 chips not the new ones which use INFTL?
> 
