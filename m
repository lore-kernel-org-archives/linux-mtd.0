Received: from web14701.mail.yahoo.com ([216.136.224.118])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dpiV-0003P1-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 09:40:43 +0000
Message-ID: <20020221095156.14464.qmail@web14701.mail.yahoo.com>
Date: Thu, 21 Feb 2002 01:51:56 -0800 (PST)
From: Michael Michael <memmel2@yahoo.com>
Subject: Re: Slow jffs2 startup on DOM 
To: David Woodhouse <dwmw2@infradead.org>, Gad Hayisraeli <gad@syete.co.il>
Cc: Michael Michael <memmel2@yahoo.com>, linux-mtd@lists.infradead.org
In-Reply-To: <24611.1014280415@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I think in this case its caused by the underlying
block device cleaning things up. Not JFFS2. I think
he's right.

Remeber this is the ide/block driver (DOM) not regular
mtd.

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> gad@syete.co.il said:
> >  in my case (mediaEngine + assabet), i encountered
> some slowness like
> > you did, just when i previously shutdown the
> device without unmounting
> > + syncing first
> 
> Er, if that makes a difference to JFFS2 I'll be
> _very_ surprised. JFFS2 
> does nothing special on unmount. Checkpointing,
> either on unmount or 
> periodic opportunistic checkpoints, has been
> discussed a lot but never 
> actually implemented. I'm happy to give pointers if
> you seriously intend to 
> work on it.
> 
> --
> dwmw2
> 
> 
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/


__________________________________________________
Do You Yahoo!?
Yahoo! Sports - Coverage of the 2002 Olympic Games
http://sports.yahoo.com
