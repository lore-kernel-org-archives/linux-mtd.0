Received: from wproxy.gmail.com ([64.233.184.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FChFi-0006RH-0t
	for linux-mtd@lists.infradead.org; Fri, 24 Feb 2006 13:01:15 -0500
Received: by wproxy.gmail.com with SMTP id 68so346368wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Feb 2006 10:01:12 -0800 (PST)
Message-ID: <f9d2a5e10602241001l532a1b98rdac5fce52aaf635f@mail.gmail.com>
Date: Fri, 24 Feb 2006 11:01:12 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: "Ben Dooks" <ben-mtd@fluff.org>, linux-mtd@lists.infradead.org
In-Reply-To: <20060224112425.GA25880@home.fluff.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f9d2a5e10602232107y57accef1r3420d9b903d9cf4c@mail.gmail.com>
	<20060224112425.GA25880@home.fluff.org>
Cc: 
Subject: Re: FPGA NAND Interface tips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> you might also think about a way of writing cmd+addr in one go, or
> at-least the address cycles.

I did consider that, a seperate command/address fifo. It would have 2
addresses, one for command, one for address, internally, extra bits
would be stored with each byte to indicate command or address.

However, it seems like a nice to have, since command/address setup
would be such a small percentage of total accesses.
