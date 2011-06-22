Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZGXz-0003ry-Fx
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 06:04:20 +0000
Received: by pzk28 with SMTP id 28so344448pzk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 23:03:28 -0700 (PDT)
Subject: Re: Preventing JFFS2 partial page writes?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Barada <peter.barada@gmail.com>
Date: Wed, 22 Jun 2011 09:04:11 +0300
In-Reply-To: <4DF789FC.1030305@gmail.com>
References: <4DF789FC.1030305@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308722655.18119.40.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-14 at 12:19 -0400, Peter Barada wrote:
> I'm using a Micron 512MB NAND which has an internal 4-bit ECC engine, 
> and am finding lots of ECC errors while using JFFS2.  The same NAND 
> works find using YAFFS so I know the underlying MTD driver works properly.
> 
> The big question I have is whether JFFS2 does partial page writes and if 
> so how to disable them.

JFFS2 does not use sub-pages so it should never do partial writes. I
think the ECC errors you see are because of JFFS2 using OOB area to
store clean markers.

-- 
Best Regards,
Artem Bityutskiy
