Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhM6Z-00082w-MX
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 12:00:44 +0000
Subject: Re: [PATCH 1/2] jffs:2 Move erasing from write_super to GC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFFB9662B3.8400DCA7-ONC12576CC.003F62F7-C12576CC.0040EE91@transmode.se>
References: <1266249781-27970-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1266310672.11659.197.camel@localhost>
	<OFAA60FE5A.4E16F45A-ONC12576CC.003285C2-C12576CC.0033188F@transmode.se>
	<1266313535.11659.203.camel@localhost>
	<OFFB9662B3.8400DCA7-ONC12576CC.003F62F7-C12576CC.0040EE91@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 13:59:14 +0200
Message-ID: <1266321554.11659.265.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2010-02-16 at 12:49 +0100, Joakim Tjernlund wrote:
> BTW, I see UBIFS is using CRC16 as well as CRC32. Is there a reason
> you are using CRC16 in UBIFS. Any particular reason for that? CRC16 is
> much slower than crc32 in linux since the CRC32 impl. was optimized
> by yours truly long time ago just because it was impacting mount time
> for JFFS2.

We use crc16 only for LPT (Leb Properties Tree). The tree is very
optimized to be as small as possible, and we protect very short pieces
of data, this is why crc16 was choosed.

Everything else is protected with crc32.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
