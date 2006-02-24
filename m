Received: from wproxy.gmail.com ([64.233.184.193])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FCVB4-0001Jp-A3
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 00:07:46 -0500
Received: by wproxy.gmail.com with SMTP id i3so537926wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Feb 2006 21:07:36 -0800 (PST)
Message-ID: <f9d2a5e10602232107y57accef1r3420d9b903d9cf4c@mail.gmail.com>
Date: Thu, 23 Feb 2006 22:07:36 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: FPGA NAND Interface tips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm providing some input on the NAND wire up, and FPGA design on a new
board (80200 + FPGA).  I'm currently using rtc_from4.c and s3c2410.c
as examples.

So I'm thinking the following for a basic setup:

reed solomon encoder
Bit in the FPGA to reset the reed solomon encoder
place in the FPGA to read out rs codes from last written/read block
CLE/ALE as address lines
Read/Busy connected as gpio/interrupt (multiple chips connect to multiple l=
ines)

Also, when writing/reading to a single address, the 80200 will not
burst, and round trip time is horrid, especially when talking to IO
devices. Would a FIFO with a 32 byte interface be a good solution to
this? maybe with 16 entries (512 bytes)? I realize that DMA would be
more ideal, but a fifo seems like it might be simplier.

Does anyone have any paticular pet peeves when dealing with their NAND
interface?
