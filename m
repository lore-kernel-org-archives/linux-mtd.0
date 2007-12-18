Received: from fk-out-0910.google.com ([209.85.128.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J4ebb-00065R-Em
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 15:43:45 +0000
Received: by fk-out-0910.google.com with SMTP id 18so3594348fkq.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Dec 2007 07:43:37 -0800 (PST)
Message-ID: <3adeeb410712180743o77233e51pcb544e3c4b286712@mail.gmail.com>
Date: Tue, 18 Dec 2007 09:43:37 -0600
From: Ramesh <sramesh23@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: JFFS2 errors - are these normal?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using linux 2.6.19 and ST micro NAND chip (256M) on a PowerPC
platform. After booting the OS, we install firmware on to the flash.
These firmware images are RPM packages. Once some packages are
installed, we start getting some ECC errors. I guess that's fine but
after a few more RPM installs, the errors seem more serious. Here's a
sample:

...
Node CRC 880608a4 != calculated CRC ade8c30b for node at 075ade08
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 162 bytes at 0x07540000 failed. returned -5, retlen 0
Not marking the space at 0x07540000 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 162 bytes at 0x07540000 failed. returned -5, retlen 0
Not marking the space at 0x07540000 as dirty because the flash driver
returned retlen zero
jffs2_flush_wbuf(): Write failed with -5
Recovery of wbuf failed due to a second write error
Write of 99 bytes at 0x07540000 failed. returned -5, retlen 0
Node CRC 880608a4 != calculated CRC ade8c30b for node at 075ade08
...

The jffs2 image is created with the following flags: -e 0x20000 -s
0x1000 -b -v -p -n
Then I use sumtool with -e 0x20000 -b -p.

At this point, the flash is pretty much unusable unless I reflash and
then the RPM installs start the cycle again. Is there any way I can
avoid this?

Thanks.
--Ramesh
