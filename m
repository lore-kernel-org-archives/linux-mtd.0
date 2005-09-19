Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHTQI-0007Ek-JG
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 17:43:50 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <432F3057.4080600@ru.mvista.com>
References: <432EBFC8.3090803@ru.mvista.com>
	<1127162439.24044.235.camel@tglx.tec.linutronix.de>
	<432F3057.4080600@ru.mvista.com>
Content-Type: text/plain
Date: Mon, 19 Sep 2005 23:43:45 +0200
Message-Id: <1127166226.24044.251.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND/ HW ECC problem
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 01:40 +0400, Vitaly Wool wrote:
> >Hmm, we really should think about making the ECC size per chunksize run
> >time configurable.
> >
> What if have it in the same way as oobfree is stored, i. e. {offset, 
> length} pairs instead?

Yes

> >If your chip does it different, please use the correct parts of the data
> >structure to implement it. 
> >
> Yes, it does and I'm not at all happy with that. However, I guess this 
> controller is likely to be used in other boards' designs...
> So, the right way to handle this bizarre stuff currently is to 
> write/read ECC data byte-by-byte following the eccpos array, correct?

Yes

tglx
