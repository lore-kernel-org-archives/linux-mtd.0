Subject: Re: Oops parsing empty RedBoot partition with 2.6.20-rc7
From: David Woodhouse <dwmw2@infradead.org>
To: Martin Michlmayr <tbm@cyrius.com>
In-Reply-To: <20070202181441.GA2034@deprecation.cyrius.com>
References: <20070202155607.GA31304@deprecation.cyrius.com>
	<0C7297FA1D2D244A9C7F6959C0BF1E520148F6A0@azsmsx413.amr.corp.intel.com>
	<20070202175755.GG24587@deprecation.cyrius.com>
	<20070202181441.GA2034@deprecation.cyrius.com>
Content-Type: text/plain
Date: Fri, 09 Feb 2007 15:07:02 +0000
Message-Id: <1171033622.29713.49.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, linux-mtd@lists.infradead.org,
	buytenh@wantstofly.org, Yoshinori Sato <ysato@users.sourceforge.jp>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-02-02 at 19:14 +0100, Martin Michlmayr wrote:
> 
> 
> [MTD] Don't oops when the RedBoot partition table is empty
> 
> This fixes a regression with the RedBoot parsing code introduced by
> commit 0b47d654089c5ce3f2ea26a4485db9bcead1e515
> 
> Signed-off-by: Martin Michlmayr <tbm@cyrius.com>

Applied; thanks.

-- 
dwmw2
