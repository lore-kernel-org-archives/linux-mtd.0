Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BZoZL-0007TM-17
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2004 06:19:59 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <40CD76C2.1080007@inf.u-szeged.hu>
References: <40CD76C2.1080007@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1087208395.15845.1393.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 14 Jun 2004 11:19:56 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND device for JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-06-14 at 11:58 +0200, Ferenc Havasi wrote:
> Dear All,
> 
> Can anyone advice us any (not too expensive) hardware device to test 
> JFFS2 on NAND under Linux. Actually we would like to speed up the mount 
> time of JFFS2 and we need a hardware to try our ideas.

SmartMedia connected off a parallel port? Or a DiskOnChip 2000 in one of
their ISA or PCI evaluation boards?

> We had some IPAQ with Familiar Linux, but they have NOR flash. There is 
> some IPAQ  (1900 and 2200) with NAND flash but there is no working Linux 
> on them :-(

Don't we have Linux on the h1900 yet?

-- 
dwmw2
