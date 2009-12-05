Subject: Re: Flash I/O not enabled in MSR_DIVIL_BALL_OPTS
From: David Woodhouse <dwmw2@infradead.org>
To: Rick van Rein <rick@groengemak.nl>
In-Reply-To: <20091205174702.GA3240@phantom.vanrein.org>
References: <20091130084004.GE23351@phantom.vanrein.org>
	<1259777470.3744.484.camel@macbook.infradead.org>
	<20091205174702.GA3240@phantom.vanrein.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 05 Dec 2009 21:05:35 +0000
Message-ID: <1260047135.17440.133.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-12-05 at 17:47 +0000, Rick van Rein wrote:
> David,
> 
> > If you have the NAND hardware connected, then surely your firmware ought
> > to be setting the MSRs appropriately?
> 
> I broken open a bit more hardware and found an ATA-to-flash interface
> between companion chip and flashes.  Sigh, instead of 100 MB/s I am now
> limited to 2.4 MB/s and cannot employ this wonderful direct-NAND-stuff.

The NAND controller on the Geode is only capable of about 3.5MiB/s
anyway. There's a reason we put a new NAND flash controller on OLPC.

-- 
dwmw2
