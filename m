Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c7BV-0006po-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 17:27:49 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: [patch] doc_stage1.S : GRUB on DoC
Date: Tue, 6 Aug 2002 12:26:45 -0400
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0208021755070.3723-100000@server.superbt.com>
In-Reply-To: <Pine.LNX.4.44.0208021755070.3723-100000@server.superbt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020806162717.SAGG23732.sccrmhc01.attbi.com@there>
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

Ilguiz Latypov wrote:
> Both 07-29 and 0.92 patches work with 32M DoC 2000 on the Advantech PCA
> 6753 F board.

Ilguiz,

Both patches are now working great on both the faster PC and the P133 system.

I finally figured out what is going on with Grub not working on a P133 
system:  The grub_firmware produced on a Debian system (gcc 2.95.4) works 
fine on both machines; grub_firmware from a Gentoo system (gcc 2.95.3) works 
on the faster PC, but not on the P133.

> I believe GRUBSTART is the offset value while GRUBLOADSEG is the segment 
> value, i.e. GRUBSTART == (GRUBLOADSEG << 4) + GRUBLOADOFS.

My apologies for misunderstanding your earlier post.  Your latest change puts 
the manufacturer/id code where I had intended it to be; I goofed on the 
offset value in the original patch.

It's my understanding that these DoC 2000/Millennium patches will soon be 
incorporated into the official Grub sources.   Until then, if anyone else is 
interested in trying the latest patches, here's a summary:

GRUB CVS: http://savannah.gnu.org/cvs/?group=grub
Patch: grub-2002-07-29-doc.patch (MTD cvs)
On a Debian system, use: 
aclocal-1.6 && automake-1.6 --add-missing && autoconf2.50

GRUB 0.92: http://www.gnu.org/software/grub/grub-0.92.tar.gz
Patch: grub-0.92-doc.patch (MTD cvs)

Instructions:
http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html
(With these patches, use "--enable-diskonchip-mil" for all DoC Millenniums)

Mark
