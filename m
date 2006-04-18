Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FVoSK-0007E8-3w
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 07:33:27 -0400
Date: Tue, 18 Apr 2006 13:32:58 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20060418113258.GA4720@wohnheim.fh-wedel.de>
References: <4444C8FD.1070406@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4444C8FD.1070406@inf.u-szeged.hu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 18 April 2006 13:09:49 +0200, Ferenc Havasi wrote:
> 
> If JFFS2 is used as root filesystem, syslogd/klogd can cause problems,
> because every log line are written out individually, so the log file
> will contain a lot of small nodes. Because a log file can be very large
> (over 30M in our case) it can cause large memory consuption and can make
> the system very slow, especially at opening it after next reboot
> (becauseof the large frag-tree). Unforunatelly garbage collecting also
> does not help, because none of the nodes is obsocalated.

obsoleted

> The small patch below can help a lot. The idea behind it is very simple:
> if there is a write request to write out the end of a page (4K) it will
> write out the full page, not only the last part of it. The result of it
> will be:
> - small nodes will be obscolated
> - garbage collector will be able to delete them
> - after next reboot, when the file is under opening only this "large"
> node will be read, the small node will not be parts of the frag tree
> (thanks to Artem's improvement)
> 
> We think it can be usefull not only for us, and now we don't know about
> any drawback.

Very interesting idea.  I had another one which is more complicated
and it looks like yours is much better.  Just for completeness, here
is mine:
o For every node with less than one page uncompressed size, account it
  some dirty space for it.
o Node header is 68 bytes (on 32bit).  Therefore, a node with 1/2 page
  uncompressed size should cause 34 bytes of "dirty space".
o Complete formula:
  dirty_space = 68 * (PAGE_SIZE - ri->csize) / PAGE_SIZE
o Possibly don't account dirty space if node is last node of a file.

With this little hack, tiny nodes would be garbage collected for being
"dirty space".

Maybe both approaches would make sense, but yours is much simpler and
should be used independently of whether mine makes sense.

> May we commit it into CVS?

Fine with me.  CVS was recently declared dead, so you might want to
commit to git instead.  dwmw2 sent a mail about it to the list.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
