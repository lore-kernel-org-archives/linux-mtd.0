Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYHyv-0007pq-VP
 for linux-mtd@lists.infradead.org; Sun, 07 Jan 2018 20:55:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] Marvell NAND controller rework with ->exec_op()
References: <20171207201814.30411-1-miquel.raynal@free-electrons.com>
 <20171214070930.0b885f6d@bbrezillon> <877etkecig.fsf@belgarion.home>
 <20171218092535.2ca1fe13@xps13> <87y3lxccr7.fsf@belgarion.home>
 <20171220224121.2cb6f690@bbrezillon> <87lghucykr.fsf@belgarion.home>
 <20171222222441.0fd77df9@bbrezillon> <20171222233730.68d9cb9d@xps13>
 <87k1xdblxf.fsf@belgarion.home> <20171223155709.2ba16e95@xps13>
 <87fu81bc45.fsf@belgarion.home> <20180102120326.7a2cf1d1@xps13>
 <87d12scbiy.fsf@belgarion.home> <20180103084037.422b239a@xps13>
 <878tded89m.fsf@belgarion.home> <20180103211028.619cd16d@bbrezillon>
 <20180103215206.5d85b41b@bbrezillon>
Date: Sun, 07 Jan 2018 21:55:33 +0100
In-Reply-To: <20180103215206.5d85b41b@bbrezillon> (Boris Brezillon's message
 of "Wed, 3 Jan 2018 21:52:06 +0100")
Message-ID: <874lnxcrsq.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Wed, 3 Jan 2018 21:10:28 +0100
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>> Hm, that's weird. Can you try with the old driver (pxa3xx)?
Ah you're right, my NAND was damaged ...

> Alternatively, you can type 'nand bad' from uboot to check if it
> detects the same bad blocks.
Mmmh no, the SPL is barebox in my case. Do you have a command in linux or
barebox to do the same thing ?

Cheers.

-- 
Robert
