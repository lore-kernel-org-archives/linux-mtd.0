Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JwzpY-0003ny-GB
	for linux-mtd@lists.infradead.org; Fri, 16 May 2008 13:18:40 +0000
Date: Fri, 16 May 2008 23:18:30 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Porting to Intel P33 flash
Message-ID: <20080516131830.GA20651@cloud.net.au>
References: <20080516055424.GA10763@cloud.net.au>
	<39423.137.237.242.42.1210941221.squirrel@webmail.nuvox.net>
	<Pine.LNX.4.64.0805161337350.5602@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0805161337350.5602@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, jkimble@one.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 16, 2008 at 01:59:43PM +0100, Alexey Korolev wrote:
> Hi
> 
> > 
> > Funny you say that...  I just modified the code where it checks CFI
> > version  and it seems to be working without further modification. I've not
> > tested much though so I may have more to do. I do have to write to this
> > but not much.
> > 
> > James
> It is good to hear this. Please check number of RWW partitons
> (numvirtchips variable) and 9th bit of extp->FeatureSupport. 
> Everything is Ok if numvirtchips == 1 or extp->FeatureSupport bit 9 is 0.
> 
> As I remember some versions of MTD prior to 2.6.17 had
> problems with CFI offset calculation. It led chip to be identified as
> multiple partitioned device when it should have 1 partiton. 

How do you mean multiple partitions?

Here is what I see with the 8Mb P33 NOR flash with 2.6.15:

IXP4XX-Flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x20000,blocks=63
erase region 1: offset=0x7e0000,size=0x8000,blocks=4

The output with 2.6.24 is the same. I only modified 2.6.15 to recognise
the new minor revision of the P33 flash.

Anyway 2.6.15 is history for me now (we ran it for 1 year but just
upgraded to 2.6.24), I only mention it for James's information.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
