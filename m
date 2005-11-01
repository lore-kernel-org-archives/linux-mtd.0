Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWy3L-0003kP-7J
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2005 10:28:03 -0500
Message-ID: <436789E3.6010706@ru.mvista.com>
Date: Tue, 01 Nov 2005 18:29:39 +0300
From: Sergei Shtylylov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Leif Lindholm <leif.lindholm@i3micro.com>, linux-mtd@lists.infradead.org
References: <4363DF17.6080906@ru.mvista.com>	
	<1130745519.12171.93.camel@localhost.localdomain>	
	<1130769581.6003.43.camel@localhost>	
	<1130774403.12171.111.camel@localhost.localdomain>
	<1130856543.16267.38.camel@localhost>
In-Reply-To: <1130856543.16267.38.camel@localhost>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] NAND: Fix NAND ECC errors on AMD Au1550
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Leif Lindholm wrote:

> On Mon, 2005-10-31 at 08:00 -0800, Pete Popov wrote:
> 
>>>Just a comment (forgot to post this last time around):
>>>At least one of the chips we're using - identified as
>>>"NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V 8-bit)"
>>>seems to also need the CS manually asserted during a READID operation.
>>>
>>>This made the if-statements ridicilously long, so I added a case
>>>statement and a variable keeping track of wether or not to force-enable
>>>CS to the au1550_command function.
>>>
>>>If there is any interest, I could post a patch, but am unsure of the
>>>correct way. Should I send a new patch against cvs HEAD containing my
>>>trivial tweak as well as Sergeis modifications, or...?
>>
>>Send an incremental patch on top of Sergey's patch if you can.
> 
> 
> Attached is an incremental patch on top of Sergeys latest patch
> (yesterday). Is that's ok, or should I do the same for the old one?

    Alas, I have to NAK your patch.

> ------------------------------------------------------------------------
> 
> --- mtd/drivers/mtd/nand/au1550nd.c	2005-10-31 18:37:29.000000000 +0100
> +++ mtd-new/drivers/mtd/nand/au1550nd.c	2005-11-01 15:39:43.000000000 +0100
> @@ -343,6 +343,16 @@ static void au1550_command(struct mtd_in
>  	int ce_override = 0, i;
>  	ulong flags;
>  
> +	/* Decide wether command needs to force-enable CE or not */
> +	switch (command) {
> +	case NAND_CMD_READ0:
> +	case NAND_CMD_READ1:
> +	case NAND_CMD_READOOB:
> +	case NAND_CMD_READID:
> +		ce_override = 1;
> +		break;
> +	}
> +
>  	/* Begin command latch cycle */
>  	this->hwcontrol(mtd, NAND_CTL_SETCLE);
>  	/*
> @@ -382,9 +392,7 @@ static void au1550_command(struct mtd_in
>  		if (page_addr != -1) {
>  			this->write_byte(mtd, (u8)(page_addr & 0xff));
>  
> -			if (command == NAND_CMD_READ0 ||
> -			    command == NAND_CMD_READ1 ||
> -			    command == NAND_CMD_READOOB) {
> +			if (ce_override) {

    Note, that with NAND_CMD_READID page_addr of -1 is always passed (so we 
only write out the 1-byte column address) on the address phase, and we just 
won't get there for READID command....

>  				/*
>  				 * NAND controller will release -CE after
>  				 * the last address byte is written, so we'll
> @@ -393,7 +401,6 @@ static void au1550_command(struct mtd_in
>  				 * want the NOR flash or PCMCIA drivers to
>  				 * steal our precious bytes of data...
>  				 */
> -				ce_override = 1;
>  				local_irq_save(flags);

    Therefore, neither -CE wil be overridden nor local_irq_save() be executed 
for READID case...

>  				this->hwcontrol(mtd, NAND_CTL_SETNCE);
>  			}
> @@ -412,25 +419,7 @@ static void au1550_command(struct mtd_in
>  	 * Program and erase have their own busy handlers.
>  	 * Status and sequential in need no delay.
>  	 */
> -	switch (command) {
> -
> -	case NAND_CMD_PAGEPROG:
> -	case NAND_CMD_ERASE1:
> -	case NAND_CMD_ERASE2:
> -	case NAND_CMD_SEQIN:
> -	case NAND_CMD_STATUS:
> -		return;
> -
> -	case NAND_CMD_RESET:
> -		break;
> -
> -	case NAND_CMD_READ0:
> -	case NAND_CMD_READ1:
> -	case NAND_CMD_READOOB:
> -		/* Check if we're really driving -CE low (just in case) */
> -		if (unlikely(!ce_override))
> -			break;
> -
> +	if (ce_override) {
>  		/* Apply a short delay always to ensure that we do wait tWB. */
>  		ndelay(100);
>  		/* Wait for a chip to become ready... */
> @@ -442,6 +431,19 @@ static void au1550_command(struct mtd_in
>  		local_irq_restore(flags);

    ... and later you get the CPU flags corrupted.

>  		return;
>  	}
> +
> +	switch (command) {
> +
> +	case NAND_CMD_PAGEPROG:
> +	case NAND_CMD_ERASE1:
> +	case NAND_CMD_ERASE2:
> +	case NAND_CMD_SEQIN:
> +	case NAND_CMD_STATUS:
> +		return;
> +		
> +	case NAND_CMD_RESET:
> +		break;
> +	}
>  	/* Apply this short delay always to ensure that we do wait tWB. */
>  	ndelay(100);

    Has your READID problem arisen with or without my patch?

WBR, Sergei
