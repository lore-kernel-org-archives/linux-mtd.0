From: David Woodhouse <dwmw2@infradead.org>
To: Bernhard Priewasser <bernhard.priewasser@in2soft.de>
In-Reply-To: <42DF4A22.4060705@in2soft.de>
References: <42DF4A22.4060705@in2soft.de>
Content-Type: text/plain
Date: Thu, 21 Jul 2005 10:13:10 -0400
Message-Id: <1121955191.20077.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: Releases? Versions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-21 at 09:09 +0200, Bernhard Priewasser wrote:
> i have just a simple question about JFFS2 & versioning. Too simple 
> perhaps... please be patient with me...
> 
> I'm confused about the version numbers of JFFS2, "JFFS2 version 2.2. 
> (NAND)" (out of a dmesg / boot) for example.

Those version numbers are very infrequently updated. We started at 2.0,
then updated to 2.1 in the very early days when we had to change the
format. Then the version number remained unchanged for a long time until
the NAND support was added and it was increased to 2.2.

The 2.4 kernel has JFFS2 2.1, and the 2.6 kernel has JFFS2 2.2. These
are the jffs2-2_4-branch and the HEAD of the CVS tree, respectively.

> If source code + CVS available: How can i determine the release version?
> If source code available: How can i determine the release version?
> How can i determine the release of JFFS2 currently running in a kernel?
> Is there some changelog "overview" (not only for single files)?

There isn't really an overall 'version' other than the one described
above, which isn't particularly useful. You can look at the $Id$ tags in
the files though, which will indicate the date on which the snapshot was
taken, if they're using a snapshot from CVS instead of whatever was
present in the kernel they started with.

-- 
dwmw2
