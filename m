Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1yXg-0001Ei-A8
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 13:56:16 +0000
Message-ID: <1404222952.6841.92.camel@sauron.fi.intel.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Matt Hevern <matt.hevern@gmail.com>
Date: Tue, 01 Jul 2014 16:55:52 +0300
In-Reply-To: <20140618044434.GA9331@gmail.com>
References: <20140618044434.GA9331@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-06-18 at 14:44 +1000, Matt Hevern wrote:
> Hi All,
> 
> 
> I am running UBIFS on freescale i.MX28, kernel 2.6.35.3, based on
> freescale's IMX tree:
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/?h=imx_2.6.35_maintain
> The flash is NAND, Micron 256MiB (MT29F2G08)

In your dumps I see that there are errors related to UBIFS not being
able to find an LEB for the garbage collector. And I remember we fixed
bugs in this area.

For example, "6fb4374 UBIFS: fix GC LEB recovery", and there were more.
Search for 'ubifs_rcvry_gc_commit' in 'git log -p fs/ubifs/recovery.c'.

-- 
Best Regards,
Artem Bityutskiy
