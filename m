Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Knqz-0006rR-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 23:23:05 +0100
Date: Thu, 20 Jun 2002 00:23:03 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Chris AtLee <catlee@canada.com>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Updating the root partition
Message-ID: <20020620002303.A21586@wohnheim.fh-wedel.de>
References: <1024499892.9366.31.camel@geb>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1024499892.9366.31.camel@geb>; from catlee@canada.com on Wed, Jun 19, 2002 at 11:18:12AM -0400
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

On Wed, 19 June 2002 11:18:12 -0400, Chris AtLee wrote:
> I've got linux booting off of a cramfs partition sitting on mtdblock1. 
> Is it possible to overwrite the mtdblock1 partition while linux is
> running?  The kernel itself isn't located on the root partition.  I've
> tried just copying a new cramfs image to /dev/mtd1 but I get errors on
> decompressing next time I try and boot.

- Use /dev/mtdblock1. The char device does not erase any blocks, so
  you end up ||ing the old and new data.
- Do the flashing soon after reboot and make sure, all necessary
  binaries are in RAM. Power-cycle afterwards, as you sure don't want
  to load good-as-random code and execute it, albeit it is only the
  userspace.

Jörn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
