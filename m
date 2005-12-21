Received: from fmr19.intel.com ([134.134.136.18] helo=orsfmr004.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EoyfU-0001qV-57
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 02:45:51 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: kyungmin.park@samsung.com
In-Reply-To: <0IRU00ACK79L6E@mmp1.samsung.com>
References: <0IRU00ACK79L6E@mmp1.samsung.com>
Content-Type: text/plain
Date: Wed, 21 Dec 2005 15:40:05 +0800
Message-Id: <1135150805.28556.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 'Christian Lehne' <christian_lehne@gmx.de>, tglx@linutronix.de,
	linux-mtd@lists.infradead.org, 'Jarkko Lavinen' <jarkko.lavinen@nokia.com>,
	priewasser@gmail.com
Subject: RE: EBH with OneNAND doesn't work
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-12-21 at 16:24 +0900, Kyungmin Park wrote:
> Hi
> 
> As you know the OneNAND has only 16bit bandwidth
> When you access OneNAND with 8bit bandwidth, OneNAND can't work correctly
> 
> In the previous JFFS2 w/o EBH, there's no problem with OOB. 
> But JFFS2 w/ EBH is different. we have to handle byte access in OneNAND
> 
> p.s, Does it need to check byte access in 'offset', I never see that case.

I think it's OK not checking "offset" as long as the free_oob
exported by OneNAND driver is 16-bit-aligned. EBH is stored only
from the start of a free_oob area.
But not sure if other application will start to store data from
arbitrary offset within a free_oob area in the future.

Thanks,
Forrest
