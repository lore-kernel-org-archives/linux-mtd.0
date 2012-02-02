Message-ID: <20266.36804.844286.216383@ipc1.ka-ro>
Date: Thu, 2 Feb 2012 14:29:40 +0100
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: "Bityutskiy\, Artem" <artem.bityutskiy@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] mtd/gpmi : add BBT support to gpmi nand driver
In-Reply-To: <1328183611.28171.170.camel@sauron.fi.intel.com>
References: <1328008316-27258-1-git-send-email-b32955@freescale.com>
 <20120131121007.GO2471@pengutronix.de>
 <1328183611.28171.170.camel@sauron.fi.intel.com>
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Wolfram Sang <w.sang@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Bityutskiy, Artem writes:
> On Tue, 2012-01-31 at 13:10 +0100, Wolfram Sang wrote:
> > On Tue, Jan 31, 2012 at 07:11:56PM +0800, Huang Shijie wrote:
> > > Add a new field to gpmi_nand_platform_data{}.
> > > Make the BBT support to board specific.
> > > 
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > 
> > Reviewed-by: Wolfram Sang <w.sang@pengutronix.de>
> > 
> > I'd think you won't be able to mark blocks bad, though. Will send a
> > patch in a minute. Please test.
> 
> Sorry, I have not read this and the previous related long threads, but
> from the few first e-mails I got the impression that you are not aware
> of the patch from Brian Norris where he modifies MTD BBT code so that it
> will by default write bad block markers _both_ to the BBT and to OOB. It
> sounds like you should hold on with this patch and wait when Brian's
> patch gets in. Then you probably may just use the first version of this
> patch.
> 
IMO it's just silly trying to write anything, even a bad block marker,
to a known bad block in NAND flash.

The bad block markers in particular bytes in the OOB area are provided
by the manufacturer to identify "Factory Bad Blocks". That and no
more!
I don't know why everybody is trying to interpret them as a general
bad block indicator.

To keep track of bad blocks you need at least one good block that can
be reliably written and read (AKA flash based BBT). The only function
of the "Bad Block Markers" is to provide an initial list of blocks
that should be listed in the BBT.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
