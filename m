Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAwXo-0003WT-LO
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 15:52:09 -0500
Message-ID: <4235F968.7040102@ieee.org>
Date: Mon, 14 Mar 2005 15:51:52 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <4235D290.15983.3536316E@localhost>
	<1110821676.4814.53.camel@tglx.tec.linutronix.de>
In-Reply-To: <1110821676.4814.53.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: lilo vs. diskonchip (again, sorry)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
>>BTW, is docboot only intended for inftl devices, or
>>does it work for nftl DoC's too?
> 
> 
> Docboot seems to be written for and tested on INFTL devices, but it
> should be not that hard to make it work on NFTL DoCs. 
> 
> Dan ??

Yeah, this issue keeps coming up.  I keep hoping someone else will 
volunteer, since I don't use NFTL-based devices anymore in my project. 
No such luck :(

However, since I keep claiming it should be easy to add this support to 
DOCboot, I'll go ahead and put something together over the next week or so.

	-Dan
