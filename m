Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17p7l9-0003zM-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Sep 2002 14:42:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1024499619.9366.25.camel@geb> 
References: <1024499619.9366.25.camel@geb> 
To: Chris AtLee <catlee@canada.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Problems unlinking files 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 11 Sep 2002 14:42:21 +0100
Message-ID: <27421.1031751741@redhat.com>
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

On Wed, 19 June 2002, catlee@canada.com said:
> I've noticed some problems with unlinking files with JFFS2 in my linux
> 2.2.18 port.  After unlinking a file, it doesn't appear in the
> directory listing, but if I do an 'ls' on the unlinked file, I can
> still get information on the file.  I can still read and write to the
> file, but it refuses to show up in the directory listing. After I
> unmount the JFFS2 partition and remount it the file isn't there at
> all.

This is now fixed, isn't it? Is the 2.2 port now working completely?

--
dwmw2
