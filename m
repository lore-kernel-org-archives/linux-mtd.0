Received: from mail1.bemta8.messagelabs.com ([216.82.243.194])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4XDN-0006ry-Hf
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 18:03:14 +0000
Subject: Re: [RFC] Special handling for NAND_CMD_PAGEPROG and NAND_CMD_READ0
To: linux-mtd <linux-mtd@lists.infradead.org>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Mason <slash.tmp@free.fr>, Sebastian Frias
 <sf84@laposte.net>
References: <58236370.1050105@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <582364C6.5010203@sigmadesigns.com>
Date: Wed, 9 Nov 2016 19:02:46 +0100
MIME-Version: 1.0
In-Reply-To: <58236370.1050105@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2016 18:57, Marc Gonzalez wrote:

> Sample code to generate some discussion around having the framework
> send I/O commands (for read_page and write_page) when it is dealing
> with "high-level" NFCs that send the commands themselves.

According to mtd_speedtest, read speed goes from 12.0 to 13.8 MB/s
(15% improvement). Write speed is unchanged. (Is that expected?)

BEFORE:

[  399.571081] mtd_speedtest: MTD device: 1
[  399.575073] mtd_speedtest: MTD device size 536870912, eraseblock size 131072,
	page size 2048, count of eraseblocks 4096, pages per eraseblock 64, OOB size 64
[  399.590138] mtd_test: scanning for bad eraseblocks
[  399.598289] mtd_test: scanned 4096 eraseblocks, 0 are bad
[  402.804550] mtd_speedtest: testing eraseblock write speed
[  463.958290] mtd_speedtest: eraseblock write speed is 8574 KiB/s
[  463.964259] mtd_speedtest: testing eraseblock read speed
[  507.512545] mtd_speedtest: eraseblock read speed is 12040 KiB/s
[  510.746349] mtd_speedtest: testing page write speed
[  572.262041] mtd_speedtest: page write speed is 8523 KiB/s
[  572.267485] mtd_speedtest: testing page read speed
[  616.225641] mtd_speedtest: page read speed is 11928 KiB/s
[  619.457760] mtd_speedtest: testing 2 page write speed
[  680.780774] mtd_speedtest: 2 page write speed is 8550 KiB/s
[  680.786394] mtd_speedtest: testing 2 page read speed
[  724.532680] mtd_speedtest: 2 page read speed is 11986 KiB/s
[  724.538303] mtd_speedtest: Testing erase speed
[  727.768600] mtd_speedtest: erase speed is 162569 KiB/s
[  727.773777] mtd_speedtest: Testing 2x multi-block erase speed
[  729.428229] mtd_speedtest: 2x multi-block erase speed is 318135 KiB/s
[  729.434714] mtd_speedtest: Testing 4x multi-block erase speed
[  731.087529] mtd_speedtest: 4x multi-block erase speed is 318329 KiB/s
[  731.094015] mtd_speedtest: Testing 8x multi-block erase speed
[  732.746219] mtd_speedtest: 8x multi-block erase speed is 318522 KiB/s
[  732.752704] mtd_speedtest: Testing 16x multi-block erase speed
[  734.404625] mtd_speedtest: 16x multi-block erase speed is 318522 KiB/s
[  734.411197] mtd_speedtest: Testing 32x multi-block erase speed
[  736.062671] mtd_speedtest: 32x multi-block erase speed is 318716 KiB/s
[  736.069262] mtd_speedtest: Testing 64x multi-block erase speed
[  737.721396] mtd_speedtest: 64x multi-block erase speed is 318522 KiB/s
[  737.727966] mtd_speedtest: finished


AFTER:

[   43.104453] mtd_speedtest: MTD device: 1
[   43.108432] mtd_speedtest: MTD device size 536870912, eraseblock size 131072,
	page size 2048, count of eraseblocks 4096, pages per eraseblock 64, OOB size 64
[   43.123486] mtd_test: scanning for bad eraseblocks
[   43.131522] mtd_test: scanned 4096 eraseblocks, 0 are bad
[   44.786687] mtd_speedtest: testing eraseblock write speed
[  105.775235] mtd_speedtest: eraseblock write speed is 8597 KiB/s
[  105.781206] mtd_speedtest: testing eraseblock read speed
[  143.754987] mtd_speedtest: eraseblock read speed is 13808 KiB/s
[  146.985881] mtd_speedtest: testing page write speed
[  208.400273] mtd_speedtest: page write speed is 8537 KiB/s
[  208.405718] mtd_speedtest: testing page read speed
[  246.811007] mtd_speedtest: page read speed is 13653 KiB/s
[  250.041459] mtd_speedtest: testing 2 page write speed
[  311.306291] mtd_speedtest: 2 page write speed is 8558 KiB/s
[  311.311911] mtd_speedtest: testing 2 page read speed
[  349.519121] mtd_speedtest: 2 page read speed is 13724 KiB/s
[  349.524745] mtd_speedtest: Testing erase speed
[  352.754362] mtd_speedtest: erase speed is 162569 KiB/s
[  352.759539] mtd_speedtest: Testing 2x multi-block erase speed
[  354.413433] mtd_speedtest: 2x multi-block erase speed is 318135 KiB/s
[  354.419920] mtd_speedtest: Testing 4x multi-block erase speed
[  356.072314] mtd_speedtest: 4x multi-block erase speed is 318522 KiB/s
[  356.078808] mtd_speedtest: Testing 8x multi-block erase speed
[  357.730646] mtd_speedtest: 8x multi-block erase speed is 318522 KiB/s
[  357.737131] mtd_speedtest: Testing 16x multi-block erase speed
[  359.388793] mtd_speedtest: 16x multi-block erase speed is 318716 KiB/s
[  359.395365] mtd_speedtest: Testing 32x multi-block erase speed
[  361.046569] mtd_speedtest: 32x multi-block erase speed is 318716 KiB/s
[  361.053140] mtd_speedtest: Testing 64x multi-block erase speed
[  362.704484] mtd_speedtest: 64x multi-block erase speed is 318716 KiB/s
[  362.711055] mtd_speedtest: finished
