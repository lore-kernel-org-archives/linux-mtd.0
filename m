Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1The5J-0005Mv-C5
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2012 10:26:11 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 1/3] mtd: nand/docg4: add support for writing in reliable
 mode
References: <1354910843-5598-1-git-send-email-mikedunn@newsguy.com>
 <1354910843-5598-2-git-send-email-mikedunn@newsguy.com>
Date: Sun, 09 Dec 2012 11:25:57 +0100
In-Reply-To: <1354910843-5598-2-git-send-email-mikedunn@newsguy.com> (Mike
 Dunn's message of "Fri, 7 Dec 2012 12:07:21 -0800")
Message-ID: <87hanvplmy.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> The controller on the docg4 has a "reliable" mode, where consecutive 2k pages
> are used in parallel.  The initial program loader (IPL) on my Treo 680 expects
> the secondary program loader (SPL) to be written in this mode.  This patch adds
> support for writing data in reliable mode, by way of a module parameter.
> Support for reading in this mode (as the IPL does) is not supported yet, but
> alternate (even-numbered) 2k pages written in reliable mode can be read normally
> (odd-numbered pages will contain junk and generate ecc errors).

Hi Mike,

I was considering adding this to the docg3 driver, but I didn't because I was
afraid what would happen if you change this mode *after* mounting a partition.
Imagine you have your rootfs mounted on /dev/mtd2, and u-boot is in /dev/mtd1 :
wouldn't changing the reliable mode to write "mtd1" corrupt all writes to mtd2 ?

The patch I chose to make barebox (instead of u-boot) work was to write the
barebox part with a special tool which "duplicates" pages, which ends up in the
same flash writes.

My feeling here is this mode should be "mtd partition bound", not driver bound
if you want to have it in your driver.

Cheers.

--
Robert
