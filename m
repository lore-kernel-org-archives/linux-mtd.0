Received: from [211.172.225.159] (helo=hartford.siteprotect.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15fCyl-000610-00
	for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2001 05:10:56 +0100
Date: Fri, 7 Sep 2001 13:16:49 +0900
From: Kim Jong-chan <kernelhacker@hartford.siteprotect.co.kr>
To: kira brown <kira@hex.linuxgrrls.org>
Cc: linux-mtd@lists.infradead.org
Subject: What abount NAND driver in current MTD snapshot?
Message-ID: <20010907131648.A14568@hartford.siteprotect.co.kr>
Reply-To: zeppelin@kernelhacker.org
References: <617933180D08D311AB500090273F1F96026A354E@storm.corp.directvbroadband.net> <Pine.LNX.4.33.0109061717360.9437-100000@hex.linuxgrrls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0109061717360.9437-100000@hex.linuxgrrls.org>; from kira@hex.linuxgrrls.org on Thu, Sep 06, 2001 at 05:19:34PM +0100
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I've just looked up MTD NAND driver for recent several days.

I think it's almost done. But the driver itself has no bad block handling.

Is it right?

If it is right, where is the bad block handling?

Is NFTL capable of handling bad block? 

then, Can I use NAND driver & NFTL combined and put any filesystem on it?

On Thu, Sep 06, 2001 at 05:19:34PM +0100, kira brown wrote:
> 
> 
> On Thu, 6 Sep 2001, Fry, Dan wrote:
> > Also what's the best strategy for handling bad blocks in MTD.  Should NFTL
> > be modified to eliminate its current dependency on DiskOnChip ECC hardware?
> 
> NFTL is not licenced for use on hardware not supplied by M-Systems,
> basically;  of course this isn't a problem for those of us in the Free
> World where the patent doesn't hold water, but it would cause problems for
> anyone in the US.
> 
> kira.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
