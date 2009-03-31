Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LofGC-0002Gm-Vn
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 14:48:26 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 31 Mar 2009 17:45:43 +0300
Message-Id: <1238510743.20906.17.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-03-30 at 13:00 -0600, Eric Holmberg wrote:
> Here is a basic summary of my findings to date for debugging corruption
> of the root UBIFS volume which is located on NOR flash.  Please comment
> if you have any suggestions.
> 
> Physical Power Cycling
> ----------------------
> Physically cycling the power causes LEB empty block corruption after an
> average of 50 power cycles.  The problem typically occurs when power
> fails while UBIFS is doing a recovery from the previous power failure.
> 
> See attached log of boot showing the two defective LEB's (file is
> 2009-03-26-corrupt-LEB-empty-block--physical-power-cycling.txt).
> 
> Using reboot -f
> ---------------
> Using Reboot -f, the system was rebooted between 0 and 30 seconds after
> remounting the UBIFS partition for read/write access.

Did not look close enough, but could you please try to
enable UBI/UBIFS "extra checks". Disable the debugging
messages to prevent the flood, but the debugging should
be enabled.

With the extra checks everything will become much slower.
But UBI will have some useful checks. E.g., before writing,
it will read the region and make sure it writes to a region
which have all 0xFFs.

Let's see if we can catch some problem with that.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
