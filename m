Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FCWPU-0002qT-8t
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 01:26:41 -0500
Received: by wproxy.gmail.com with SMTP id i12so545818wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Feb 2006 22:26:34 -0800 (PST)
Message-ID: <f9d2a5e10602232226u1fcf1e20tf4fb066f56036919@mail.gmail.com>
Date: Thu, 23 Feb 2006 23:26:34 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <f9d2a5e10602232107y57accef1r3420d9b903d9cf4c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f9d2a5e10602232107y57accef1r3420d9b903d9cf4c@mail.gmail.com>
Subject: Re: FPGA NAND Interface tips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Also, when writing/reading to a single address, the 80200 will not
> burst, and round trip time is horrid, especially when talking to IO
> devices. Would a FIFO with a 32 byte interface be a good solution to
> this? maybe with 16 entries (512 bytes)? I realize that DMA would be
> more ideal, but a fifo seems like it might be simplier.

quick rethink on that portion, the input to the fifo would be 8 bytes
(80200 has a 64 bit data interface)
