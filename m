Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JGv72-0002hU-Op
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 11:46:55 +0000
Date: Mon, 21 Jan 2008 12:45:56 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: llandre <r&d2@dave-tech.it>
Subject: Re: Micron NAND support in linux MTD
In-Reply-To: <47948035.8040903@dave-tech.it>
Message-ID: <Pine.LNX.4.64.0801211244120.25733@lnxricardw.se.axis.com>
References: <47907CDF.30802@dave-tech.it>
	<8bf247760801180745k6f8337d5p751d91b21bd3728d@mail.gmail.com>
	<47946B2A.1030400@dave-tech.it>
	<Pine.LNX.4.64.0801211105440.25733@lnxricardw.se.axis.com>
	<47948035.8040903@dave-tech.it>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: Ram <vshrirama@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 21 Jan 2008, llandre wrote:

>> The option of programming the second page is probably a last resort in case 
>> the first page is so bad that it cannot be programmed at all, which I would 
>> think is most unlikely.
>
> I think your point is reasonable. I'd like to hear someone from Samsung or 
> Micron to confirm your speculation ...

Me too but I think they'd just refer you to the data sheet. I haven't been 
able to get any form of statistics from chip manufacturers like the number 
of bad blocks when the chip is new, or other things that aren't stated in 
the data sheets.

/Ricard
