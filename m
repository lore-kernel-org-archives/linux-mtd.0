Received: from [202.106.127.236] (helo=harbournetworks.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19dNHB-0001PU-Vv
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 05:55:26 +0100
From: "=?GB2312?Q?=CF=AF=D3=FD=D0=A2?=" <xiyuxiao@harbournetworks.com>
To: linux-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Date: Fri, 18 Jul 2003 12:57:23 +0800
Message-Id: <E19dNHB-0001PU-Vv@pentafluge.infradead.org>
Content-Type: text/plain;
      charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Subject: AM29LV160DB 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am now working with NEC VR4131 and flash AM29LV160DB.
I use Harhat Linux.
I have a trouble now.Can anyone help me?
I configure MTD subsystem as below:
    MTD support
    Direct char devices access to MTD devices
    Caching block device access to MTD devices
    Detect flash chips by CFI
    Older drivers for non-CFI chips
    JEDEC device support
    Mapping drivers for chip access

But when I boot my target,the AM29LV160DB can not be=
 detected!!!:(
Did I make some mistakes?Please help me.

               Yuxiao Xi
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1xiyuxiao@harbournetworks.com
=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A12003-07-18
