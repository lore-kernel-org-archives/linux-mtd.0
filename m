Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4asC-0006J5-2u
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 15:30:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 524D719D11
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Mar 2011 17:30:22 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kGHZgv+dSf75 for <linux-mtd@lists.infradead.org>;
	Tue, 29 Mar 2011 17:30:21 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by anubis.se.axis.com (Postfix) with ESMTP id A958919D09
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Mar 2011 17:30:21 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
	by seth.se.axis.com (Postfix) with ESMTP id A54D43E12D
	for <linux-mtd@lists.infradead.org>;
	Tue, 29 Mar 2011 17:30:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	p2TFUL5m017063
	for <linux-mtd@lists.infradead.org>; Tue, 29 Mar 2011 17:30:21 +0200
Date: Tue, 29 Mar 2011 17:30:21 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: How to write to nand with an image containing oob data, including ECC?
Message-ID: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

In order to test an ECC algorithm (BCH in this case, as I recently posted=
=20
about), i want to write an image to a nand flash which contains bit=20
errors.

What I want to do, and I seem to remember doing this in the past, is to=20
dump the whole image, change a single bit, and write it back, including=20
the oob.

So what I'm doing is

$ nandwrite -o -n /dev/mtd3 /tmp/mtd3-badimage

where /tmp/mtd3-badimage contains an image including all oobs for all=20
pages.

However, this fails saying

Writing data to block 0 at offset 0x0
libmtd: error!: cannot write 2048 bytes to mtd3 (eraseblock 0, offset 0)
         error 22 (Invalid argument)
nandwrite: error!: /dev/mtd3: MTD write failure
            error 22 (Invalid argument)
Data was only partially written due to error
: Invalid argument

Using just -o doesn't work because it seems nandwrite writes the oob, but=
=20
then since it doesn't write the main page in raw mode, the ecc gets=20
overwritten. Strangely enough, the ECC doesn't seem to match the data=20
written, as I get uncorrectable errors when reading back (not just with=20
BCH, but also with the standard mtd built-in algorithm). Perhaps the oob=20
gets written twice, once with my data and once more with the calculated=20
ecc?

Is this a known bug, or are the some other options I should be using?

nandwrite is the latest from the git repository.

The kernel version I'm using is 2.6.35 .

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
