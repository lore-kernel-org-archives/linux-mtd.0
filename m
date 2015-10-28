Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrPmv-00043V-Eq
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 12:25:09 +0000
Message-ID: <1446035085.12536.71.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff
 Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Bean Huo
 =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "(beanhuo)" <beanhuo@micron.com>
Date: Wed, 28 Oct 2015 14:24:45 +0200
In-Reply-To: <20151023101406.6d1490e5@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-10-23 at 10:14 +0200, Boris Brezillon wrote:
> I decided to go for the simplest solution (but I can't promise I
> won't
> change my mind if this approach appears to be wrong), which is either
> using a LEB is MLC or SLC mode. In SLC modes, only the first page of
> each pair is used, which completely address the paired pages problem.
> For now the SLC mode logic is hidden in the MTD/NAND layers which are
> providing functions to write/read in SLC mode.

Most of the writes go through the journalling subsystem.

There are some non-journal writes, related to internal meta-date
management, like from other subsystems: log, the master node, LPT,
index, GC.

In case of journal subsystem, in MLC mode you just skip pages every
time the "flush write-buffer" API call is used.

In LPT subsystem, you invent a custom solution, skip pages as needed.

In master - probably nothing needs to be done, since we have 2 copies.

Index, GC - data also goes via journal, so the journal subsystem
solution will probably cover it.


> Thanks to this differentiation, UBI is now exposing two kind of LEBs:
> - the secure (small) LEBS (those accessed in SLC mode)
> - the unsecure (big) LEBS (those accessed in MLC mode)

Is this really necessary? Feels like a bit of over-complication to the
UBI layer.

Can UBI care about itself WRT MLC safeness, and let UBIFS care about
itself?
