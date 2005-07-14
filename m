From: David Woodhouse <dwmw2@infradead.org>
To: rick@efn.org
In-Reply-To: <E1Dt4R6-0005UI-00@amazonia.client.comcast.net>
References: <E1DqvgV-000275-00@amazonia.client.comcast.net>
	<1121093753.27264.117.camel@hades.cambridge.redhat.com>
	<E1Ds2ma-0005ta-00@amazonia.client.comcast.net>
	<1121108481.27264.129.camel@hades.cambridge.redhat.com>
	<E1Ds4AF-00063d-00@amazonia.client.comcast.net>
	<1121115438.3430.6.camel@localhost.localdomain>
	<E1DsMIp-0004U9-00@amazonia.client.comcast.net>
	<1121181101.12169.4.camel@hades.cambridge.redhat.com>
	<E1DsNHk-0004bq-00@amazonia.client.comcast.net>
	<1121186381.12086.6.camel@localhost.localdomain>
	<E1DsOD0-0004iT-00@amazonia.client.comcast.net>
	<1121189272.12224.10.camel@localhost.localdomain>
	<E1Dspqm-0003zl-00@amazonia.client.comcast.net>
	<1121294622.12224.87.camel@localhost.localdomain>
	<E1Dt4R6-0005UI-00@amazonia.client.comcast.net>
Content-Type: text/plain
Date: Thu, 14 Jul 2005 15:39:06 +0100
Message-Id: <1121351946.16070.32.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: infinite loop in jffs2_flush_wbuf_gc()?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-14 at 07:11 -0700, Rick Bronson wrote:
>   A few seconds after the command line prompt appears the gc code goes
>   into a 12 minute temporary "hang" loop in jffs2_flush_wbuf_gc() in
> wbuf.c starting at: 

OK. So it _is_ making progress, but just very slowly. It _is_ garbage
collecting, but it's not having to write out new nodes, because it's
mostly just erasing.

Can you build with CONFIG_JFFS2_FS_DEBUG=1 and show the output while
it's doing this? It shouldn't be taking that long -- I wonder what else
is going on.

-- 
dwmw2
