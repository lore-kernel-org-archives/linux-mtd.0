Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ6kA-00027S-JF
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 23:21:36 +0000
Received: by mail-pf0-x242.google.com with SMTP id u26so6665648pfd.2
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 16:21:13 -0700 (PDT)
Date: Thu, 8 Jun 2017 16:21:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, dwmw2@infradead.org,
 andrew@lunn.ch, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170608232110.GG102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <20170601184340.GA102137@google.com>
 <20170601224712.6a81a458@bbrezillon>
 <20170601220156.GD102137@google.com>
 <20170602110406.49eda282@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170602110406.49eda282@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 02, 2017 at 11:04:06AM +0200, Boris Brezillon wrote:
> BTW, MTD_NO_ERASE is not the only problem we have with UBI or JFFS2.
> Are we guaranteed that an erase operation fills an eraseblock with
> ones? Don't we have mem technologies that are filling them with zeros?
> Note that mtdram is artificially setting the mem-region to 0xff in its
> dummy erase operation, so maybe it's a implicit rule that ->_erase() is
> supposed to fill eraseblocks with 0xff.

I've wondered about the general assumption. But mtdram isn't really a
good example, because it clearly calls itself a "test mtd device". So it
makes sense it would emulate common MTDs (i.e., flash memory).

Brian
