Received: from borg.org ([208.218.135.231])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15SkEj-00015z-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Aug 2001 20:03:53 +0100
Date: Fri, 3 Aug 2001 15:09:21 -0400
From: Kent Borg <kentborg@borg.org>
To: Linux Mtd <linux-mtd@lists.infradead.org>,
  Abraham vd Merwe <abraham@2d3d.co.za>
Subject: Building MTD with JFFS2
Message-ID: <20010803150921.C20809@borg.org>
References: <20010731175442.I10857@borg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20010731175442.I10857@borg.org>; from kentborg@borg.org on Tue, Jul 31, 2001 at 05:54:42PM -0400
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

On Tue, Jul 31, 2001 at 05:54:42PM -0400, I wrote:
> Hello, a newbie here, and I thought I was making good progress
> (debugging why I couldn't talk to our flash at all), and then I got
> confused over sources.

And now I am getting closer.

Following e-mailed advice of Abraham vd Merwe <abraham@2d3d.co.za> I
used the infradead.org sources.  He sent me a script that copied the
right cvs-ed files into the right places in the regular 2.4 kernel
tree, but that left me with no configuration mention of JFFS2 and a
compile error in the old JFFS directory.

Resorting to a little RTFM I looked at the mtd-jffs-HOWTO and followed
its approach ("sh patchin.sh /usr/src/linux"), and got the same
results: no mention of JFFS2 in the configuring and the same compile
error in linux/fs/jffs (inode-v23.c, line 93, no member named
s_maxbytes).

Looking at the mtd/patches/Configure.help I see mention of
CONFIG_JFFS2_FS and CONFIG_JFFS2_FS_DEBUG, I tried manually defining
them in autoconf.h as 1 and 3 respectively, and in linux/fs/Makefile I
changed the instances of jffs and JFFS to jffs2 and JFFS2 respectively.

This made my compile happy, but, though the make dep seems to have
visited the linux/fs/jffs directory, the make itself didn't.

Hmmm.  Ideas on how to get out of the newbie mud?


In the mean time, because we don't have CFI chips, I think I will look
into whether I need to write my own mtd driver.  (AMD and Intel chips,
but old ones.)


Thanks,

-kb, the Kent who is glad there are those who have been here before
him.
