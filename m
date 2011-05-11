Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QKC66-0001lT-MZ
	for linux-mtd@lists.infradead.org; Wed, 11 May 2011 16:17:15 +0000
Received: from [192.168.0.34] (col31-4-88-188-83-94.fbx.proxad.net
	[88.188.83.94])
	by mail.free-electrons.com (Postfix) with ESMTPSA id D169912D
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 May 2011 18:17:04 +0200 (CEST)
Message-ID: <4DCAB697.90906@free-electrons.com>
Date: Wed, 11 May 2011 18:17:27 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: inappropriate ioctl when attaching
Content-Type: text/plain; charset=ISO-8859-1
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

I put a ubi image on a sheevaplug but got those errors:
uncorrectable error :
UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes
from PEB 39:512, read 512 bytes

So I tried to use ubiformat and ubiattach but after a successful
ubiformat, I got the following error:

# ubiattach -p /dev/mtd2
ubiattach: error!: cannot attach "/dev/mtd2"
           error 25 (Inappropriate ioctl for device)

I've never seen this and google doesn't help much. I could flash a jffs2
image w/o problem.

Does anybody have a pointer != NULL ?

Cheers,
David.
-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
