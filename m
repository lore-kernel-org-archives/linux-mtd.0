Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHc7e-0001g4-OD
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 15:37:15 +0000
Message-ID: <514734A8.7070905@parrot.com>
Date: Mon, 18 Mar 2013 16:37:12 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
References: <1362904877-20144-1-git-send-email-computersforpeace@gmail.com>
 <87mwu114xn.fsf@dell.be.48ers.dk>
In-Reply-To: <87mwu114xn.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Korsgaard a écrit :
>>>>>> "B" == Brian Norris <computersforpeace@gmail.com> writes:
> 
> Hi,
> 
>  B> This patch provides support for the new stateless command set, so that
>  B> we can avoid the problems that come with a stateful addressing mode
>  B> change. The flash can be left in "3-byte mode" while still accessing the
>  B> entire flash.
> 
> Patch looks good (besides the build issue ;)
> 
>  B> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
>  B> index e80db9e..5ff14ee 100644
>  B> --- a/drivers/mtd/devices/m25p80.c
>  B> +++ b/drivers/mtd/devices/m25p80.c
>  B> @@ -48,6 +48,12 @@
>  B>  #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
>  B>  #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
>  
>  B> +/* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
>  B> +#define	OPCODE_NORM_READ_4B	0x13	/* Read data bytes (low frequency) */
>  B> +#define	OPCODE_FAST_READ_4B	0x0c	/* Read data bytes (high frequency) */
>  B> +#define	OPCODE_PP_4B		0x12	/* Page program (up to 256 bytes) */
>  B> +#define	OPCODE_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
> 
> FYI, looking at a Micron N25Q datasheet, they support the same 4B
> read/fast read commands, but NOT the 4B PP/SE ones - So for those you
> need the enter-4B / exit-4B dance :/
> 
Same for windbond chip.
