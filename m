From: David Woodhouse <dwmw2@infradead.org>
To: Mike Wellington <wellington@lucent.com>
In-Reply-To: <405998A2.3060107@lucent.com>
References: <405998A2.3060107@lucent.com>
Content-Type: text/plain
Message-Id: <1079619066.16952.134.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 18 Mar 2004 14:11:07 +0000
Content-Transfer-Encoding: 7bit
cc: Mike Wellington Failsafe Account <platform@whirlwind.he.net>
cc: linux-mtd@lists.infradead.org
Subject: Re: Strataflash  standard and  LinearFlash vs ATA Flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-18 at 05:40 -0700, Mike Wellington wrote:
>    I am new to Flash memory.  I have just ported
> linux to the PPC405.   Here is my question:
> 
> Our final hw will have Intel Strataflash.  Our
> development board does not have any flash.  We
> would like to write flash drivers for the Intel
> Strataflash family on the development board.
> I think this can be done by purchasing a PCMCIA
> Linear Flash card.  You can get 20MB for $110. 
> However ATA flash seems to be larger and cheaper:
> 160MB for $80.
> 
> If I want to talk to the memory using the same
> Strataflash interface that I will have to use
> on the final hw, do I have to buy a linear
> flash, or can I just buy an ATA flash?

ATA flash is, as far as you're concerned, a real hard drive. You might
think it has flash inside; we couldn't possibly comment.

If having a real hard drive is suitable for your prototyping purposes,
then that's fine. If you want to use a real flash file system and test
how that's going to work for you in practice, then probably not.

In fact there's more work to do to get PCMCIA linear flash working than
there is to make hardwired flash work. Hardwired flash should be
trivial, while the PCMCIA linear flash driver is fairly new and unloved.
Shouldn't be that hard to use it though.

-- 
dwmw2
