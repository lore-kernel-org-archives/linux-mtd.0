Received: from mail08.webhosting-verizon.net ([209.238.3.57] helo=mail05a.webhosting-verizon.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16rm0S-0000bx-00
	for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2002 21:32:52 +0100
Received: from www.forcedpotato.com (168.143.87.180)
	by mail08.gte-hosting.net (RS ver 1.0.60s) with SMTP id 168470789
	for <linux-mtd@lists.infradead.org>; Sun, 31 Mar 2002 15:32:47 -0500 (EST)
From: "David Cooper" <david@forcedpotato.com>
To: "Linux MTD" <linux-mtd@lists.infradead.org>
Subject: MTD Always Formats Blocks on Startup
Date: Sun, 31 Mar 2002 15:41:46 -0500
Message-ID: <AIEOIMKIOAAJKHJOGAEFAENOCCAA.david@forcedpotato.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I'm trying to put together an embedded Linux system using a DOC 2000 as the
boot device.

So far I have managed to re-compile my 2.4.2 kernel so as to recognise the
DOC and allow me to setup partitions and install an ext2 filesystem.

The problem now is that upon loading the DOC and NFTL drivers the system
goes into a lengthy process of "formatting blocks".  Typical messages on
startup are as follows:

...
...
...
Formatting block 5321
_DOC_WaitReady called for out-of-line wait
_DOC_WaitReady called for out-of-line wait
Formatting block 5322
_DOC_WaitReady called for out-of-line wait
_DOC_WaitReady called for out-of-line wait
Formatting block 5323
...
...
...

This adds a good 2 minutes or so to my boot process as well as worrying the
living daylights out of me.

Despite this drama my partitions and ext2 filesystem seem to remain intact.

Any ideas?

Cheers,

David Cooper
