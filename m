Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N6hOb-0008VI-LH
	for linux-mtd@lists.infradead.org; Sat, 07 Nov 2009 09:15:50 +0000
Subject: Re: scantest : READOOB Issue
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adish Kuvelker <adkuvi@gmail.com>
In-Reply-To: <52760a310911060523x6853acb2rbb92818324e920d8@mail.gmail.com>
References: <52760a310911060523x6853acb2rbb92818324e920d8@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 07 Nov 2009 11:15:35 +0200
Message-Id: <1257585335.21596.124.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-11-06 at 18:53 +0530, Adish Kuvelker wrote:
> Hello,
> 
> I have developed a NAND driver for an ARM9-based processor with
> Samsung K9F2G08U0M NAND Flash. Since the Flash chip doesn't support
> the  NAND_CMD_READOOB command I had skipped the development for this.

But it looks like the random read command can be used instead, right?

> We are now subjecting this driver to MTD tests. But while doing the
> MTD scantest I found that the test requires reading the OOB section
> through the NAND_CMD_READOOB command.
> 
> Do I have to develop the support for this command in my code in order
> to have a MTD compliant driver? Will the absence of support for this
> result in the driver being non-compliant?

Those tests are not really compliance tests. If you do not want to
provide OOB read support, you should probably invent a nice way to
inform upper layers about unsupported OOB read operation. Then you
should amend the tests. And if you do not support reading OOB, it does
not make sense supporting writing OOB either, right?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
