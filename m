Received: from mail.allot.com ([199.203.223.202] helo=exg.allot.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JaO8-0004zH-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2001 13:43:45 +0100
Message-ID: <3B49AA0B.90D8870D@allot.com>
Date: Mon, 09 Jul 2001 15:56:43 +0300
From: Felix Radensky <felix@allot.com>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: nftl_format/nftlmount problems.
References: <7DF7BFDC95ECD411B4010090278A44CA0A3B8E@ATVX> <1688.994671164@redhat.com>
Content-Type: text/plain; charset=us-ascii
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

Hi, all

I'm using the latest CVS mtd code with 2.4.2 kernel from Monta Vista.
My platform is a custom PowerPC 405GP based board. I'm booting my
kernel from 96M DiskOnChip 2000. The technique uses M-Systems
DFORMAT utility to create so called "binary" partition and store kernel
image on it. ROM monitor reads kernel image and loads it into memory.

This works ok. However, nftl code in linux kernel has problems calculating
the correct DOC geometry (I suspect endian issues). So I tried to use
nftl_format
(which supposed to handle big endian correctly), like this:

# nftl_format /dev/mtd0 606208

(my "binary" partition occupies 37 erase units).

The kernel still boots, but nftlmount code complains about not being able
to find a valid boot record.

If I run nftl_format on the entire DOC and boot via network, everything
if fine, i.e. nftl code correctly recognizes DOC geometry.

Please advice.

Thanks in advance.

Felix.
