Received: from fisto.privatedns.com ([216.187.127.253])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CqxJr-0003fq-4u
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 12:39:10 -0500
Message-ID: <1106070000.41ed49f0b3423@courrier.privatedns.com>
Date: Tue, 18 Jan 2005 12:40:00 -0500
From: christian@mcdi.com
To: linux-mtd@lists.infradead.org
References: <E1Cqwi9-0003GD-JF@canuck.infradead.org>
In-Reply-To: <E1Cqwi9-0003GD-JF@canuck.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: format mtd device as vfat file system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I would like to have an idea to understand why I got this error when I execute 
mkdosfs on a mtd device :

> mkdosfs /dev/mtdblock/5

mkdosfs 2.8 (28 Feb 2001)
mkdosfs: unable to get drive geometry for '/dev/mtdblock/5'

Thanks
