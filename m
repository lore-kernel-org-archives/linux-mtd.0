Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1My5uy-0006D9-6T
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 15:37:40 +0000
Subject: Re: NAND: Add flags to the probe calls to control scan behaviour
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Dooks <ben@simtec.co.uk>
In-Reply-To: <20091013090019.091262272@fluff.org.uk>
References: <20091013090019.091262272@fluff.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Oct 2009 18:37:26 +0300
Message-Id: <1255534646.32489.169.camel@localhost>
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

On Tue, 2009-10-13 at 10:00 +0100, Ben Dooks wrote:
> plain text document attachment (nand-update-probe2.patch)
> Add a flags field to the two scan calls to control the behaviour of the
> scan process. Currently the only flag we define is NAND_PROBE_SPECULATIVE
> to stop the user-worrying messages 'No NAND device found!!!'. This message
> often worries users (was three exclamation marks really necessary?) and is
> even worse in systems such as the Simtec Osiris where there may be optional
> NAND devices which are not known until probe time.
> 
> The approach is to change nand_scan_ident and nand_scan to have a new flags
> field, and add wrapper functions to the header files so that we do not have
> to get around all the drivers doing a search and replace. If we where to
> change all the call sites for nand_scan() and nand_scan_ident() we would
> touch about 40 drivers.
> 
> Signed-off-by: Ben Dooks <ben@simtec.co.uk>
> Signed-off-by: Simtec Linux Team <linux@simtec.co.uk>

So you are introducing this new flag just to make generic NAND layer be
silent if it cannot identify device type, right?

Could you please elaborate why more why is this needed a bit more? What
is the driver?

Why not to just remove that print at all?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
