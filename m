From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <416414B7.1060509@inf.u-szeged.hu>
References: <416414B7.1060509@inf.u-szeged.hu>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1097159648.318.42.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 07 Oct 2004 15:34:08 +0100
Content-Transfer-Encoding: 8bit
Cc: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>,
	linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: bug in nodemgmt.c?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-10-06 at 17:52 +0200, Ferenc Havasi wrote:
> Dear All,
> 
> During the final testing of my model-based-patch I think I found a bug 
> in fs/jffs2/nodemgmt.c
> 
> In function jffs2_mark_node_obsolete() at the part of "Merge with the 
> next node in the physical list, if there is one and if it's also 
> obsolete" there is a comment: "we don't need to check jeb->last_node".
> 
> Is it right? Because I think we should deal with jeb->last_node here, or 
> should not use "D1(ACCT_PARANOIA_CHECK(jeb));" statement any more, but 
> now it is used by also this function.
> 
> ACCT_PARANOIA_CHECK walk throught the nodes (using next_phys) and if at 
> the end of the list is not equals to jeb->last_node than halts. 
> Unfortunatelly with simple "NULL pointer dereference" without any 
> usefull messages.
> 
> Just say I'm right and I fix this problem in the CVS (a single
> "if (jeb->last_node == n) jeb->last_node=ref;" line into nodemgmt.c and 
> better message in ACCT_PARANOIA_CHECK).

I think you're probably right. Øyvind, didn't we come across this
already? Did you commit an older version of your patch?

-- 
dwmw2
