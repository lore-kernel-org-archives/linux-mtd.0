Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uGoS-0003yt-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2002 19:23:04 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'Simon Posnjak'" <simon@activetools.si>
Cc: "'linux-mtd'" <linux-mtd@lists.infradead.org>
Subject: RE: jffs, jffs2
Date: Wed, 25 Sep 2002 11:22:42 -0700
Message-ID: <003a01c264c0$8bc72da0$7e00000a@bergamot>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1032952690.2913.27.camel@klada.dyndns.org>
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

> I wasn't to clear: I will be using 2.4.18.

I don't know.  I haven't run 2.4.18 on ARM in a long time.  (Why are you
deliberately using an old kernel?)

> So to mount an empty mtd partition as jffs/jffs2 all I have to do is
to
> erase it (using erase utilty from mtd)and then just do mount -t jffs2
> /dev/mtdblock5 /somedir. Is this correct?

You need to use mkfs.jffs2, just as you would use mkfs.ext2 to create an
ext2 filesystem.  See my original prescription.

-ch
