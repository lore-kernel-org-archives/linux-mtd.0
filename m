Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MOy5X-0006D8-A9
	for linux-mtd@lists.infradead.org; Thu, 09 Jul 2009 18:11:26 +0000
Date: Thu, 9 Jul 2009 20:11:14 +0200
From: Daniel Mack <daniel@caiaq.de>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: UBIFS trouble
Message-ID: <20090709181114.GB15518@buzzloop.caiaq.de>
References: <20090709175559.GZ26160@buzzloop.caiaq.de>
	<4A56304A.2050507@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A56304A.2050507@nokia.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 09, 2009 at 09:00:42PM +0300, Adrian Hunter wrote:
>> [  648.188650] timed out writing command
>> [  648.192379] UBI error: ubi_io_read: error -74 while reading 81 bytes from PEB 738:80616, read 81 bytes
>> [  648.201732] UBIFS error (pid 1136): try_read_node: cannot read node type 1 from LEB 72:76520, error -74
>> [  648.211137] UBIFS error (pid 1136): ubifs_read_node: bad node type (255 but expected 1)
>> [  648.219115] UBIFS error (pid 1136): ubifs_read_node: bad node at LEB 72:76520
>> [  648.226231] UBIFS error (pid 1136): do_readpage: cannot read page 26131 of inode 32838, error -22
>>

[...]

> Try the NAND tests in drivers/mtd/tests.

Hmm. The torture test indees shows a problem now:

sh-3.2# modprobe mtd_torturetest dev=3
[  386.367730] 
[  386.369296] =================================================
[  386.375258] mtd_torturetest: Warning: this program is trying to wear out your flash, stop it if this is not wanted.
[  386.385811] mtd_torturetest: MTD device: 3
[  386.390021] mtd_torturetest: torture 32 eraseblocks (8-39) of mtd3
[  386.396238] mtd_torturetest: write verify enabled
[  388.675993] double bit error @ page 00000b79
[  388.680406] timed out writing command
[  388.687925] mtd_torturetest: error -74 while reading EB 36, read 131072
[  388.694536] mtd_torturetest: verify failed for 0xFF... pattern
[  388.700364] mtd_torturetest: finished after 0 erase cycles
[  388.705885] mtd_torturetest: error -74 occurred during torturing
[  388.711908] =================================================
modprobe: Failed to load module mtd_torturetest: Bad message.

Any hint what to debug?

Thanks,
Daniel
