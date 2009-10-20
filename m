Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N0DUE-0003DM-Bw
	for linux-mtd@lists.infradead.org; Tue, 20 Oct 2009 12:06:51 +0000
Subject: Re: NAND: Add flags to the probe calls to control scan behaviour
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Dooks <ben@simtec.co.uk>
In-Reply-To: <4ADC4137.1060204@simtec.co.uk>
References: <20091013090019.091262272@fluff.org.uk>
	<1255534646.32489.169.camel@localhost> <4ADC4137.1060204@simtec.co.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Oct 2009 15:06:35 +0300
Message-Id: <1256040395.29856.228.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Simtec Linux Team <linux@simtec.co.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-10-19 at 11:36 +0100, Ben Dooks wrote:
> I'd rather it be silent if it cannot find a device, as a number of our boards
> have slots where NAND devices may be fitted by the customer and as such all
> possibilities are registered with the NAND driver.
> 
> > Could you please elaborate why more why is this needed a bit more? What
> > is the driver?
> 
> Because customers get scared when errors with '!!!' turn up.

> > Why not to just remove that print at all?
> 
> Possible, but what about the case where there is a legitimate problem with
> the device that is supposed to be there.

I would go for this instead. I think the drivers can print an error
message themselves.

Or can this be done using the chip->options ?
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
