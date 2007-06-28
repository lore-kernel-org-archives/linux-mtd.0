Subject: Re: [patch 2.6.22-rc3] MTD: m25p80 converted to mutex
From: David Woodhouse <dwmw2@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200706281308.46022.david-b@pacbell.net>
References: <200706241509.14367.david-b@pacbell.net>
	<1183057912.1170.199.camel@pmac.infradead.org>
	<200706281308.46022.david-b@pacbell.net>
Content-Type: text/plain
Date: Thu, 28 Jun 2007 22:39:11 +0100
Message-Id: <1183066751.1170.208.camel@pmac.infradead.org>
Mime-Version: 1.0
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

On Thu, 2007-06-28 at 13:08 -0700, David Brownell wrote:
> They applied just fine against 2.6.22-rc6 ... did you apply them
> in the correct order? 

No, sorry. I did now though, with a small cleanup patch to follow.

-- 
dwmw2
