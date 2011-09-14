Received: from na3sys009aog115.obsmtp.com ([74.125.149.238])
 by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1R3huR-0004P1-6P
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2011 05:21:20 +0000
Received: by mail-gx0-f177.google.com with SMTP id 23so1677840gxk.22
 for <linux-mtd@lists.infradead.org>; Tue, 13 Sep 2011 22:21:16 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Apple Message framework v1244.3)
Subject: [Resent with proper line wrap] Request for comments: UBI PEBs as a
 multiple of erase size
From: Kevin Paul Herbert <kevin.herbert@meraki.net>
In-Reply-To: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
Content-Transfer-Encoding: 7bit
Message-Id: <6C6BF63D-5411-490C-BC7D-19227423B6BF@meraki.net>
References: <40BCDFDF-F9C8-46C5-99F8-E56050E8B32C@meraki.net>
To: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 14 Sep 2011 05:21:20 -0000

[Sorry for the ugly lack of line-wrap... I thought I knew better. :-)]

I came across a situation where I wanted to be able to use the same pre-built
(with UBI) image on two different FLASH devices, one of which having a
larger erase size than the other. I actually did not notice that the device
I was using had a different erase size, which caused UBI to quietly corrupt
my FLASH.

I have a patch to UBI (kernel and ubinize) to store the size of a PEB in
the EC header, reject attaching if the PEB size is not equal to or an
integer multiple of the erase size, and treat multiple erase blocks
as a "cluster" for I/O operations.

I looked through a few months of archives to see if this is a common
problem, and I don't see this as being discussed. Is there interest in
me publishing this patch for inclusion in the kernel. The only
downside I can see of my change is that it adds an additional 32 bit
quantity to struct ubi_ec_hdr, reducing the available free header bytes
from 35 to 31. For backwards compatibility, if this field is zero,
I treat it as PEB size == erase size.

It seems to me that having the PEB size in the header, regardless of
supporting multiple erase blocks as a single PEB, is a useful consistency
check.
