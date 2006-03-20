Received: from smtp3.home.se ([212.78.199.23])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLM2M-0006AN-Hj
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 10:11:25 -0500
From: "Tomas E" <tomas2003@home.se>
To: linux-mtd@lists.infradead.org
Date: Mon, 20 Mar 2006 15:31:29 +0100
MIME-Version: 1.0
Message-ID: <1142865089.c65a3380tomas2003@home.se>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a problem with writing to a Intel Strata flash
and then doing a warm reset.

I have a jffs2 mounted on mtdblock which uses cfi_cmdset_0001 according to =
the console messages.

When I do a simple write echo "xxxx" > /MyFlash/test.text
the flash writes but remain in the state that only 0080
can be read when I ioremap some address in the flash.

My problem is that the bootcode also exist in the flash so if the watchdog =
resets the everything just hang.

I running 2.6.10 but also tried to updated to mtd-snapshot-20060317 but suc=
cess with that version either.

Is this a expected behavior or shouldn't a write
put the flash in a readable state (on a hardware level)?

What should I do to debug this?

Thanks in advance, Tomas
