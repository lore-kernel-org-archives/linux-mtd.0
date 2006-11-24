Subject: Re: JFFS2 - how does the new page allocated?
From: David Woodhouse <dwmw2@infradead.org>
To: hyunggook.yoo@oracle.com
In-Reply-To: <4566C070.1000405@oracle.com>
References: <4566C070.1000405@oracle.com>
Content-Type: text/plain
Date: Fri, 24 Nov 2006 10:17:04 +0000
Message-Id: <1164363424.19448.220.camel@pmac.infradead.org>
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

On Fri, 2006-11-24 at 18:50 +0900, Howard Yoo wrote:
> I'm currently analyzing the structure of JFFS2, for research reason.
> I have a simple question,
> 
> When JFFS2 allocates a new page to store the newly entering data, how
> does it select the new page? Does it allocate a new block for each new
> page request, or does it intelligently reuse the dirty marked page first
> to be more space efficient? I would like to get some hints on how JFFS2
> provisions pages and blocks..

I recommend you start by reading http://david.woodhou.se/jffs2.pdf

Then you should be able to ask questions which make slightly more sense
to me, and stand a better chance of getting a coherent answer :)

-- 
dwmw2
