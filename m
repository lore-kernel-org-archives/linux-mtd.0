From: David Woodhouse <dwmw2@infradead.org>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <dblm4l$802$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>
	<1121867130.12903.15.camel@localhost.localdomain>
	<dblm4l$802$1@sea.gmane.org>
Content-Type: text/plain
Date: Wed, 20 Jul 2005 10:19:14 -0400
Message-Id: <1121869156.12903.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-07-20 at 16:12 +0200, Martin Egholm Nielsen wrote:
> So you think this is what consumes the time?

Quite feasibly. You spoke of a multi-megabyte file, and the performance
on such files is definitely a lot better than it was. Run it with
profiling and we'll see -- tell us where it's spending all its time, and
we'll see if we can improve that part of the code.

-- 
dwmw2
