Subject: Re: mkfs.jffs2 supports hard links?
From: David Woodhouse <dwmw2@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0809031028140.2381@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0809031028140.2381@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Wed, 03 Sep 2008 13:03:33 +0100
Message-Id: <1220443413.2985.111.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-09-03 at 10:29 +0200, Ricard Wanderlof wrote:
> 
> 
> Does anyone know offhand if mkfs.jffs2 (mtdtools) supports hard
> links ?

Yeah, I implemented that for OLPC a few months ago...
http://git.infradead.org/mtd-utils.git?a=commitdiff;h=042f3cd5

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
