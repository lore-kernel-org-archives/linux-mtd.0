Received: from d-200.linux2002.uq.net.au ([203.15.37.200] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16YiUu-0001Ec-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Feb 2002 06:57:33 +0000
Date: Thu, 7 Feb 2002 17:04:24 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: gleixner@autronix.de
cc: Veli-Pekka =?iso-8859-1?q?Yl=F6nen?= <velpeyl@utu.fi>,
     <linux-mtd@lists.infradead.org>,  <jffs-dev@axis.com>
Subject: Re: NAND flash and JFFS(2)
In-Reply-To: <02020707510901.00888@thomas>
Message-ID: <Pine.LNX.4.44.0202071703480.11698-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 7 Feb 2002, Thomas Gleixner wrote:

> I mean we should keep the batch write. Thats correct. But we can leave the 
> cleanmarker where it is now and write it without ECC and put the rest of the 
> page with ECC. On small NAND devices we have only 8byte spare area per block. 
> We need 3 byte for ECC and at least 1 byte for flags. Then the cleanmarker 
> area is reduced to 4 bytes. Is that enough ?

Yeah, that's fine. We can do either - I'm not sure it matters too much.

-- 
dwmw2
