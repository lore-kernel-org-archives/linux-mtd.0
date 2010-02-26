Received: from mail-qy0-f181.google.com ([209.85.221.181])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nkzm5-0007zj-H9
	for linux-mtd@lists.infradead.org; Fri, 26 Feb 2010 12:58:37 +0000
Received: by qyk11 with SMTP id 11so17872qyk.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Feb 2010 04:58:32 -0800 (PST)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
Date: Fri, 26 Feb 2010 18:28:32 +0530
Message-ID: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
Subject: Release of UBIL: ubi with log
From: Brijesh Singh <brij.singh@samsung.com>
To: David Woodhouse <dwmw2@infradead.org>, Artem.Bityutskiy@nokia.com,
	Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: brijesh.s.singh@gmail.com, rohitvdongre@gmail.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
 It gives me great pleasure in sharing UBIL: ubi with log.  We have
added logging functionality to ubi for reducing mount time.
UBIL uses the "same source base of UBI". The logging functionality can
be added or removed at compile time using "make menuconfig option".

We have seen mount time reduction of 50% in 1GB NAND. We are expecting
even better results for larger flash memories.

The source code of UBIL can be found in the following git tree:
http://git.infradead.org/users/brijesh/ubi-2.6.git

We have tested ubil for samsung nand and onenand. The test results can
be found in the following git tree:
http://git.infradead.org/users/brijesh/ubil_results

We are working on utilities and design document of UBIL. I will share
those as soon as possible.

If someone wants to try, please follow the instructions:
make menuconfig
         select ubi as module
         select ubil feature.
compile ubi module.

1) First mount of ubil is little different than ubi.

insmod ubi mtd=1,ubinize.
 (Second parameter "ubinize" is introduced to avoid accidental loss of data.)
insmod ubifs
mount ubifs

2)For next mounts:
insmod ubi mtd=1
insmod ubifs
mount ubifs

Though UBIL is functionally complete,there is a lot of scope for
optimizations. All the help is very much appreciated.


Thanks and Regards,
Brijesh
