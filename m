Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGwoZ-0007U4-UA
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2004 10:17:43 +0100
From: tglx@linutronix.de (Thomas Gleixner)
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>,
 linux-mtd@lists.infradead.org
Date: Fri, 23 Apr 2004 11:12:54 +0200
References: <01139FC052A0D411900B00508B9535FC13AC4057@ZCH07EXM04.corp.mot.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC13AC4057@ZCH07EXM04.corp.mot.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200404231112.54873.tglx@linutronix.de>
Subject: Re: Write function for 16 bit NAND Flash
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 23 April 2004 05:43, Shen Aaron-r62966 wrote:
> Hi,
>
>   I'm investigating to write boot code into an empty 16 bit NAND Flash. I
> met some problem, and if you have some experience, please be kindly to
> share with me.
>
>   The current write program is for 8 bit NAND Flash(Samsung K9F5608Q0C) and
> is loaded by AXD. The flash is 32 page per block and 528(512+16) byte per
> page.  I use int type pointer to copy the boot data into the main area
> buffer of the flash. It's successful as I read back the data from the flash
> to verify.

int type pointer ? Surprise, surprise. Is the buswitdh set to 32 bit ?

>   As the 16 bit NAND Flash(Samsung K9F5616Q0C) is also 32 page per block
> but 264(256+8) word per page, I try to use short int type pointer to copy.
> The data has truly been copied into the main area buffer of the flash. But
> after I read back it from the flash, it seems to be all 0xFFFF. Seems the
> data are not writen into the flash at all.

Hmm. How do you apply the commands to the chip ?

-- 
Thomas
________________________________________________________________________
"Free software" is a matter of liberty, not price. To understand the concept,
you should think of "free" as in "free speech,'' not as in "free beer".
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
