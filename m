Received: from web86910.mail.ukl.yahoo.com ([217.12.13.62])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FJaCI-0002zz-DL
	for linux-mtd@lists.infradead.org; Wed, 15 Mar 2006 12:54:17 -0500
Message-ID: <20060315174728.34619.qmail@web86910.mail.ukl.yahoo.com>
Date: Wed, 15 Mar 2006 17:47:28 +0000 (GMT)
From: Adam Ward <adamward2005@yahoo.co.uk>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <4412701A.2070202@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	Nicolas Pitre <nico@cam.org>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for your help, that did the trick so I put in
some code to do the unlock, in the kernel map file.

I still had to do a remount, but a quick fiddle with
/etc/fstab and it's all how it should be.

Cheers guys,

Adam

--- Todd Poynor <tpoynor@mvista.com> wrote:

> Adam Ward wrote:
> ...
> > but the flash is 2 * 28F256L18B - only difference
> > being it's 2 * 28F128L18B parts on the Mainstone.
> (I
> > think that's on C5 revision processor cards?)
> 
> The L18 StrataFlash chips featured on some Mainstone
> II boards do power 
> up with all blocks locked.  Run flash_unlock on
> writeable partitions 
> prior to mounting.
> 
> -- 
> Todd
> 



		
___________________________________________________________ 
Yahoo! Photos – NEW, now offering a quality print service from just 8p a photo http://uk.photos.yahoo.com
