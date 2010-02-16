Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NhISG-0007Zr-JS
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 08:06:52 +0000
Subject: Re: JFFS2 on NAND and when is file on media?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF8328EA8B.384612F6-ONC12576C5.0061F0C9-C12576C5.00626376@transmode.se>
References: <OF8328EA8B.384612F6-ONC12576C5.0061F0C9-C12576C5.00626376@transmode.se>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Feb 2010 10:05:32 +0200
Message-ID: <1266307532.11659.176.camel@localhost>
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

On Tue, 2010-02-09 at 18:54 +0100, Joakim Tjernlund wrote:
> I have been using JFFS2 for many years on NOR flash but never on NAND.
> I wonder if NAND has the same guaranties as NOR as to when one
> can expect file contents to be safely on media so one can pull the power
> without loss of data?

It is the same, except of the write-buffer. JFFS2 syncs it periodically
in 'write_super()'. So power cuts may lead to data losses, because the
write-buffer is lost. Please, read about the write buffer here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writebuffer

This is about UBIFS, but it is the same concept as in JFFS2.

> Is the the whole file safe once close(2) returns?

No, because of the write-buffer.

>  If not, what do
> I have to do flush all outstanding data to media?

Use normal 'sync' or 'fsync()'. Here you can read about UBIFS, but it is
also somewhat relevant to JFFS2 and for all FSes:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_writeback

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
