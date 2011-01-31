Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PjscF-0006gz-Nm
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2011 12:12:20 +0000
Received: by iwn38 with SMTP id 38so5508008iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jan 2011 04:12:18 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 31 Jan 2011 12:12:17 +0000
Message-ID: <AANLkTikxCVO5Qs4amo1cCgnYVD3fYZdKh2in4e+X5EFV@mail.gmail.com>
Subject: Testing a device using mtd_stresstest
From: David Peverley <pev@sketchymonkey.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I've got a new board that has been experiencing occasional issues that
look to be MTD related so I've been running the tests from linux
2.6.31.12 from under drivers/mtd/tests to see if I can trigger
failures. It's worth mentioning also that I've built our kernel with
CONFIG_MTD_NAND_VERIFY_WRITE enabled. The flash we're using is a
Micron MT29F2G08AADWP, see datasheet :
    http://download.micron.com/pdf/datasheets/flash/nand/2_4_8gb_nand_m49a.pdf
(Same part but different operating voltage)
The only caveat is that that this new board has changed to our
previous board in that the R/B line is now fixed high and  instead of
being connected to a GPIO and a 25uS chip_delay has been specified.

I was wondering if anyone might have experienced anything similar and
might be able to nudge me in the right direction on this one :

Question 1 : The  mtd_subpagetest (which I suspect should fail as the
device doesn't support sub-pages). I googled around and found a
reference that maybe I should add NAND_NO_SUBPAGE_WRITE to the
options. I tried this and it made no difference. Out of curiosity I
grepped through drivers/mtd and found that *no* drivers actully use
this bit anyway...! Is it reasonable to ignore this or ought I address
it? Should I set the flag and expect it to have an effect?

Question 2 : The mtd_stresstest test fails after anywhere between 1000
and 200,000 operations. I'm certain this is a Bad Sign. It fails in
nand_base.c:nand_write_page() in the verification step enabled by
MTD_NAND_VERIFY_WRITE. When I tested this on our previous board (that
ostensibly works fine) it failed the stress test after 2.6M operations
instead. Should I be expecting to never see a failure of the stress
test or is an occasional verify failure reasonably expected?

Thanks for any suggestions!

~Pev
