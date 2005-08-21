From: David Woodhouse <dwmw2@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <0ILH00A5RUY3DW@mmp1.samsung.com>
References: <0ILH00A5RUY3DW@mmp1.samsung.com>
Content-Type: text/plain
Date: Sun, 21 Aug 2005 09:36:43 +0100
Message-Id: <1124613404.3407.31.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: LTP fs test results on OneNAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-08-20 at 09:06 +0900, Kyungmin Park wrote:
> rwtest01                       FAIL       2
> rwtest02                       FAIL       2
> rwtest03                       FAIL       2
> rwtest04                       FAIL       2
> rwtest05                       FAIL       2

> Total Failures: 5

These are solely due to the lack of shared writable mappings, yes?

LTP tests correctness -- I like to do JFFS2 runs with some stress
testing, like fsx-linux (and another tool called 'holey' which stresses
the extent mapping stuff -- http://david.woodhou.se/holey.c).

-- 
dwmw2
