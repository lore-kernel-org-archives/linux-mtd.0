Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MqpiL-0001tL-Bx
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 14:54:37 +0000
Subject: Re: UBIFS and hardware ECC of all FF pages of MLC NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <4ABB7224.8000804@nokia.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 24 Sep 2009 17:51:46 +0300
Message-Id: <1253803906.3778.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Darwin Rambo <drambo@broadcom.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-24 at 16:20 +0300, Adrian Hunter wrote:
> UBIFS assumes FF pages at the end of eraseblocks are empty.  UBI and UBIFS are
> designed not to require OOB and will not read or write it.
> 
> > 2. for initial downloading, should an ECC be programmed on all FF data pages? Is there any correction advantage?
> 
> In your case, as you have discovered, you must not program ECC for FF pages at
> the end of eraseblocks.
> 
> > 3. for runtime page writes, should an all FF page leave the ECC at FF as well?
> 
> No.  The only time UBI or UBIFS will write an all FF page is if that is the
> data to be stored - in which case, it should be given an ECC.

I even wrote a doc about how UBI-aware flashing should be done:

http://www.linux-mtd.infradead.org/doc/ubi.html#L_format

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
