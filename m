Date: Wed, 19 Jan 2005 16:56:14 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <Pine.LNX.4.58.0501191309140.8174@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0501191648070.8174@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
	<1105619501.26551.163.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0501131317560.17331@phoenix.infradead.org>
	<6934efce05011810013ea479b@mail.gmail.com>
	<Pine.LNX.4.58.0501191309140.8174@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: CRC on Read-Only partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Jan 2005, Artem B. Bityuckiy wrote:

> On Tue, 18 Jan 2005, Jared Hulbert wrote:
> 
> > My understanding is that NAND technology is prone to read error even
> > if you aren't programming or eraseing it.   Such errors can occur
> > randomly.  By that I mean the data reads fine and then its bad and
> > then it reads fine...
> > 
> Hmm. Thanks. So we just need to re-read several times.
> 
Ok guys, I looked through documentation and articles and have not 
found anything which may approve this.

The question is: if we've read page and encounter ECC error, is it 
possible that if we re-read it several times we will have no errors? This 
means does NAND technology assume random occasional bit flips which go 
away after we re-read page?

I do not mean solar rays, radiation, etc. I only mean NAND technology 
itself.

Would be good to have some URL.

P.S. :
Toshiba's guide stands bit flipping is possible, but they stay until block 
is erased. Re-read as many times as yiu want - you will still have this 
bit error. But this doesn't mean block is bad - erase the block and be 
happy.


> --
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
