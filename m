Received: from lime.solrad.nl ([213.193.238.107])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MR2Y8-00075J-Lz
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 11:21:30 +0000
Message-ID: <4A5DBBB0.9050203@youcom.nl>
Date: Wed, 15 Jul 2009 13:21:20 +0200
From: Jelle Martijn Kok <jmkok@youcom.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ubiupdatevol
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Why is it not possible to write directly to a static volume ?
eg. perform "wget http://server.com/kernel.bin -O /dev/ubi0_2"

ubiupdatevol first performs a ioctl + UBI_IOCVOLUP (with the size) and 
then starts writing normally. Why not allow for open, write, close 
without this ioctl ?

This gives 2 related issues:
1) ubi_start_update must be called - which is normally called by 
ioctl(fd, UBI_IOCVOLUP, &bytes). I could imagine that "ubi_start_update" 
(upd.c) is called at the time the (static) volume is opened for writing. 
(inside the "vol_cdev_open" in cdev.c)
2) the amount of bytes is not available/known on front. The amount of 
bytes is store "vol->upd_bytes" which is used to limit and to know when 
the amount of data to be written to an ubi volume has been reached. At 
that time, the LEB is written and the update marker is removed.
However why not write the final LEB and remove the update marker inside 
"vol_cdev_release". As a "vol_cdev_release" is (and should) always 
follow the last write.

If you think this would be a correct change to UBI and also viable (am I 
overlooking something ?) I would be willing to make the changes and sent 
them to you (for inspection).

Jelle Martijn Kok

-- 
------------------------------------------------------------------------
You/Com Audiocommunicatie b.v.
Motorenweg 5k 
2623CR Delft
The Netherlands
tel. : (+31)15 262 59 55
fax. : (+31)15 257 15 95
mail : jmkok@youcom.nl
http : http://www.youcom.nl
------------------------------------------------------------------------
