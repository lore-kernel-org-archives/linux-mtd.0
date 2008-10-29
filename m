Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kv9lf-0007O2-IF
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 12:03:20 +0000
Date: Wed, 29 Oct 2008 12:03:12 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: flash read performance
Message-ID: <20081029120312.GA846@shareable.org>
References: <ge6old$oo3$1@ger.gmane.org>
	<20081029114256.GA2239@yoda.jdub.homelinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081029114256.GA2239@yoda.jdub.homelinux.org>
Cc: Andre Puschmann <andre.puschmann@imms.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Tue, Oct 28, 2008 at 11:14:05AM +0100, Andre Puschmann wrote:
> >Hi list,
> >
> >I am currently trying to improve the flash read performance of my 
> >platform. It's a gumstix verdex board with a pxa270 running at 400MHz. 
> >My flash is a 16MB NOR Intel StrataFlash P30 (128P30T) and it's 
> >operating in the _normal_ asynchronous mode. In my opinion the read 
> >performance is very poor, only around 1.2 to 1.4 MB/s depending on the 
> >blocksize. I think it should be possible to get much higher transfer rates.
> 
> Why do you think that?

Take a look at:

http://marc.info/?l=linux-embedded&m=122125638419881&w=2
http://marc.info/?l=linux-embedded&m=122149685932525&w=2
http://marc.info/?l=linux-embedded&m=122185227511786&w=2

-- Jamie
