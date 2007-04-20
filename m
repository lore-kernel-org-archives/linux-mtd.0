Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hf0A0-0000bm-0P
	for linux-mtd@lists.infradead.org; Fri, 20 Apr 2007 16:56:53 -0400
Subject: Re: NAND device ID 0xd5 appears twice in nand_ids.c table
From: Thomas Gleixner <tglx@linutronix.de>
To: sasin@solomon-systech.com
In-Reply-To: <6334E09627481B4AA5C8DE1E69E19D3B06BF9703@SSLEXCHANGE.solomonsystech.com>
References: <6334E09627481B4AA5C8DE1E69E19D3B06BF9703@SSLEXCHANGE.solomonsystech.com>
Content-Type: text/plain
Date: Fri, 20 Apr 2007 22:57:06 +0200
Message-Id: <1177102626.22861.1.camel@chaos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-04-20 at 14:23 +0800, sasin@solomon-systech.com wrote:
> [resending w/o "Re:", apparently a "suspicious header"]
> The problem is that there is no geometry information in the ID bytes for
> the older parts with page size 512 bytes and below, which is the case
> for the 4MiB part.  Unsure if anyone has compiled a dump of ID bytes for
> the older parts so that there is some fixed pattern to rely upon to
> differentiate.

I just merged a patch, that excludes the old obsolete ID's from the
table.

http://git.infradead.org/?p=mtd-2.6.git;a=commit;h=1cf9827b6852d5d81130efbf2e777e50b7126d23

	tglx
