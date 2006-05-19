From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060519060559.GA17270@wohnheim.fh-wedel.de>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<20060519060559.GA17270@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 May 2006 11:08:52 +0100
Message-Id: <1148033332.3875.102.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2006-05-19 at 08:05 +0200, Jörn Engel wrote:
> Worse, what happens if the power fails?  Do we block creat/mkdir/mknod
> until summary is written?  Could be a long time.  Or do we return to
> userspace and claim we've written everything while in fact we haven't?

That's why I said it could happen only during GC.

-- 
dwmw2
