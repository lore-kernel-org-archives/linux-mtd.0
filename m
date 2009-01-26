Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LRNch-0007La-B1
	for linux-mtd@lists.infradead.org; Mon, 26 Jan 2009 09:19:18 +0000
Subject: Re: UBIFS volume corruption (bad node at LEB 0:0)
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Bergeron <mho.linux-mtd@b2n.ca>
In-Reply-To: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
References: <8EEAB966-52F4-48A3-8FCA-A50BBE8486B7@b2n.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Jan 2009 11:18:23 +0200
Message-Id: <1232961503.22350.89.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-01-07 at 23:13 -0500, David Bergeron wrote:
> Hello all,
> 
> I'm getting some sort of volume corruption problem with UBIFS after  
> doing
> rootfs updates using rsync.
> 
> I've cooked up a minimalist test trying to eliminate possible  
> interference.
> The following steps will trigger the corruption almost every time.
> No  
> errors
> or warnings are produced during this procedure, every step behaves
> as  
> expected:

David,

we think we've fixed this bug. The reason was that when mounting RO,
then re-mounting read-write, the orphan sub-system was not properly
initialized. The fix is available at the ubifs-v2.6.28.git tree. I've
back-ported all stable changes and fixes to the tree. You need this fix:

commit b3718eedf4ab91307f64a79ad8eb911ca401bd22
Author: Adrian Hunter <ext-adrian.hunter@nokia.com>
Date:   Mon Jan 26 10:55:40 2009 +0200

    UBIFS: ensure orphan area head is initialized

    When mounting read-only the orphan area head is
    not initialized.  It must be initialized when
    remounting read/write, but it was not.  This patch
    fixes that.

    [Artem: sorry, added comment tweaking noise]
    Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

However, I recommend you to incorporate all UBI/UBIFS changes since
2.6.28, because there were other bug-fixes.

You may find information about back-port trees here:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

Please, send us some feed-back about whether your problem has been
solved.

-- 
> 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
