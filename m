Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1217494095.3454.55.camel@pmac.infradead.org>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<1217481315.9048.64.camel@sauron>
	<200807302356.29835.david-b@pacbell.net>
	<1217491258.9432.20.camel@sauron>
	<1217494095.3454.55.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Thu, 31 Jul 2008 10:09:18 +0100
Message-Id: <1217495358.3454.76.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	trimarchimichael@yahoo.it, jwboyer@gmail.com,
	akpm@linux-foundation.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-07-31 at 09:48 +0100, David Woodhouse wrote:
> And we don't have to worry too much about proving a lower bound on the
> size we'll want to use for the summary

Or indeed whether it's an upper bound or a lower bound we'd need to
calculate. More tea required...

-- 
dwmw2
