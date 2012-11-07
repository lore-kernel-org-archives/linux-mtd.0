Received: from plane.gmane.org ([80.91.229.3])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWDFL-0000ww-Jc
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2012 21:33:17 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1TWDFM-0005kH-Tp
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2012 22:33:16 +0100
Received: from 206-248-185-91.dsl.teksavvy.com ([206.248.185.91])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2012 22:33:16 +0100
Received: from micah by 206-248-185-91.dsl.teksavvy.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2012 22:33:16 +0100
To: linux-mtd@lists.infradead.org
From: Micah Anderson <micah@riseup.net>
Subject: UBIFS error (pid 564): read_znode: bad indexing node at LEB 484:66064, error 2
Date: Wed, 07 Nov 2012 16:32:54 -0500
Message-ID: <87625h85fd.fsf@minnow.riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I had a power outage yesterday. When things came back and I tried to
boot my guruplug, I am not getting the following:

[   97.273764] UBIFS error (pid 564): read_znode: bad indexing node at LEB 484:66064, error 2
[   97.282188] UBIFS warning (pid 564): ubifs_ro_mode: switched to read-only mode, error -22
[   97.290431] UBIFS error (pid 564): ubifs_budget_space: cannot budget space, error -22

The filesystem is read-only and I can't seem to figure out how to get it
out of this state. As far as I can tell, there is no fsck.ubifs and I'm
at a loss at how to get things back to a reasonable state. I found the
'nandtest' command, which might be useful for mapping out bad areas, but
I'm not going to run that without a better clue at how likely I am to
brick things.

Thanks for any suggestions or help!
micah

-- 
