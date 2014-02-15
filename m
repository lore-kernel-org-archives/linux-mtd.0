Received: from mail-oa0-x22a.google.com ([2607:f8b0:4003:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEUe5-0002Lv-LG
 for linux-mtd@lists.infradead.org; Sat, 15 Feb 2014 02:06:22 +0000
Received: by mail-oa0-f42.google.com with SMTP id i7so15524441oag.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Feb 2014 18:05:57 -0800 (PST)
Received: from ld-irv-0074 (5520-maca-inet1-outside.broadcom.com.
 [216.31.211.11])
 by mx.google.com with ESMTPSA id ii8sm21939401obb.11.2014.02.14.18.05.54
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
 Fri, 14 Feb 2014 18:05:55 -0800 (PST)
Date: Fri, 14 Feb 2014 18:05:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD/NAND user-space ABI: interesting observation
Message-ID: <20140215020552.GR18440@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Perhaps it's a non-issue, but I was realizing during some testing today
that there is no sound way to determine (in user-space) if a particular
raw read (i.e., from a /dev/mtdX) resulted in either a correctable bit
error or an uncorrectable ECC error. The current method used by
mtd-utils' nanddump is more or less a sequence of:

  ioctl(fd, ECCGETSTATS, &stat1);
  read(fd, buf, len);
  ioctl(fd, ECCGETSTATS, &stat2);
  if (stat2.corrected > stat1.corrected)
  	correctable bitflip;
  if (stat2.failed > stat1.failed)
  	uncorrectable error;

This is completely unsound if you are performing concurrent reads on the
same MTD device node (e.g., running two concurrent 'nanddump'
processes). The issue is pretty obvious once you study it, but I was
left scratching my head this afternoon when I had two separate nanddump
processes reporting bitflips at exactly the same times, at different
addresses!

I think this issue is probably not that important, since user-space raw
MTD accesses are really only good for testing/debugging, and any sane
solution would utilize a translation layer or special-purpose filesystem
(UBI, UBIFS, JFFS2, etc.) to handle -EUCLEAN and -EBADMSG (which is
presented properly in the MTD in-kernel API).

Just food for thought. Have a nice weekend!

Brian
