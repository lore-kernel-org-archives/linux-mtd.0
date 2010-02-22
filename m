Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjhR5-00070S-DL
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 23:11:35 +0000
Received: by fxm6 with SMTP id 6so5373716fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 15:11:28 -0800 (PST)
Subject: Re: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <597490.7198.qm@web37607.mail.mud.yahoo.com>
References: <597490.7198.qm@web37607.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Feb 2010 01:11:23 +0200
Message-ID: <1266880283.32669.8.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-22 at 06:04 -0800, Alex Dubov wrote: 
> > 
> > Alex, could you explain how a single TPC is performed?
> > 
> > I currently first send MS_TPC_SET_RW_REG_ADRS, and then
> > MS_TPC_READ_REG
> > 
> > When I send the TPC I specify both the tpc number and its
> > len. Is the
> > len transmitted?
> 
> Of course, it is. How otherwise media would know how many bits to sample
> in?
By watching the #BS?
Every clock cycle media reads 1 or 4 bits, when #BS goes low it stops
reading...
Why otherwise one would need the #BS line?


Thanks for explanation.




> 
> > 
> > I see that if I set addr.r_length != MS_TPC_READ_REG len, I
> > get errors
> > in reg #16, but different errors depending if i set it
> > lower or higher.
> 
> This is an undefined behavior. You're confusing the state machine on the
> media side. By the way, left over bytes from the incorrectly ordered
> or formatted TPC can spill into block data buffer (this will cause an
> apparent data corruption - I've seen this happen).
I know that it is undefined, but I try to understand the meaning of
status flags, thats why I try it. Now it is much clearer to me.

Just one more question, when the host say reads the data buffer (512
bytes), it does so in one run, or it reads it in packets, or it reads it
in 8 byte packets, then  waits for some condition (#SDIO maybe)?

> 
> > 
> > Currently I think that a level change on the #SDIO is the
> > signal for
> > host to start reading, but who sets the #BS to high? Host
> > or card.
> 
> BS line is always mastered by host.
Thanks for explanation.

> 
> > 
> > Does card signal end of transmission?
> > 
> 
> Yes, on a data line (there's CRC as well, which must be handled by the host
> transparently).
I have seen on some datasheet that crc is involved. It is handled
transparently.


> 
> > Also it seems that if I write to 'param' register, I can't
> > read it back
> > (maybe I do something wrong). Is this register write only?
> > 
> 
> There are no write only registers in the MS spec. Moreover, you need to 
> read the param register if you're doing multi-page transfer (page address
> will be updated during the transfer to point to the last accessed page).
Very interesting, probably I do that wrong then.


Thanks a lot,
Best regards,
Maxim Levitsky
