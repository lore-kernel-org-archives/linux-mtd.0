Received: from mail.rdsor.ro ([193.231.238.10])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CI0u0-0003jk-Gr
	for linux-mtd@lists.infradead.org; Thu, 14 Oct 2004 04:24:04 -0400
From: Balint Cristian <rezso@rdsor.ro>
To: tglx@linutronix.de
Date: Thu, 14 Oct 2004 11:23:56 +0300
References: <200410141027.44044.rezso@rdsor.ro>
	<1097740239.25287.17.camel@thomas>
In-Reply-To: <1097740239.25287.17.camel@thomas>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410141123.56753.rezso@rdsor.ro>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MD-2811-032] DoCMilPlus32 missrecognized on pxa250.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 14 October 2004 10:50, Thomas Gleixner wrote:
Hi Thomas !

 Thanks for you response,
> Please fix your mail client to use standard line breaks !

 I set my kmail to "colum warp at 78" now, hope now is ok for the 
requirements.

>
> On Thu, 2004-10-14 at 09:27, Balint Cristian wrote:
> > "Flash chip found: Manufacturer ID: 98, Chip ID: A5
> > (Toshiba: NAND 2GiB 1,8V)"
>
> The doc is configured for 16 bit access, the driver uses 8-bit access.
> That's a known issue.

 Not yet a fix for this ?
 To try hardwire chip in 8 bit mode ? What do you think ?
 I can use an unused GPIO of pxa to enable via software to control the DoC 
8/16 bit enabler pin if i want to have control over this.

>
> Search the mail-archive for a thread with the subject "[PATCH]Probing at
> 0x0"

  but, the probing issue is solved for me by hardcoding in docprobe.c to probe 
address "#elseif _arm_ 0x00000000" in docprobe.c, but of course the patch is 
a more elegant solution.

>
> The solution is proposed in the thread

I see only patch for the 0x0000000 probing issue [already hardcoded for me], 
but my problem is that it see a 2GiB instead of 32MiB, is this still becouse
you tell DoC is in 16bit and driver try 8bit access ? What that mean ?
What can i do to figure out this ?

 Please, let me clarify more a little bit.

PS
 As hardware knowleger, can tell someone if there exist another more popular 
flash device [i am somehow getting sick about DoC and M-Systems] but to be 
pin-pin compatible with this device MD-2811-032 and to work nice with mtd 
drivers ?

>
> tglx
