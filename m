From: David Woodhouse <dwmw2@infradead.org>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <20040127100613.GA16078@angel.research.nokia.com>
References: <20040127100613.GA16078@angel.research.nokia.com>
Content-Type: text/plain
Message-Id: <1075202008.1633.26.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 27 Jan 2004 11:13:28 +0000
Content-Transfer-Encoding: 7bit
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 case insensitivity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-27 at 12:06 +0200, Jarkko Lavinen wrote:
> How difficult it would be to add support for file name case
> insensitivity to JFFS2?

Fairly, It's ugly, evil and painful when FAT tries to do it, and it
wouldn't be any less so in JFFS2. I suspect you'd be far better off
doing it in userspace. 

In the kernel, you end up with 'interesting' dcache coherency problems
and charset problems and generally end up going insane.

What precisely is the problem you're trying to solve? 

-- 
dwmw2
