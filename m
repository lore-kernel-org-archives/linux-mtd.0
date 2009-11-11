Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N87X0-00083j-25
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 07:22:22 +0000
Subject: Re: mxc nand i.mx35: no OOB with HW_ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
References: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Nov 2009 09:22:03 +0200
Message-Id: <1257924123.21596.830.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 16:25 +0100, John Ogness wrote:
> Hi,
> 
> I spent a while trying to figure out why JFFS2 was getting hardware ECC
> errors on an i.MX35 NANDFC with 2K pages. The problem also existed when
> using nandwrite together with the -n and -o options.
> 
> The problem is that for page sizes larger than 512 bytes, the i.MX35
> NANDFC can only write the page and oob data together. When writing the
> page and oob data, the ECC hardware also writes the ECC codes for
> it. This is ok if the filesystem driver or userspace application
> understands that only one write per page+oob is allowed.
> 
> But jffs2 and "nandwrite -n -o" assume that they can write the oob data
> and the page data separately. With the recently posted mxc_nand.c
> driver, this results in the NANDFC writing the ECC codes to flash
> twice... with different values. This means the ECC codes that end up on
> the flash chip are garbage.

Err, the classical model is that you can write whole page (or
sub-pages), then the driver/HW also generates ECC and stores it in the
OOB. However, traditionally ECC codes do not occupy whole OOB, so there
is space left. And you can write separately to that space.

Your case is confusing. If your ECC occupies whole OOB, your driver
should simply prohibit writing to the OOB. If it does not, it is your
drivers' fault. Really, your driver should either correctly support the
classical model, or it should simply not support OOB writing at all. Not
something in the middle, right?

> When reading the page back, the ECC hardware uses the garbage ECC codes
> to "fix" the data, which results in corrupted data.
> 
> ubifs does not touch the oob data, which is probably why nobody cares
> about (or has noticed?) this issue.

True.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
