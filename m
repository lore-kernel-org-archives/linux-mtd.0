Received: from matrix01.home.net.pl ([212.85.112.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BcqY6-000358-QJ
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2004 15:03:16 -0400
Message-ID: <40D88281.2080300@gazeta.pl>
Date: Tue, 22 Jun 2004 21:03:29 +0200
From: MarekSk <mareksk7@gazeta.pl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Intel compatible flash device issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  I have encountered a problem using M28W160CT flash chip as
  LINUX character device. This chips is compatible with INTEL standard
  command set.

  Since the chip is locked after power-up, there is required to unlock
  some blocks before write operation. Of course, this can be done
  from any application using MEMUNLOCK command.

  Once the MEMUNLOCK command is executed (without any error)
  the flash chip remains in the "command" state.
  This state after MEMUNLOCK blocks any read access to data stored
  in the flash.

  Reviewing the cfi_cmdset_0001.c file I have found that single block
  (un)lock algorithm (do_xxlock_oneblock) is different from these
  described in the following documents:
  - STM M28W160CT datasheet (figure 22)
    <http://www.st.com/stonline/books/pdf/docs/7358.pdf>
  - Intel 28F160C3 datasheet (figure 20)
    <ftp://download.intel.com/design/flcomp/datashts/29064518.pdf>

  It seems that there should be issued the reset command (0xff) just
  after lock (0x01)/unlock (0xd0) command.

  Any comments, ideas ?

Thanks in advance,
   MarekSk
