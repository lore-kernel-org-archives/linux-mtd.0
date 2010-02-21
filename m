Received: from mail-fx0-f217.google.com ([209.85.220.217])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjKVi-000525-LG
	for linux-mtd@lists.infradead.org; Sun, 21 Feb 2010 22:42:51 +0000
Received: by fxm9 with SMTP id 9so2017310fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 Feb 2010 14:42:43 -0800 (PST)
Subject: Re: Legacy memstick support + FTL questions
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <1266449977.4185.0.camel@maxim-laptop>
References: <849744.7095.qm@web37607.mail.mud.yahoo.com>
	<1266449977.4185.0.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Feb 2010 00:42:39 +0200
Message-ID: <1266792159.3445.9.camel@maxim-laptop>
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

On Thu, 2010-02-18 at 01:39 +0200, Maxim Levitsky wrote: 
> On Tue, 2010-02-16 at 18:26 -0800, Alex Dubov wrote: 
> > > I  mean when controller reads the 'int status' it does
> > > send a TPC?
> > > (I am sure that it does)
> > > 
> > > However mine can't do that and int status is read normally
> > > (yay...)
> > > 
> > 
> > There are two things to know:
> > 1. In serial mode, some controllers issue GET_INT TPC automatically
> > after each command, but only if certain configuration bit is set.
> > 
> > 2. In parallel mode, the meaningful bits of the interrupt register
> > are exposed on the DIO pins of the media at the end of command execution
> > and can be latched by the controller (this is a suggested behavior).
> > 
> > If you want to write a generic legacy MS support, you must take into
> > account that this behavior is not there for granted.
> > 
> 
> Thank you very very much.
> This clears this issue for good.
In fact I found out that these 'meaningful bits of the interrupt
register' are indeed exposed as a part of reg #16, but at different
place.

Alex, could you explain how a single TPC is performed?

I currently first send MS_TPC_SET_RW_REG_ADRS, and then MS_TPC_READ_REG

When I send the TPC I specify both the tpc number and its len. Is the
len transmitted?

I see that if I set addr.r_length != MS_TPC_READ_REG len, I get errors
in reg #16, but different errors depending if i set it lower or higher.

Currently I think that a level change on the #SDIO is the signal for
host to start reading, but who sets the #BS to high? Host or card.

Does card signal end of transmission?

Also it seems that if I write to 'param' register, I can't read it back
(maybe I do something wrong). Is this register write only?

Best regards,
Maxim Levitsky
