From: David Woodhouse <dwmw2@infradead.org>
To: Jun Sun <jsun@mvista.com>
In-Reply-To: <20031104164431.K16745@mvista.com>
References: <20031104164431.K16745@mvista.com>
Content-Type: text/plain
Message-Id: <1068023691.6065.7.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 05 Nov 2003 09:14:51 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time configure and
	partitioning (take 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-11-04 at 16:44 -0800, Jun Sun wrote:
> David,
> 
> Since you did not give any preference on how board should
> pass partition info to physmap, I just picked a reasonable
> one.

Sorry for the lack of response. Been beating up JFFS2 with LTP and it's
been, erm, 'interesting'. S'fixed now though :)

> Is this patch now good enough to apply?  Thanks.

I'd still prefer to do it without any static variables in physmap.c. 

-- 
dwmw2
