Received: from mailserv.intranet.gr ([146.124.14.106])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVP0j-0004LV-ED
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 02:14:03 -0400
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i526JSc26374
	for <linux-mtd@lists.infradead.org>;
	Wed, 2 Jun 2004 09:19:28 +0300 (EEST)
Message-ID: <40BD6EE4.5010805@intracom.gr>
Date: Wed, 02 Jun 2004 09:08:36 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <200406020023.02262.tglx@linutronix.de>
In-Reply-To: <200406020023.02262.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>Hi all,
>
>the NAND driver has some more new features
>
>- support for AG-AND chips (currently tested with HN29V1G91T-30)
>- bad block table support (memory and flash based)
>- a new API documentation (online version is available on MTD homepage)
>
>
Sounds interesting...

I'll test when I have some spare time available.

Just a question.

Does it do the automatic bad block skipping on read-only
like my patch did, so I can mount CRAMFS?

That is, is something like my patch still required,
or it is no longer necessary?

Regards

Pantelis
