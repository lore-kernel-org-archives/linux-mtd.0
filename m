Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1893Km-0008L2-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 13:01:32 +0000
Date: Tue, 5 Nov 2002 14:31:42 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jeffrey Lim <jfsworld@fastmail.fm>
Cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: MTD CVS: missing JFFS2?
Message-ID: <20021105133142.GB24128@wohnheim.fh-wedel.de>
References: <20021105081328.7AE732FD4D@server4.fastmail.fm>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021105081328.7AE732FD4D@server4.fastmail.fm>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 November 2002 08:13:30 +0000, Jeffrey Lim wrote:
> Hi guys, i follow the instructions found at
> sources.redhat.com/jffs2 and download the latest MTD source from CVS.
> 
> under the patches subdir, there is a patchin.sh, which i run.
> 
> However, after taking a look at patchin.sh, i realize that the jffs2 code
> doesnt seem to get patched at all!, only jffs. Am i therefore to assume
> that the MTD CVS does not contain any jffs2 code at all, and that i
> should just use the jffs2 code from the stock kernel?

CVS definitely contains jffs2 code, but I never used patchin.sh. By
hand, you would switch fs/jffs2 and include/linux/jffs2*.

Hope that helps.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories
