Received: from mailserver6.natinst.com ([130.164.80.6]
 helo=spamkiller06.natinst.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULMdW-0007iB-6Q
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2013 23:53:38 +0000
Date: Thu, 28 Mar 2013 18:54:13 -0500
From: Josh Cartwright <josh.cartwright@ni.com>
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: UBI(FS) issues: how to debug?
Message-ID: <20130328235413.GE24548@beefymiracle.amer.corp.natinst.com>
References: <20130328185355.GD24548@beefymiracle.amer.corp.natinst.com>
 <CACwUX0MgTeKvsDq_wJVwc0WBC1Sk3wK_3aeR=Fi+H-VnUMLa0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACwUX0MgTeKvsDq_wJVwc0WBC1Sk3wK_3aeR=Fi+H-VnUMLa0A@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, Mar 28, 2013 at 02:05:14PM -0600, David Mosberger-Tang wrote:
> Josh,
> 
> Probably a stupid question, but are you sure the on-die ECC controller is
> being used?  The stock kernel has no support for on-die controller.

Hey David-

Not a stupid question at all.  The driver we've been using has been
hacked to support on-die ECC.  I was told that the NAND peripheral on
the SoC is limited to 1-bit ECC, so they are recommending Micron parts
with on-die ECC for use with Zynq.

http://git.xilinx.com/?p=linux-xlnx.git;a=blob_plain;f=drivers/mtd/nand/xilinx_nandps.c;hb=04d9378881401e71f83b8b4fea0abd71d33b4052

Now, it's still an open question as to whether it's implemented
properly.  There is some ambiguity in the Micron datasheet as to how
software is supposed to handle reading the on-die ECC status (and how it
should properly handle failures).  We're still trying to work this out.

Interestingly, after sending this email, we did confirm that at least
in the case of u-boot load-time CRC failures we were seeing, the on-die
ECC block was returning an un-correctable failure.

  Josh
