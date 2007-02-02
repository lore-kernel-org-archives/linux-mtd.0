Received: from sorrow.cyrius.com ([65.19.161.204])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HD2fs-0005RB-CS
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 12:58:13 -0500
Date: Fri, 2 Feb 2007 18:57:55 +0100
From: Martin Michlmayr <tbm@cyrius.com>
To: "Williams, Dan J" <dan.j.williams@intel.com>
Subject: Re: Oops parsing empty RedBoot partition with 2.6.20-rc7
Message-ID: <20070202175755.GG24587@deprecation.cyrius.com>
References: <20070202155607.GA31304@deprecation.cyrius.com>
	<0C7297FA1D2D244A9C7F6959C0BF1E520148F6A0@azsmsx413.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0C7297FA1D2D244A9C7F6959C0BF1E520148F6A0@azsmsx413.amr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
	buytenh@wantstofly.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Williams, Dan J <dan.j.williams@intel.com> [2007-02-02 10:22]:
> > With current git (2.6.20-rc7) I get the following oops when it's
> > trying to parse the RedBoot partition.  This is on an IOP13xx based
> > board (Intel iq81340mc).  I guess the problm happens because I don't
> > have any RedBoot partitions.  Note that 2.6.19 work fine.
> > 
> I am seeing this as well.  After a 'fis init' it starts working, but our
> customer reference boards normally ship without a partition table.  As
> you said this works fine on 2.6.19.  You may be able to do a 'git
> bisect' if iop13xx support was added before this regression...

It was caused by:

commit 0b47d654089c5ce3f2ea26a4485db9bcead1e515
Author: Yoshinori Sato <ysato@users.sourceforge.jp>
Date:   Fri Dec 1 10:01:50 2006 +0000

    [MTD] redboot partition combined fis / config problem

    Can't analyze FIS directory in CYGSEM_REDBOOT_FLASH_COMBINED_FIS_AND_CONFIG
    really.

-- 
Martin Michlmayr
http://www.cyrius.com/
