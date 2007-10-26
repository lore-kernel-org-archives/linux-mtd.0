Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IlJcN-0004xs-TZ
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 08:28:34 +0100
Message-ID: <472195A0.90500@nokia.com>
Date: Fri, 26 Oct 2007 10:22:08 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "ext Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: UBIFS - Current Status?
References: <B1EDF20A6EAAD74EA65E46F774F1784502B9DBE4@orsmsx413.amr.corp.intel.com>
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F1784502B9DBE4@orsmsx413.amr.corp.intel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Johnson, Charles F wrote:
> Just curious on what the current state of UBIFS ??  

UBIFS is still under development.  It's state could be described as
testable meaning that all file system operations are implemented
and seem to work.

We are currently working on two areas: 1) recovery from unclean unmounts,
and 2) what we call "budgeting", the ability to know if everything in
VFS caches will actually fit on the flash.  Other outstanding items are:
support for different compression schemes (only LZO presently), support
for extended attributes, userspace tools (e.g. mkfs.ubifs).

We hope to have something that could be considered production-ready
some time early next year.

> I'm looking for a solution which could support very large MLC NAND flash
> design.  UBIFS+UBI looks like it a good candidate. 

While UBIFS is designed to be scalable, UBI scales linearly with the
number of eraseblocks.  UBI is probably ok up to MTD's 4GiB limit.  Bigger
than that and someone needs to fix MTD's 32-bit size limitation and write
UBI2.
