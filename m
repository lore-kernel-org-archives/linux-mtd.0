Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AD2sx-0006Vz-0c
	for <linux-mtd@lists.infradead.org>; Fri, 24 Oct 2003 15:25:51 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Subash Kalbarga <Subashk@ami.com>
In-Reply-To: <8CCBDD5583C50E4196F012E79439B45C046EBB01@atl-ms1.megatrends.com>
References: 
	 <8CCBDD5583C50E4196F012E79439B45C046EBB01@atl-ms1.megatrends.com>
Message-Id: <1067005143.6281.245.camel@tubarao>
Mime-Version: 1.0
Date: 24 Oct 2003 08:19:04 -0600
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: amd_flash.c faster than cfi_cmdset_0002.c
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-24 at 06:39, Subash Kalbarga wrote:
> Hi all
> 
> We have an AM29LV641MH 8 meg flash on board and looking at performance,
> using amd_flash.c seems to make things considerably faster when writing to
> the flash.
> 
> I am using the 2.4.18 kernel.

The first thing I recommend is moving to something newer: both kernel
and MTD drivers.  The latest version of cfi_cmdset_0002.c is r1.91.  I
have no idea what is in the 2.4.18 kernel (and I'm too lazy to go find
out).

Once you do some testing with the latest version then we will have a
basis for performance comparison.  Let me know what you find.

-- 
Thayne Harbaugh
Linux Networx
