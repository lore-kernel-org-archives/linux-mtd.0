Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O4cqP-0004M7-Ul
	for linux-mtd@lists.infradead.org; Wed, 21 Apr 2010 16:32:11 +0000
Received: by gyb11 with SMTP id 11so3994279gyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Apr 2010 09:32:07 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Apr 2010 22:02:04 +0530
Message-ID: <r2u630851df1004210932u61ea3cf8hb3a1372512855079@mail.gmail.com>
Subject: Data read/write request length in UBIFS!!!
From: Murali N <nalajala.murali@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I have few basic doubt on UBIFS/UBI.

At present i am seeing some 64 bytes read request coming while doing
the "ubiattach" on one of the MTD partition.

What's the typical read/write length request that come's from the UBIFS?
In a normal scenario read/write requests to flash would be multiple of
flash page size? or it could be of any size?

--
Regards,
Murali N
