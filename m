Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QoKDq-0000dd-41
	for linux-mtd@lists.infradead.org; Tue, 02 Aug 2011 19:01:46 +0000
Received: by wyf23 with SMTP id 23so62433wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Aug 2011 12:01:44 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 2 Aug 2011 12:01:43 -0700
Message-ID: <CAN8TOE8VHm2jMkFonfi+4bvmP8ORVVdXA0vb3-X8+XCGfTuAaw@mail.gmail.com>
Subject: 'nandwrite -o' on MLC NAND
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>, Matthew Creech <mlcreech@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

For a while, I've been having problems with using `nandwrite -o' on
MLC NAND flash. Nandwrite is never able to write the combined data+OOB
properly and instead leaves the flash filled with junk. This is,
apparently, because `nandwrite -o' writes to the flash twice, once for
the page data and once for the OOB data. This is not allowed on MLC
NAND, which allow only single writes.

This is a problem with the user interface to the kernel as well as
with nandwrite itself, since there is no interface that nandwrite can
use to write data+OOB to flash in a single write. As I see it, we need
to do three things:

1) Support a (new?) ioctl that handles writing data+oob in one go. I'm
not sure if an existing interface can be extended or if this actually
has to be a new one...
2) Update nandwrite (i.e., update the libmtd routines in mtd-utils) to
utilize the new interface when possible.
3) Ensure that the raw/no-ECC options for nandwrite are operational
with the new interface (i.e., `nandwrite -r')

Comments? Has this been tried before?

BTW, I think some of the internal kernel interface is already there
for writing data+OOB; there's just no external user interface.

Thanks,
Brian
