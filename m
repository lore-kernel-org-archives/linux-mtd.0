Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WCCQ-0000cu-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 08:31:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200108130129.VAA14974@stone.tmok.com> 
References: <200108130129.VAA14974@stone.tmok.com> 
To: pla <pla@tmok.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 erase size of 16k? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Aug 2001 08:37:07 +0100
Message-ID: <14876.997688227@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

pla@tmok.com said:
>  Ah, many thanks.  the 2.4.8 kernel made all my problems magically go
> away, how wonderful!  (Guess I should have paid more attention to the
> kernel changelogs, my bad).

Er, that code is older than the 20010807 snapshot you said you were using. 
I meant the latest code from my CVS. I'm slightly concerned that the older 
code works when the newer code doesn't - it's supposed to work the other 
way round. Can you check the latest code and make sure it works there too?

>   Now on to the fun of getting GRUB to work as the DOC firmware (I
> don't suppose anyone's written a more detailed guide than the 4-step
> README in mtd/grub?  Such as, where does an 80k stage2 go when the DOC
> firmware region only holds 48k?  <G>)

It doesn't work perfectly yet, although it shouldn't take much to fix it.
To make it fit, you have to use nftl_format to make the NFTL start further 
in to the device.


--
dwmw2
