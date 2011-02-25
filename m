Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PsvCd-0002q1-1c
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 10:47:15 +0000
Received: by wyf23 with SMTP id 23so1518155wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 02:47:13 -0800 (PST)
Subject: Re: mount ubi volume fails: No such device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lars Michael <lh_post@yahoo.com>
In-Reply-To: <664335.29092.qm@web30201.mail.mud.yahoo.com>
References: <664335.29092.qm@web30201.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:45:02 +0200
Message-ID: <1298630702.2798.45.camel@localhost>
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

On Fri, 2011-02-18 at 02:57 -0800, Lars Michael wrote:
> NAND read: device 0 offset 0x1, size 0xfffffff
> Skipping bad block 0x00000000
> Skipping bad block 0x00020000
> Skipping bad block 0x00040000
> <cut>
> Skipping bad block 0x0ffa0000
> Skipping bad block 0x0ffc0000
> Skipping bad block 0x0ffe0000
> NAND read from offset 10000000 failed -22
>  0 bytes read: ERROR
> -> nand 
> 
> I am really stuck here, and don't know how to proceed. Is it normal that
> the flash can suddenly go totally bad?

Most likely not. Probably this is due to a bug somewhere.      


-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
