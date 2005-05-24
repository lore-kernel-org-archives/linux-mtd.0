Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Daauc-0002vU-2x
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 11:01:44 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <42933C35.3040305@ru.mvista.com>
References: <42933C35.3040305@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 24 May 2005 17:01:44 +0200
Message-Id: <1116946904.6736.212.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: last commit breaks the AMD NOR flash functionality?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-24 at 18:37 +0400, Vitaly Wool wrote:
> > 	/* Did we succeed? */
> >-	if (chip_good(map, adr, map_word_ff(map))) {
> >+	if (!chip_good(map, adr, map_word_ff(map))) {
> > 		/* reset on all failures. */
> > 		map_write( map, CMD(0xF0), chip->start );
> > 		/* FIXME - should have reset delay before continuing */
> >
> If I roll it back, it starts working.
> I also suspected something strange with 'if(chip_good(...)) ...' instead 
> of 'if(!chip_good(...)) ...' but it worked before and it doesn't work 
> now. Can anyone elaborate this a bit?

I had the same problem you see before the fix. It took a bit to figure
out what was going wrong. 

I'm quite sure, that my fix is correct, because the previous revision
exited via the error path in case of no error.

I suspect, that something goes really wrong with your erase. You have to
check the results in chip_good.

The chip_good function reads the same address twice and compares whether
the results are equal. The chip good result also requires that the reads
are all 0xff.

I suggest to add a check into chip_good, where you can identify which of
the requirements is not fulfilled to further narrow down the source of
trouble

tglx
