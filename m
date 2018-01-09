Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYono-0005fi-3e
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 07:58:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
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
Date: Tue, 09 Jan 2018 08:57:59 +0100
In-Reply-To: <20180103215206.5d85b41b@bbrezillon> (Boris Brezillon's message
 of "Wed, 3 Jan 2018 21:52:06 +0100")
Message-ID: <87zi5nbh14.fsf@belgarion.home>
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

Ok I recovered my NAND.

For the next try, I'd like you to provide another "temporary patch" to disable
BBT actual writing, just to be sure. Once the driver is working properly, I'll
make another try without the temporary patch.

Tell me when a branch I can pull is ready.

Cheers.

-- 
Robert
