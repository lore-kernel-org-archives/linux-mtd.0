Received: from trinity.fluff.org ([217.147.94.151])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnpjF-0004Zz-Ov
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 01:37:46 -0400
Date: Tue, 15 May 2007 06:37:28 +0100
To: Harald Welte <laforge@openmoko.org>
Subject: Re: ECC on 2048 byte page size 8-bit NAND on Samsung S3C2440
Message-ID: <20070515053727.GF805@trinity.fluff.org>
References: <20070515003039.GB32448@prithivi.gnumonks.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070515003039.GB32448@prithivi.gnumonks.org>
From: Ben Dooks <ben@trinity.fluff.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2007 at 08:30:40AM +0800, Harald Welte wrote:
> Hi!
> 
> On openmoko's future mobile communications devices, we're using 2048
> byte page sized NAND chips (x8 organization such as K9F8G08U0A).
> 
> However, it seems to me that the ECC support for 2048byte page sized
> NAND chips is not really implemented yet, neither by the NAND core, nor
> by the S3C2440 NAND driver.
> 
> As far as I understand it (I haven't worked with 2k page before), the
> 2440 NAND controller can generate a 4-byte ECC for each 2048byte page (8
> bytes in case of x16 organization, this seems somehow strange).
> 
> In addition to ECC on the actual main data area, it also supports ECC on
> the OOB data, too.  I haven't found any piece of code in any other NAND
> driver in the kernel that uses this feature.
> 
> Also, I don't see something like a standard ECC layout for the 2048byte
> page deivces.  Is there one?
> 
> I can certainly spend my time hacking up some working code.  The
> quesetion is if there is already some thought by one of the people
> involved for some longer time with linux-mtd and/or the s3c2440.
> 
> So if you have implementation thoughts / wishes / guidelines: THis is
> the time to raise them, before I just doo what I deem appropriate ;)

Hi. we're in the process of upgrading to large page nand ourselves,
expect patches released before the end of the week, we're just doing
QA on our patchset and updating our release tool.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
