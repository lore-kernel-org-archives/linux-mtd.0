Received: from [213.97.115.166] (helo=madrid.hispafuentes.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15P6t5-0003SX-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jul 2001 19:26:32 +0100
Message-ID: <3B5DBF28.94BBF1A@hispafuentes.com>
Date: Tue, 24 Jul 2001 20:32:08 +0200
From: olea@hispafuentes.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Cc: juan@hispafuentes.com
Subject: Ask for some guidance...
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

   
Hi.

We are porting Linux to a kind of PDA built on a ELAN SC400 processor.
It has two Samsung KM29U128T flash chips running as an IDE hard disk.

The system runs DOS perfectly without drivers.

Our problem is that Linux can't see the IDE device.

Since the machine is designed and built by a third company (other than
our client) we don't have any information about the implementation.

We have investigated the machine and we have some suppositions:

        - the bios doesn't look modified to access the flash ide disk;
        - there isn't any Samsung flash controler chip in the board;
        - the board has some chips looking as programmable roms;
        - it's looks that this chips are a firmware for doing the FTL.


Our questions are:

        - How can we probe that there is a firmware doing the FTL and
which firmware is it?
	- Do you think we could access to the flash disk using MTD?

If you need more info, please ask it.

Thank you very much for your time.

-- 
	A.Ismael Olea González
	tlf +(34) 914 575 330
	mailto:olea@hispafuentes.com
