Received: from mdfmta004.mxout.tbr.inty.net ([91.221.168.45]
 helo=smtp.demon.co.uk)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYvFz-0001EI-OY
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 11:06:12 +0000
Received: from mdfmta004.tbr.inty.net (unknown [127.0.0.1])
 by mdfmta004.tbr.inty.net (Postfix) with ESMTP id 2FFDDA0C086
 for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2014 12:04:42 +0100 (BST)
Received: from mdfmta004.tbr.inty.net (unknown [127.0.0.1])
 by mdfmta004.tbr.inty.net (Postfix) with ESMTP id D95E2A0C08E
 for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2014 12:04:41 +0100 (BST)
Received: from [192.168.0.200] (unknown [80.176.156.169])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mdfmta004.tbr.inty.net (Postfix) with ESMTP
 for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2014 12:04:41 +0100 (BST)
Date: Tue, 30 Sep 2014 12:00:49 +0100 (BST)
From: steve <steve@baconbits.demon.co.uk>
To: linux-mtd@lists.infradead.org
Subject: UBI: Question about error checking in ubi_eba_write_leb()
Message-ID: <alpine.DEB.2.02.1409301158370.2556@ubuntu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is my first post to this mailing list, I think this is the right place for
  my question.

I think the error checking in ubi_eba_write_leb() may be wrong and may cause 
incorrect behaviour when extra checking is enabled in debugfs, here's the 
scenario I have a problem with:

ubi_eba_write_leb() calls  ubi_io_write_data() -> ubi_io_write() -> 
ubi_dbg_check_all_ff()

ubi_dbg_check_all_ff() will perform an mtd_read() which can fail with EBADMSG 
(if there is a failure to correct using ECC as in my case). This error code 
will bubble back up to ubi_eba_write_leb(), but recover_peb() will only be 
called if the error code was EIO. The question is should recover_peb() be 
called in this case as well?

Thanks for any help with this,
Steve
