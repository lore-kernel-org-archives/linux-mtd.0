Received: from topsns2.toshiba-tops.co.jp ([202.230.225.126])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGtOG-0001qx-57
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2006 02:47:27 -0500
Date: Wed, 08 Mar 2006 16:47:19 +0900 (JST)
Message-Id: <20060308.164719.10248383.nemoto@toshiba-tops.co.jp>
To: chuckmeade@mindspring.com
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <IIEEICKJLNEPBBDJICNGIENBKDAA.chuckmeade@mindspring.com>
References: <20060308.102944.124550323.nemoto@toshiba-tops.co.jp>
	<IIEEICKJLNEPBBDJICNGIENBKDAA.chuckmeade@mindspring.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MTD] cmdlineparts.c: fix to allow partition offset zero for
 any partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> On Tue, 7 Mar 2006 22:21:31 -0500, "Chuck Meade" <chuckmeade@mindspring.com> said:
>> I wish it was merged to mainline someday ...

chuck> That is quite a coincidence!  I viewed your patch -- since
chuck> yours has the additional advantage of using UINT_MAX instead of
chuck> 0xffffffff, plus it is already in -mm, it makes much more sense
chuck> to proceed with your version of the patch.

Actually, that is third trial.  I sent almost same patch to this ML on
Aug 2003 and Oct 2003, but could not get any response at that time.

---
Atsushi Nemoto
