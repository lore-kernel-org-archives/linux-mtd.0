Received: from www2.levante.de ([212.101.151.130] helo=www.levante.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dcham-0002fa-RR
	for linux-mtd@lists.infradead.org; Mon, 30 May 2005 06:33:58 -0400
Message-ID: <429AEC25.4000309@fsforth.de>
Date: Mon, 30 May 2005 12:34:13 +0200
From: Jonas <jdietsche@fsforth.de>
MIME-Version: 1.0
To: Blair Barnett <blair@circumnavnetworks.com>
References: <B1091462CF5479489B1D8FE818330D2C80F27E@exchange2003.ad.skymv.com>
In-Reply-To: <B1091462CF5479489B1D8FE818330D2C80F27E@exchange2003.ad.skymv.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand write problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi blair,
> I believe you need to use the -p (pad) option to nandwrite.
> Please let us see your nandwrite command line.
This is what I tried:

# ./nandwrite --jffs2 /dev/mtd/2 jffs2.img
Use -f option to enforce legacy placement on autoplacement enabled mtd 
device

# ./nandwrite -f /dev/mtd/2 jffs2.img
./nandwrite: illegal option -- f

# ./nandwrite -f --jffs2 /dev/mtd/2 jffs2.img
./nandwrite: illegal option -- f

# ./nandwrite -p /dev/mtd/2 jffs2.img
this takes a long time until it is finished.

then I mount it with
# mount -t jffs2 /dev/mtdblock/2 /mnt/
and get a lot of
CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0

Copy the image with nandwrite is the correct and only way? Or is there 
another possibility?

Jonas
