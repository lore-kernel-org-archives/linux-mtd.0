Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgkBa-0004gZ-C3
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 12:17:45 -0400
Message-ID: <462F7F20.6090807@indefia.com>
Date: Wed, 25 Apr 2007 19:17:36 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: Re: Slow NAND + JFFS2
References: <462F45B1.8020007@indefia.com>
	<462F6938.90903@intel.com>	<462F757A.7010103@indefia.com>
	<20070425180926.53d54b1c@dhcp-252-105.norway.atmel.com>
In-Reply-To: <20070425180926.53d54b1c@dhcp-252-105.norway.atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Haavard Skinnemoen wrote:
> Interesting. I suspect the zlib code might thrash the TLB quite a bit
> on the ap7000 because of the rather large workspace struct which is
> allocated using vmalloc().
>
> Until we get around to supporting larger page sizes for vmalloc, could
> you try a different compressor (assuming you're currently using zlib)?
>   
Zlib or rtime, not sure. I'll try other compressors and let you know the 
benchmarks.
