Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19pOO6-0004Pq-Ny
	for <linux-mtd@lists.infradead.org>; Wed, 20 Aug 2003 09:32:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
In-Reply-To: <a05200f03bb6877b9d497@[130.161.115.44]>
References: <a05200f03bb6877b9d497@[130.161.115.44]>
Message-Id: <1061368283.23099.600.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 20 Aug 2003 09:31:23 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: 2k page NANDs ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-08-20 at 02:02, J.D. Bakker wrote:
> Hi all,
> 
> Is there any way to use either JFFS2 or YAFFS (or MTD-NAND, for that 
> matter) on the newer NAND devices with 2112-byte pages ? Looks like 
> all higher density (>1Gb) NANDs are using this page size nowadays.

JFFS2 ought to work fine, if we just fix the hardware driver -- which
isn't hard.

-- 
dwmw2
