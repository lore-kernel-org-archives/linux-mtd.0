Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Syqn-0003rf-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Dec 2002 12:16:58 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C9D6@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: 'Rekha Nagananda' <rekhanaga@hotmail.com>,
	linux-mtd@lists.infradead.org
Subject: RE: Erase sector size
Date: Mon, 30 Dec 2002 04:47:29 -0800
MIME-Version: 1.0
Content-Type: text/plain
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

(un-cross-posting...)

I think that would depend on how the chips are connected.  Assuming they're
16 bits wide, if they're configured as two banks of 16bit wide memory, then
you would erase a 128KB block.  If they're configured in parallel as a
composite 32-bit wide device, then you would erase 256KB blocks.

-----Original Message-----
From: Rekha Nagananda [mailto:rekhanaga@hotmail.com] 
Sent: Monday, December 23, 2002 10:19 AM
To: linux-mtd@lists.infradead.org; jffs-dev@axis.com
Cc: rekhanaga@hotmail.com
Subject: Erase sector size


Hi,

I am using prpmc815 Motorola's PMC board, it has two 16MB 28F128 Intel 
flash. According to Intel's data sheet sector size is 128KB. Does anybody 
know - when we erase a sector does it erase 128KB or 256KB? (since prpmc815 
has 2 flash chips).

Thanks,
Rekha




_________________________________________________________________
MSN 8 with e-mail virus protection service: 3 months FREE*. 
http://join.msn.com/?page=features/virus&xAPID=42&PS=47575&PI=7324&DI=7474&S
U= 
http://www.hotmail.msn.com/cgi-bin/getmsg&HL=1216hotmailtaglines_eliminatevi
ruses_3mf


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
