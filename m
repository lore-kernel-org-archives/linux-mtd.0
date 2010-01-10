Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTw4K-0001hw-59
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 11:34:56 +0000
Received: by fxm22 with SMTP id 22so23147316fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 03:34:50 -0800 (PST)
Subject: Re: ubi attach failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <dbdb2ea61001051516n4eb50374m809720d68c214cba@mail.gmail.com>
References: <dbdb2ea61001051516n4eb50374m809720d68c214cba@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 13:34:44 +0200
Message-Id: <1263123284.30988.5.camel@localhost.localdomain>
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

On Tue, 2010-01-05 at 18:16 -0500, twebb wrote:
> I get the error shown below when attempting to attach to an mtd device
> on a Marvell PXA-based platform.  The flash is MLC NAND from Samsung
> K9LBG08U0D (4G x 8-bit).
> 
> I don't know if it's related, but one thing that stands out is that I
> only see the error on two platforms whose bad block table has >28
> entries (other tested boards have approx. 2-8 bad blocks).
> 
> Any suggestion as to what would cause error and whether it may be
> related to the high number of bad blocks?

What did you use to flash your image? It looks like it was not flashed
properly.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
