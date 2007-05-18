Received: from nz-out-0506.google.com ([64.233.162.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoubB-0005HD-Fe
	for linux-mtd@lists.infradead.org; Fri, 18 May 2007 01:03:08 -0400
Received: by nz-out-0506.google.com with SMTP id i11so1621727nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 May 2007 22:01:45 -0700 (PDT)
Message-ID: <e81bc78a0705172201j6e415db0m18bd51a8099c1c81@mail.gmail.com>
Date: Fri, 18 May 2007 00:01:45 -0500
From: "Kevin Zhang" <kzhang01mail@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Problem caused by duplicated ID in the nand_flash_ids
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

For the Samsung K9LAG08U0M with Device ID of 0xD5, the NAND MTD always
picks up the first entry in the nand_flash_ids table for "Samsung NAND
4MiB 3,3V 8-bit" instead of "Samsung NAND 2GiB 3,3V 8-bit"since these
two devices have the same device ID. Is there a way to let the MTD
recognize the 2nd device instead of the first one without changing the
nand_flash_ids table?

Thanks,
Kevin
