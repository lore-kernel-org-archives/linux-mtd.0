Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNDuo-0007Np-Ks
	for linux-mtd@lists.infradead.org; Mon, 10 May 2004 17:46:06 +0100
Content-Type: text/plain;
  charset="iso-8859-15"
From: Simon Haynes <simon@baydel.com>
To: tglx@linutronix.de,
 linux-mtd@lists.infradead.org
Date: Mon, 10 May 2004 17:35:47 +0100
References: <D917588A7DC5@baydel.com> <200405101732.23971.tglx@linutronix.de>
In-Reply-To: <200405101732.23971.tglx@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <D9A158B823BE@baydel.com>
Subject: Re: New NAND interface
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 10 May 2004 4:32 pm, Thomas Gleixner wrote:
> On Monday 10 May 2004 16:04, Simon Haynes wrote:
> > I explained, recently, on #mtd, that jffs2 was generating bad crc
>
> Yep. I explained this in
> http://lists.infradead.org/pipermail/linux-mtd/2004-April/009632.html
>

Sorry, I should have looked at the archives. This makes it all clear to me.

> > moment I have fixed this in my NAND driver by specifying autooob with the
> > useecc field set to 0.
>
> Sorry, I was not aware that you have a block driver for SM-FAT. Is this
> driver available anywhere ?
>

I have spoken to David about this and I am more than happy to provide the 
source to anyone. David, kindly, suggested I send the code to him and he 
would have a look before integrating it into the CVS system. I have not sent 
it to David as there are restrictions which would not make it suitable for 
all. I had planned to remove these and tidy things up but I just have not 
made the time. 

> > Firstly I am concerned that this might cause problems with other users of
> > the NAND driver.  Is there cause for concern ?
>
> AFAIK, are JFFS2 and YAFFS the only clients of NAND driver, except your
> SSFDC module.
>

I guess JFFS2 and YAFFS will not bothered about my NAND driver doing auto 
placement as they have their own schemes ?


> Secondly my SSFDC layer will only work with my NAND driver.
> If you have more questions feel free to ask or let me have a look into the
> code so I can give you more detailed hints.
>

As I said, I will supply you the code but I do not expect you to support it
and I do regard it as, incomplete, for gereral use.

> Thomas
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Thomas, 

Thankyou for your support, again :-). At some time I will look into how I can 
change the SSFDC layer to interface properly to mtd/nand. As my frig seems to 
work for now I am inclined to go with it, unless you think this otherwise.

Cheers 

Simon.
