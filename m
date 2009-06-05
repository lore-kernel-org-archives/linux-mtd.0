Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MCYSC-0003Kl-3d
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 12:23:30 +0000
Subject: Re: UBIFS porting on onenand and on kernel 2.6.18
From: Artem Bityutskiy <dedekind@infradead.org>
To: naveen yadav <yad.naveen@gmail.com>
In-Reply-To: <9bde694e0906040504l4742b818p8fd3223dda719f31@mail.gmail.com>
References: <9bde694e0906020308r60e7627akcc01ed54bf63914c@mail.gmail.com>
	<9bde694e0906040504l4742b818p8fd3223dda719f31@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 05 Jun 2009 15:22:27 +0300
Message-Id: <1244204547.5847.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-06-04 at 17:34 +0530, naveen yadav wrote:
> Hi all,
> 
> i want to port UBIFS to my target board which is running on Linux
> 
> 2.6.18. and having samsung onenand.I want to check the performance of
> UBIFS. I need some idea.
> 
> shall i take UBI and UBIFS code from latest kernel source tree i.e
> 2.6.29. or shall i use GIT backward patch 2.6.24
> so which way is easy and best.

The easiest will be to start from the old and now unsupported 2.6.21
back-port:
http://git.infradead.org/users/dedekind/ubifs-v2.6.21.git

Then you should port the patches which are missing in the 2.6.21
back-port from the 2.6.24 back-port. This is the easiest way
to go, IMO.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
