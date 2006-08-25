Received: from bay0-omc1-s41.bay0.hotmail.com ([65.54.246.113])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GGju4-0003LK-6z
	for linux-mtd@lists.infradead.org; Fri, 25 Aug 2006 23:11:53 +0100
Message-ID: <BAY110-F2473A78E4AFBB929E89D10BC450@phx.gbl>
From: "Han Chang" <posaune@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: A question about reading newly erased page with NAND_ECC_SOFT.
Date: Fri, 25 Aug 2006 15:11:21 -0700
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

For a newly erased page, the content of both user data and oob are 0xff. If 
NAND_ECC_SOFT is enabled, the ecc code in the oob, which is 0xff, is not 
right ecc code. Then if the file system tries to read a newly erased page, 
it will be problem. Does anyone know how to get around this?

Thanks,
Han
