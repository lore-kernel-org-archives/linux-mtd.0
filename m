Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikana.artecdesign.ee)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CtlRF-0007wR-4c
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2005 06:34:22 -0500
Date: Wed, 26 Jan 2005 13:34:08 +0200 (EET)
From: Olav Kongas <ok@artecdesign.ee>
To: Dan Post <postster@gmail.com>
In-Reply-To: <Pine.LNX.4.44.0501070939500.32416-100000@pcx>
Message-ID: <Pine.LNX.4.44.0501261240470.7811-100000@pcx>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.6.10, Sharp chip, incorrect numparts (was: Intel chip)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> My flash chip is lh28f640bfhe-pbtl90, 64M (4Mbit x 16), and
> as Sharp docs say, its model no. is LHF64F12. It has 8
> 4Kword blocks at the beginning of the flash and then 127
> 32Kword blocks. There is just a single flash chip on the
> board.

I took another look at the misconfiguration of Sharp flash
chip in >=2.6.10 kernel. Briefly, the situation is the
following.

The failure to correctly detect the chip occurs in
cfi_intelext_partition_fixup(). In the PRI table of the
chip, the major and minor version numbers are '1' and '3',
and the 32-bit Optional Feature & Command Support field has
bit 9 set. Therefore, the probing for multiple partitions is
tried, and it fails.

The documentation about the abovementioned chip doesn't
contain any information about the chip's PRI table layout.
Also, I haven't been able to find any other documentation
showing Sharp's extensions to the PRI table nor have I found
their interpretation of the bit 9 in Optional Feature field.
Therefore, pointers to such information would be
appreciated.

The "fix" that I use for now is just to avoid partition
probing for sharp chips.

Olav
