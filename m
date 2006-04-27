From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Bazhenov <atrey@emcraft.com>
In-Reply-To: <200604271140.37488.atrey@emcraft.com>
References: <200604271140.37488.atrey@emcraft.com>
Content-Type: text/plain
Date: Thu, 27 Apr 2006 14:59:20 +0100
Message-Id: <1146146360.11909.456.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: scan leaves dirent for inode which has no valid data
	nodes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-04-27 at 11:40 +0400, Dmitry Bazhenov wrote:
> 1. Should the scan process during mounting mark as obsolete dirent
> nodes which has no valid data nodes?

Maybe. We don't keep track of such things though -- and when we detect
it we _know_ there's something wrong, so it's not clear that writing to
the file system is the right thing to do.

> 2. Is this a bug when such dirent exists and there is no chanse to 
> create/read/write a file with the same name?

You should still be able to unlink it.

-- 
dwmw2
