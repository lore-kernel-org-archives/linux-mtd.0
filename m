Received: from msr90.hinet.net ([168.95.4.190] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Igjb-0003CQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 03:22:43 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Krypton'" <krypton8@inwind.it>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: Howto create a new jffs2
Date: Fri, 14 Jun 2002 10:22:13 +0800
Message-ID: <001301c2134a$4bf3ed20$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <00a601c212fd$a5c3e5a0$0100a8c0@ester>
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

Try, mount -t jffs2 /dev/mtdblock4 <dir>

Steve Tsai

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of Krypton
Sent: Friday, June 14, 2002 1:13 AM
To: linux-mtd@lists.infradead.org
Subject: Howto create a new jffs2


I added my new 'test' MTD partition.
I'd like to add a new little home.jffs2
How can I mount a new little jffs2 partition when I have 
linux prompt ?
Thank you  

Creating 5 MTD partitions on "SA1100 flash":

0x00000000-0x00020000 : "firmware"

0x00020000-0x00040000 : "params"

0x00040000-0x00140000 : "kernel"

0x00140000-0x00fe0000 : "rootdisk"

0x00fe0000-0x01000000 : "test"


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
