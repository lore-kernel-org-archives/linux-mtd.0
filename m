Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BE89l-0000qb-Kk
	for linux-mtd@lists.infradead.org; Thu, 15 Apr 2004 15:47:57 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1BE89k-0008N5-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Apr 2004 16:47:56 +0200
Date: Thu, 15 Apr 2004 16:47:56 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <20040415144756.GV29551@tkeitel001.bln.innominate.local>
References: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
Sender: Tino Keitel <tino.keitel@innominate.com>
Subject: Re: JFFS2 writes fail with 2.4.25
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 15, 2004 at 16:40:31 +0200, Tino Keitel wrote:
> Hi folks,
> 
> I just switched from 2.4.19 to 2.4.25 and was afraid that there are
> problems with file creation. Here is an example:
> 
> # mkdir x

[a lot of debugging output]

> The system is an Intel XScale IXP425 board (ARM little endian) with 16
> MB NOR flash. I use the JFFS2 from the 2.4.25 kernel. Any hints what's
> wrong here?

Maybe I should mention that the system hangs after the mkdir command.

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/
