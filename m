Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FAjvS-0003ys-4E
	for linux-mtd@lists.infradead.org; Sun, 19 Feb 2006 03:28:22 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Russ Dill <russ.dill@gmail.com>
In-Reply-To: <f9d2a5e10602181011k6552d396q4da6daef944a6fff@mail.gmail.com>
References: <43EB96DC.3030900@eptar.com>
	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>
	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
	<200602161432.17447.manningc2@actrix.gen.nz>
	<1140253826.2480.651.camel@localhost.localdomain>
	<f9d2a5e10602181011k6552d396q4da6daef944a6fff@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 19 Feb 2006 09:29:05 +0100
Message-Id: <1140337746.2480.682.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-02-18 at 10:11 -0800, Russ Dill wrote:
> > Some words about Reed Solomon.
> >
> > Reed Solomon needs hardware support for performance reasons. Efficient
> > usage of Reed Solomon requires a different Data / RS-code layout:
> 
> At what level is hardware support required? I'm involved in the design
> of a new system with a 466Mhz 80200. Should fpga considerations be
> mode for ecc correction? What sort of logic would be best to put in
> the fpga?

Depends. The 1bit correction/ 2bit detection Hamming ECC algorithm found
in the kernel is not too bad, but Reed Solomon is a quite conmputation
expensive algorithm. Look into the encoder / decoder code in
lib/reed_solomon.

In general you have to iterate over the data buffer and compute on each
step. The performance penalty depends on the complexitiy of the
algortihm. If you have enough space in your FPGA then its definitely a
good idea to put some ECC calculation mechanism into it. There are
implementations for both ECC and Reed Solomon available.

	tglx
