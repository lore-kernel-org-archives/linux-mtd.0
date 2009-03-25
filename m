Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmMer-00060g-6A
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 06:32:19 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Mar 2009 08:32:05 +0200
Message-Id: <1237962725.14602.98.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-03-24 at 11:04 -0600, Eric Holmberg wrote:
> Hi Adrian,
> 
> > Please enable UBIFS debugging and set the UBIFS Default message level
> to 3.
> 
> Thanks for the response.  Enabling UBIFS debugging and setting to level
> 3 only provides slightly more information.  
> 
> [42949375.480000] UBIFS: recovery needed
> [42949376.450000] UBIFS error (pid 1): ubifs_scan: corrupt empty space
> at LEB 4:44512
> [42949376.460000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corrupted data at LEB 4:44512
> [42949376.470000] UBIFS error (pid 1): ubifs_scanned_corruption: first
> 4096 bytes from LEB 4:44512
> [42949376.490000] UBIFS error (pid 1): ubifs_scan: LEB 4 scanning failed
> [42949376.540000] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
> space at LEB 4:480
> [42949376.550000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corrupted data at LEB 4:480
> [42949376.560000] UBIFS error (pid 1): ubifs_scanned_corruption: first
> 4096 bytes from LEB 4:480
> [42949376.580000] UBIFS error (pid 1): ubifs_recover_leb: LEB 4 scanning
> failed
> [42949376.600000] VFS: Cannot open root device "ubi0:rootfs" or
> unknown-block(0,0)

There should be more, they are probably just not printed to the console.
Try typing dmesg or booting with "ignore_loglevel" option in the kernel
command line. For more information, please read the "Debugging messages"
here:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
