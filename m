Received: from web9607.mail.yahoo.com ([216.136.129.186])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19CgbO-0002QQ-Lr
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 15:05:58 +0100
Message-ID: <20030505140612.95087.qmail@web9607.mail.yahoo.com>
Date: Mon, 5 May 2003 07:06:12 -0700 (PDT)
From: Mike Kelly <mgkelly59@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1051860123.21608.26.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Need help understanding jffs2 mount activity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- David Woodhouse <dwmw2@infradead.org> wrote:
> On Thu, 2003-05-01 at 22:40, Mike Kelly wrote:
> > Next we ran an operation, where a file has 65
> bytes
> > appended to it until it reaches a size of about
> 700
> > kB. When this was completed, the bootup time
> increased
> > to 75 seconds and has not gone back down upon
> > subsequent reboots. 
> 
> That's expected. 
> 
> > So, does the garbage collection
> > upon mount/bootup differ between deleted files and
> > appended files? When a file is opened, appended,
> then
> > closed, does the jffs2 filesystem essentially copy
> the
> > file to a new location along with the new data,
> then
> > marks the old file as obsolete?
> 
> No, it writes out the new bytes in a new log entry,
> leaving the rest as
> it was. See
> http://sources.redhat.com/jffs2/jffs2.pdf
> 
> So instead of a whole file made up of 4KiB nodes as
> usual, you've ended
> up with a file made entirely of 65-byte nodes, each
> with its own CRC to
> check etc. 
> 
---
David, thanks for your reply.

If the 700KiB file is copied then deleted, would this
result in 4KiB nodes for the new file?  If so,
shouldn't the bootup time be quicker, since there are
less nodes to CRC check?  The bootup time seems to
remain the same, even after several reboots.

--
Mike K.

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
