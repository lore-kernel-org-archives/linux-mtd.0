Received: from host-212-158-219-180.bulldogdsl.com ([212.158.219.180]
	helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7M4B-0001se-C4
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2004 18:46:28 -0400
Date: Tue, 14 Sep 2004 23:46:16 +0100
From: Ben Dooks <ben-mtd@fluff.org>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
Message-ID: <20040914224616.GA10212@home.fluff.org>
References: <20040904173703.GA2100@fluff.org> <1095081159.5442.1.camel@tubarao>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1095081159.5442.1.camel@tubarao>
Sender: Ben Dooks <ben@fluff.org>
Cc: ch@hpl.hp.com, linux-mtd@lists.infradead.org
Subject: Re: jedec_probe problems with 16bit devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 13, 2004 at 07:12:39AM -0600, Thayne Harbaugh wrote:
> On Sat, 2004-09-04 at 18:37 +0100, Ben Dooks wrote:
> > I have been trying to get an SST 39LF160 on an Simtec Electronics
> > EB2410ITX (aka Bast). I have found some problems with jedec_probe
> > with non-8bit devices.
> > 
> > Basically, the two problems are as follows:
> > 
> > 1) A number of functions are masking out bits from the command
> > addresses, but the cfi_send_gen_cmd() moves the addresses up
> > depending on the chip type, so the masking is not needed.
> > 
> > 2) the cfi_send_gen_cmd() is called with CFI_DEVICETYPE_X8
> > instead of cfi->device_type, which causes the wrong accesses to
> > be generated to the chip.
> 
> committed patch - please try it.

I'll try this on my EB2410ITX as soon as I can, would like to
polish the NOR flash driver and get it uploaded.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
