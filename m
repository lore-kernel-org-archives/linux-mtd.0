Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LNmsy-0001MI-MC
	for linux-mtd@lists.infradead.org; Fri, 16 Jan 2009 11:29:15 +0000
Subject: Re: Problem with ubiformat
From: Artem Bityutskiy <dedekind@infradead.org>
To: Johan <kungjohan@gmail.com>
In-Reply-To: <de9b121e0901150854w7b88abcendc36e4a5311890aa@mail.gmail.com>
References: <de9b121e0901150854w7b88abcendc36e4a5311890aa@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Jan 2009 13:29:33 +0200
Message-Id: <1232105373.25068.25.camel@localhost.localdomain>
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

On Thu, 2009-01-15 at 17:54 +0100, Johan wrote:
> I have a problem with ubiformat on one of my boards, the same command
> works on another board.
> 
> #
> # ubiformat /dev/mtd0
> ubiformat: mtd0 (NAND), size 1073741824 bytes (1024.0 MiB), 131072
> eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
> libscan: scanning eraseblock 8191 -- 100 % complete
> ubiformat: 2567 eraseblocks have valid erase counter, mean value is 3
> ubiformat: 5606 eraseblocks are supposedly empty
> ubiformat: bad eraseblocks: 2014, 2096, 2994, 4144, 4458, 5869, 6514,
> 6546, 6547, 7793, 8183, 8184, 8185, 8186, 8187, 8188, 8189, 8190, 8191
> ubiformat: warning!: only 2567 of 8173 eraseblocks have valid erase counter
> ubiformat: erase counter 0 will be used for all eraseblocks
> ubiformat: note, arbitrary erase counter value may be specified using -e option
> ubiformat: continue? (yes/no)  yes
> ubiformat: use erase counter 0 for all eraseblocks
> ubiformat: formatting eraseblock 2571 -- 31 % complete  ubiformat:
> error!: failed to erase eraseblock 2571
>            error 5 (Input/output error)
> #
> 
> I am using mtd-utils snapshot from 2008-12-18.
> 
> Any ideas to what the problem might be?

I guess eraseblock number 2571 is bad and ubiformat cannot erase it.
Probably we should teach ubiformat taking care about bad eraseblocks by
marking them as bad. It should be easy. Try flash_eraseall - does it
complain about eraseblock 2571?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
