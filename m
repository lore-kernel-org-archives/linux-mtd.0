From: David Woodhouse <dwmw2@infradead.org>
To: mike@bithead.com
In-Reply-To: <20041213223652.50142.qmail@web54704.mail.yahoo.com>
References: <20041213223652.50142.qmail@web54704.mail.yahoo.com>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 11:40:20 +0000
Message-Id: <1103629220.6111.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS1 vs JFFS2 compatibility
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-12-13 at 14:36 -0800, Mike Wellington wrote:
> Hi-
>   I know some guys who have JFFS v1 running on their Linux platform.
> 
> They want to know what (if anything) is liable to break when they
> try to go to JFFS2.
> 
>   They don't do anything fancy, just simple file operations 
> (open, write, close).
> 
> I told them there should be no problem, but they still
> want me to ask you experts.

There should be no problem. Obviously the on-medium format isn't
compatible and you'll need to recreate your file system, but anything
which worked on JFFS1 should continue to work on JFFS2 -- and more.

-- 
dwmw2
