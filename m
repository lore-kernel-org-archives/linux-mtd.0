Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17giyE-0003kH-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2002 10:37:10 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Massive file corruption
Date: Mon, 19 Aug 2002 11:37:06 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEEMHFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
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

Hi again

For the second time there has been massive file corrution on one of our
boards.

In /bin there was 3 files that had been corrupted, the first 4K was all zeroes.
In /usr/bin, a ls gave me lots of Input/Output error and a load of CRC
errors in dmesg.

After reboot, ls in /usr/bin did not report Input/Output errors but there
was more corrupted files in there, with the first 4K zeroed.

Before this happened there was a lot of file I/O. ftp files to board, unpack them with rpm
delete old files etc.

No errors was reported during boot by JFFS2. Using the stable branch from ~3-4 months ago.

Any ideas?

            Jocke 
