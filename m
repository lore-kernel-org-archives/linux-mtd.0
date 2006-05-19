From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148056886.3875.211.camel@pmac.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
	<1148039632.3875.131.camel@pmac.infradead.org>
	<1148039931.3199.12.camel@sauron.oktetlabs.ru>
	<1148040679.3875.133.camel@pmac.infradead.org>
	<1148040871.3199.17.camel@sauron.oktetlabs.ru>
	<1148041866.3875.145.camel@pmac.infradead.org>
	<1148049289.3199.38.camel@sauron.oktetlabs.ru>
	<1148050786.3875.175.camel@pmac.infradead.org>
	<1148056886.3875.211.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 17:43:07 +0100
Message-Id: <1148056987.3875.213.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 17:41 +0100, David Woodhouse wrote:
> Just using rubin compression on the summary nodes would save 35% (thus
> they'd be 1.25% of total size) -- by reducing the average to 1708
> bytes per eraseblock. 

Sorry, that should be 30%. 1708 is 69.5% of 2457.

-- 
dwmw2
