Received: from f95.pav1.hotmail.com ([64.4.31.95] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zxkx-0005dV-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2002 12:14:59 +0100
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: linux-mtd@lists.infradead.org
Cc: vijay.peshkar@wirp.com
Subject: my bootloader and mtd / cramfs
Date: Fri, 11 Oct 2002 11:14:27 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F95jdOfs53QsQsQPmf40001f2ae@hotmail.com>
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

Hi Friends,

Few queries..
1. Is there any documentation availible on cramfs?. Couldn't find any thru 
google, though saw lot of mail discussions?.
2. Want to use an inhouse built bootloader on my board. How to ensure that 
the ffs(jffs2 / cramfs) and mtd do not write to it(say partition tables 
etc.,)?.
3. Can I use FFS on only a certain part of flash and the rest as raw
(say) for storing my image?.

Regards,
Vijay

_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx
