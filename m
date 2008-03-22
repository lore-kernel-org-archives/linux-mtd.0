Received: from mk-filter-2-a-1.mail.uk.tiscali.com ([212.74.100.53]
	helo=mk-filter-2-a-4.mail.uk.tiscali.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jd8cl-00027Z-Lo
	for linux-mtd@lists.infradead.org; Sat, 22 Mar 2008 18:39:24 +0000
Subject: Re: [PATCH] 2/3 mtd: add support for flash on the SEGA Dreamcast
	Visual Memory Unit
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080322183200.GD19347@logfs.org>
References: <1206207805.6324.13.camel@localhost.localdomain>
	<1206209035.6324.29.camel@localhost.localdomain>
	<20080322183200.GD19347@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Mar 2008 18:39:07 +0000
Message-Id: <1206211147.6324.48.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@osdl.org>, linux-sh <linux-sh@vger.kernel.org>,
	Greg KH <greg@kroah.com>, Paul Mundt <lethal@users.sourceforge.net>,
	LKML <linux-kernel@vger.kernel.org>,
	MTD <linux-mtd@lists.infradead.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 2008-03-22 at 19:32 +0100, Jörn Engel wrote:
> On Sat, 22 March 2008 18:03:55 +0000, Adrian McMenamin wrote:
> > 

> Without a doubt, buffering is useful.  However I question how useful it
> is to implement this in individual device drivers instead of once in
> mtd_core.c.


Well, it's obviously useful to this device. Are you making best the
enemy of better?


> 
> Given that you have ignored most of my previous comments, NAK. 


Not good enough, frankly. What comments have I ignored? I didn't
implement your suggestion that a void* memory type become be32* because
it was totally inappropriate for a type that is passed in both be32 and
le32 and as u8.


>  I don't
> mind merging code that isn't up to our standards yet.  But I have a bad
> feeling about a maintainer that does not understand review comments.
> Since you had similar problems understanding Andrew, part of the blame
> may sit on your side.
> 

I'm sorry that you feel that way, but as you took the hump when I said
that this:

"Possibly the big-endian annotations need to trickly though the layers
here as well."

Isn't good english (and it's not) and asked you - twice - to explain
what you meant. I cannot accept your summary.


Adrian
