Received: from [2002:cde9:da46::1] (helo=canuck.infradead.org)
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYsbp-00062y-UA
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 22:31:15 +0100
Received: from 207.88.121.43.ptr.us.xo.net ([207.88.121.43]
	helo=mail.realmsys.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DYsbQ-00082P-0U
	for linux-mtd@lists.infradead.org; Thu, 19 May 2005 17:30:56 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Zoltan Sogor <weth@inf.u-szeged.hu>
In-Reply-To: <1116521440.4427.199.camel@pgrayson1.realmsys.com>
References: <1115400358.4422.92.camel@pgrayson1.realmsys.com>
	<42846606.8070108@inf.u-szeged.hu>
	<1116038903.4857.30.camel@pgrayson1.realmsys.com>
	<428B4995.9010103@inf.u-szeged.hu>
	<1116521440.4427.199.camel@pgrayson1.realmsys.com>
Content-Type: text/plain
Date: Thu, 19 May 2005 15:30:21 -0600
Message-Id: <1116538221.4427.206.camel@pgrayson1.realmsys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Centralized Summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have found the real issue behind the problems I was attributing to the
centralized summary. There was a problem in the nand driver for the
custom nand controller that I am using. Once that problem was fixed,
neither of the two new centralized summary problems I had reported
happen anymore. So, I no longer know of any problems with the CS patch.
Sorry for the noise.

Pete

On Thu, 2005-05-19 at 10:50 -0600, Peter Grayson wrote:
> I did some further testing. It looks like the kernel panics may have a
> relationship to partition size. I have tried these tests with two
> partitions: a 184MB partition and a 64MB partition. I was unable to
> reproduce the kernel panics on the 64MB partition, but they were easily
> reproducible on the 184MB partition (which is where I found the original
> results). The other problem (Crc failure on cent_sum inocache) happens
> on both partitions.
