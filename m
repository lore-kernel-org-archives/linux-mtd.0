Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D1Nro-00022d-3U
	for linux-mtd@lists.infradead.org; Wed, 16 Feb 2005 07:01:16 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050216114741.GA16239@synertronixx3>
References: <20050216114741.GA16239@synertronixx3>
Content-Type: text/plain
Date: Wed, 16 Feb 2005 13:01:08 +0100
Message-Id: <1108555269.24721.83.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd liste <linux-mtd@lists.infradead.org>
Subject: Re: Oops vanilla 2.6.10
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-16 at 12:47 +0100, Konstantin Kletschke wrote:
> This way 2.6.10 Oopses on a virgin jffs2. Second boot is fine.
> cat /dev/mtdblock3 > /dev/null
> lasts three times longer than with 2.6.10-rc2.

Is this MTD from kernel or MTD CVS ? 
Is this with XIP enabled ?

tglx
