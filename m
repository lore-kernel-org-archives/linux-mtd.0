Received: from mail-pb0-f51.google.com ([209.85.160.51])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U1ldu-0000tA-H9
 for linux-mtd@lists.infradead.org; Sat, 02 Feb 2013 22:33:03 +0000
Received: by mail-pb0-f51.google.com with SMTP id un15so2629460pbc.24
 for <linux-mtd@lists.infradead.org>; Sat, 02 Feb 2013 14:33:00 -0800 (PST)
From: Adam Thomas <adamthomas1111@gmail.com>
To: adrian.hunter@intel.com
Subject: Re: [PATCH 1/2] UBIFS: fix use of freed ubifs_orphan objects
Date: Sat,  2 Feb 2013 22:32:30 +0000
Message-Id: <1359844351-5889-1-git-send-email-adamthomas1111@gmail.com>
In-Reply-To: <510BC1D9.8040308@intel.com>
References: <510BC1D9.8040308@intel.com>
Cc: linux-mtd@lists.infradead.org, adamthomas1111@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 1, 2013 at 5:23 AM, Adrian Hunter wrote:
> OK
> 
> Needs an signed-off line.

Thanks for the review.  Added.

> You need to set cmt to zero in write_orph_node().

Fixed.

Thanks,
-Adam
