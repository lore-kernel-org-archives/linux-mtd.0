Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cqx0d-0003RV-Lk
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 12:19:16 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "David A. Marlin" <dmarlin@redhat.com>
In-Reply-To: <41ED2EB3.1070203@redhat.com>
References: <41ED2EB3.1070203@redhat.com>
Content-Type: text/plain
Date: Tue, 18 Jan 2005 18:19:08 +0100
Message-Id: <1106068748.16877.109.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: additional error checks for AG-AND erase/write
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-01-18 at 09:43 -0600, David A. Marlin wrote:
> The Renesas AG-AND chips support additional error checking on erase and
> write operations beyond just checking the operation status.  I think the
> logic is that since ECC can correct 2-bit errors on read, if only a
> single bit error occurs on and erase or write the operation should not
> be considered FAIL.  Even if a single bit error occurs on read (in
> addition to the single bit error on write), it will still be corrected
> and no data will be lost.

Hmm, have you other information ?

>From the data sheet:
 
When an error occurs in program page, block replacement including
corresponding page should be done. 
...
When an error occurs in erase operation, future access to this bad block
is prohibited. 

An error on erase is definitely a criteria for putting the block on the
bad list. Actually JFFS2 tries to erase it again before sorting it out.

The single bit programming error does not make a lot of sense to me, as
you always have to do RS error correction when you read the page, which
results in a nice performance penalty. And its a clear sign that
something went wrong. We try to reuse the block, see above.

tglx
