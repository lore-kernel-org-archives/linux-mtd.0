Received: from www12.mailshell.com ([209.157.66.248] helo=mailshell.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AeQsH-0007S4-5T
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 03:30:21 +0000
Message-ID: <20040108032812.17511.qmail@mailshell.com>
In-Reply-To: <002901c3d593$fa1fc240$6e01a8c0@solarwave>
References: <002901c3d593$fa1fc240$6e01a8c0@solarwave>
Content-Type: text/plain
Mime-Version: 1.0
Date: Thu, 08 Jan 2004 11:28:25 +0000
Content-Transfer-Encoding: 7bit
From: daniel@dmhome.net
To: linux-mtd@lists.infradead.org
Subject: Re: Changing parameters on the fly - possible?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, 

The docprobe module has a parameter doc_config_location, you can try
that one. 
I have to say though , that in my experience, autoprobing on x86 ISA
busses has always worked for me on numerous boards.
 
Greetings, 
Daniel 

On Thu, 2004-01-08 at 03:03, Mark Richards wrote:
> Greetings.
> 
> I am so grateful for the MTD drivers for Linux. I've had some problems
> getting them established in a Mandrake 9.2 environment, but finally got a
> successful kernel build completed under the 2.4.22-21mdk kernel version.
> That's a few builds later than I had originally planned.  I found out, the
> hard way, that Mandrake has a special kernel build that mates with their
> desktop, etc.  I also had problems loading the drivers as modules using
> insmod, so resorted to the custom kernel route.
> 
> My problem is that the build I did is not finding the DOC chip.  I get the
> following from dmesg:
> 
> Using configured disk on chip address 0xd400
> No recognized DskOnChip devices found.
> 
> However using the dInfo utility I can see the chip OK.
> 
> I was a bit over-zealous, and set the probe address manually in xconfig
> before building the kernel.  Maybe this is my problem?  Is there any way to
> change the behaviour of the drivers for the DOC 2000 such that, for example,
> I can remove the fixed probe address, or change other parameters. or do I
> have to build all over again?
> 
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://rd.mailshell.com/lists.infradead.org/mailman/listinfo/linux-mtd/
