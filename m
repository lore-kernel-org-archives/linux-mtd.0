Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCOA2-0008EQ-SU
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 01:24:05 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MCO9v-0004Gz-DD
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 01:23:51 +0000
Received: from adsl-99-185-243-218.dsl.pltn13.sbcglobal.net ([99.185.243.218])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2009 01:23:51 +0000
Received: from nahor.j+gmane by adsl-99-185-243-218.dsl.pltn13.sbcglobal.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2009 01:23:51 +0000
To: linux-mtd@lists.infradead.org
From: Nahor <nahor.j+gmane@gmail.com>
Subject: Nandwrite's behavior in case of write failure
Date: Thu, 04 Jun 2009 18:23:39 -0700
Message-ID: <h09s2s$ar6$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

If the call to pwrite fails, nanwrite tries first to erase the block 
then to mark it as bad. If erase fails, nandwrite aborts. If setting the 
bad block flag fails, nandwrite just ignores it and go to the next block.

My questions are:
- Why erase the block?
- Probably linked to the first question, why abort if erase fails? Why 
not just ignore it and rely on the bad block flag?
- Why ignore the bad block flag error? If nandwrite can't set it and 
just goes on, the caller (app ou user) will think that everything is 
good. But when reading the partition later, the user will garbage when 
reaching that page.


Thanks,
	Nahor
