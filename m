Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FqBF2-0006kI-29
	for linux-mtd@lists.infradead.org; Tue, 13 Jun 2006 11:56:56 -0400
Date: Tue, 13 Jun 2006 19:56:33 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: tglx@linutronix.de
Subject: Re: [PATCH] NAND: fix reading/writing OOB for syndrome
Message-Id: <20060613195633.86a315d6.vwool@ru.mvista.com>
In-Reply-To: <1150213973.5257.350.camel@localhost.localdomain>
References: <20060613190146.f0e5f2b8.vwool@ru.mvista.com>
	<1150212895.5257.342.camel@localhost.localdomain>
	<20060613194814.4ee01f06.vwool@ru.mvista.com>
	<1150213973.5257.350.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Jun 2006 17:52:53 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Tue, 2006-06-13 at 19:48 +0400, Vitaly Wool wrote:
> > On Tue, 13 Jun 2006 17:34:55 +0200
> > Thomas Gleixner <tglx@linutronix.de> wrote:
> > 
> > > ???? You want to read in the data area of the FLASH !
> > 
> > No, it becomes a requirement to the NAND chip driver to convert NAND_CMD_READOOB to what's appropriate for the chip.
> > If we require the chip driver to be able to convert NAND_CMD_READOOB with offset 0, why not require it to convert it properly for other offsets?
> 
> Thats completely bogus. We will put such crap into the command
> functions. Command functions handle raw flash commands and nothing else.
> The fixup for NAND_CMD_READOOB is just a conveniance to keep small and
> large page compatible. 

Hmm, agreed. Not a big thing to change though.

> > I read all the OOB by portions for the (data, oob+ecc) x eccsteps layout.
> > I don't distinguish between spare OOB and ECC so I don't need to take prepad/postpad into account.
> > We'll just need another couple of funcs for syndromes that imply ( (data, ecc) x eccsteps, oob) layout.
> 
> Ah, and we need to make both command functions aware of that crap ? Only
> over my dead body !

Not it's not that dramatic. :)
After some speculation, I do agree that handling prepad and postpad there is necessary. 

Vitaly
