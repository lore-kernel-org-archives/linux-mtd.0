From: David Woodhouse <dwmw2@infradead.org>
To: cheetim_loh@innomedia.com.sg
In-Reply-To: <002101c41154$a6339560$0b00a8c0@PIII1200MHzM>
References: <002101c41154$a6339560$0b00a8c0@PIII1200MHzM>
Content-Type: text/plain
Message-Id: <1080119708.16509.322.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 24 Mar 2004 09:15:08 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Patch for RedBoot Partition Table Parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-03-24 at 12:00 +0800, LOH Chee Tim wrote:
> The attached patch, against mtd-snapshot-20040323, fixes RedBoot Partition
> Table Parsing for unallocated flash space before the first image.

Thanks.

> Also included are minor updates to:
> 1. include nullname only if it is used
> 2. add an option for selecting whether unallocated flash space is to be
> included

OK. I'd be a lot happier if we had already fixed up the partitioning and
could get at a 'whole-device' MTD device reliably, but it does make
sense.

> 3. follow eCos 2.0 by reading partition table from the whole of last erase
> block instead of just the start

OK.

> 4. force read-only for RedBoot, RedBoot Config and FIS directory images

I don't like this very much. I habitually update RedBoot from Linux. I
have occasionally been known to change the config and FIS directory too.

Perhaps we could make it optional too?

Please update the Kconfig file to match what you've changed in
Config.in.



-- 
dwmw2
