Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFXex-00072k-2Z
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 16:32:13 +0000
Date: Thu, 17 Jan 2008 17:26:01 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080117162601.GA6677@lazybastard.org>
References: <478F7E6D.8010300@parrot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <478F7E6D.8010300@parrot.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 January 2008 17:12:29 +0100, Matthieu CASTET wrote:
> 
> we have a 240 MB jffs2 partition with summary enabled and no 
> compression. We use 2ad8ee713566671875216ebcec64f2eda47bd19d git jffs2 
> version 
> (http://git.infradead.org/?p=mtd-2.6.git;a=commit;h=2ad8ee713566671875216ebcec64f2eda47bd19d)
> 
> 
> On this partition we have several file (less than 1 MB) and a big file 
> in the root (200 MB).
> 
> The big file is a FAT image that is exported with usb-storage (with usb 
> device) or mounted on a loopback device.
> 
> After some FAT operations, we manage to get in a situation were the 
> jffs2_garbage_collect_pass take 12 minutes.
> 
> jffs2_lookup for the big file (triggered with a ls in the root) take 12 
> minutes.
> 
> If we do a ls without waiting that jffs2_garbage_collect_pass finish, ls 
> takes 12 minutes to complete.

Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not
sure who cares enough to look at this.  My approach would be to 
$ echo t > /proc/sysrq_trigger
several times during those 12 minutes and take a close look at the code
paths showing up.  Most likely it will spend 99% of the time in one
place.

Jörn

-- 
...one more straw can't possibly matter...
-- Kirby Bakken
