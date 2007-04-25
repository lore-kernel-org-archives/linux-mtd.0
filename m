Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hgk5x-0004Mj-Bv
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 12:11:54 -0400
Date: Wed, 25 Apr 2007 18:09:26 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: Semih Hazar <semih.hazar@indefia.com>
Subject: Re: Slow NAND + JFFS2
Message-ID: <20070425180926.53d54b1c@dhcp-252-105.norway.atmel.com>
In-Reply-To: <462F757A.7010103@indefia.com>
References: <462F45B1.8020007@indefia.com> <462F6938.90903@intel.com>
	<462F757A.7010103@indefia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: akorolev <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 25 Apr 2007 18:36:26 +0300
Semih Hazar <semih.hazar@indefia.com> wrote:

> akorolev wrote:
> > You may try to clarify if compression is off.  
> Setting compression mode to "no compression" speeds it a lot.
> This time copying a 40 meg file takes 21 seconds. (from NAND to NAND as 
> in the first case)

Interesting. I suspect the zlib code might thrash the TLB quite a bit
on the ap7000 because of the rather large workspace struct which is
allocated using vmalloc().

Until we get around to supporting larger page sizes for vmalloc, could
you try a different compressor (assuming you're currently using zlib)?

Haavard
