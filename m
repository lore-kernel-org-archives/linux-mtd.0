Received: from co202.xi-lite.net ([149.6.83.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJkA7-00042a-2x
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 09:23:02 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.243])
	by co202.xi-lite.net (Postfix) with ESMTPS id 72943260287
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Jun 2010 11:22:49 +0200 (CEST)
Message-ID: <4C0622E6.7070203@parrot.com>
Date: Wed, 2 Jun 2010 11:22:46 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: ubi question
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have some question about ubi implementation.
I have read most of the "drivers/mtd/ubi/ubi-media.h" documentation.

The doc is not very clear about the case when data_size is set for
dynamic volume. From my understanding it is set in case copy_flag is set 
and the value is the logical eraseblock size.

When a block with copy_flag set, when we append data (and make the crc 
invalid), do we make sure that all previous version of this logical 
eraseblock are removed from flash ?

Why layout volume isn't a static volume with one eraseblock and update 
done with atomic leb update (copy flag) ?
This would have :
- make the crc ckeck done by generic code (static volume one)
- make the handling of update by generic code
- avoid to having to handle dynamic volume in minimalist implementation 
(bootloader)
Do I miss something ?


Matthieu
