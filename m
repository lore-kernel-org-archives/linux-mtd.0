Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CcL9u-0006JR-W9
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 05:04:28 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Subrahmanyam <subrahmanyam@navayuga.co.in>
In-Reply-To: <001c01c4dda0$839c4920$8500a8c0@nit37>
References: <001c01c4dda0$839c4920$8500a8c0@nit37>
Content-Type: text/plain
Date: Thu, 09 Dec 2004 11:04:24 +0100
Message-Id: <1102586664.3306.26.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD driver
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-12-09 at 09:08 +0530, Subrahmanyam wrote:
>  Yes, Thomas has suggested that i indeed use a filesystem, but how can I 
> best
>  achieve it! I mean the procedure to store data in a file.

# echo "KEYSTRING" >/path/to/your/file

All programming languages provide functions to write to files.

# man 2 write

might be a good start. If this does not help you might try

http://www.amazon.com/exec/obidos/ASIN/0764570684/dangookin/104-4933924-3663106?creative=327641&camp=14573&link_code=as1

for further assistance.

tglx
