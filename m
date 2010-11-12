Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PGyew-00020B-54
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2010 18:47:39 +0000
Received: by ewy19 with SMTP id 19so1991815ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2010 10:47:34 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 12 Nov 2010 13:47:33 -0500
Message-ID: <AANLkTi=rE+u0OiGXj=HxGYRB9F4p228GpHzGadJm+982@mail.gmail.com>
Subject: change in how ubiformat works
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I use a sequence as follows: " flash_erase - ubiformat - nanddump -
verify " to confirm that a UBI image was properly stored in NAND
flash.  I realize that flash_erase is not recommended because it
destroys erase counters, but this is only done on virgin flash so
should not be an issue.

However, I recently upgraded the mtd-utils, and particularly ubiformat
from 1.4 to 1.5, and now I see that what I read back (via nanddump)
does not match the original UBI image.  Can anyone confirm whether
ubiformat.c changes sometime between 1.4 and 1.5 would result in this
behavior?  I have looked at ubiformat.c changes and am wondering if it
has to do with image sequence number support.

Thanks,
twebb
