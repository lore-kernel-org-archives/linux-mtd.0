Received: from mail.eink.com ([160.79.204.3] helo=webmail2.eink.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19f3p3-0005MR-Hx
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 21:33:21 +0100
Message-ID: <3F1D9FDC.8070403@eink.com>
Date: Tue, 22 Jul 2003 16:34:36 -0400
From: Holly Gates <hgates@eink.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3F1D98F4.8060904@eink.com>
	<1058905076.32360.45.camel@lapdancer.baythorne.internal>
In-Reply-To: <1058905076.32360.45.camel@lapdancer.baythorne.internal>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Smartmedia block mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



David Woodhouse wrote:

>On Tue, 2003-07-22 at 16:05, Holly Gates wrote:
>
>>Maybe I could see using the mapping table if it was on the card 
>>somewhere,
>>
>
>It is. It's in the 'out of band' area of the data blocks I believe --
>see the SmartMedia specs for details.
>
Right, I sort of got a bit of that by reading docs at samsung's website. 
It seems like the logical block number is stored in the out of band area 
of the physical block. But it seems to me that if this was the only 
place it was stored, then when you plug in the card, the card reader 
would have to read the out of band area for all the blocks on the card 
and make a table in RAM. At least on my card reader, it is only a little 
ASIC on the board. I would be surprised to find a few hundred K of RAM 
on that ASIC, which is what you might want for a table on the larger cards.

By the way, any idea where to get the SM spec? I can't seem to find it 
anywhere that I don't need to sign and NDA or pay hundreds of dollars 
for it.

>> but ideally I could just write the binary file to the sectors 
>>in true, physical, incrementing order. Anyone know of a utility I could 
>>use to do this?
>>
>
>You need special hardware which gives you access to the raw flash
>without doing the translation _for_ you. Most 'card readers' will do it
>for you and hence you don't get this option.
>
Hmm. OK. Thats too bad.

>>I suppose I could build a parallel port adapter and write some software 
>>or something, but that is annoying since I know the computer is capable 
>>of doing what I want if I could get at the right layer of the driver 
>>stack...
>>
>
>No, it's not. Your USB card reader doesn't let you have access to the
>raw flash; it has the translation built-in. 
>
>Either implement the full SMTL in your FPGA, or make sure you use
>hardware which accesses the flash directly, when writing to the device.
>
Dang! Oh well, thanks for the advice. I'll get out the soldering iron I 
guess...

-Holly
