Received: from mail-pd0-f174.google.com ([209.85.192.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAai3-0002Ap-17
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 07:14:04 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so3084272pdi.33
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 00:13:38 -0700 (PDT)
Date: Sat, 17 Aug 2013 15:09:12 +0800
From: Woody Wu <narkewoody@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: meaning of use_nand_ecc parameter
Message-ID: <20130817070912.GA2645@zuhnb712.ap.bm.net>
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

Hi,

By catting /proc/yaffs2, I see use_nand_ecc=1 and no_tags_ecc = 0. I
don't quit understand what these values means to me.

For use_nand_ecc, does it means that yaffs is depending on MTD's ecc
functions and not its own ecc?

Thanks in advance.

-- 
I can't go back to yesterday - because I was a different person then
