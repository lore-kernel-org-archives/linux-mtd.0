Received: from [217.109.194.170] (helo=intranet.mtp.eprocess.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17D4xj-0003mM-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2002 16:02:07 +0100
Message-ID: <3CF4EDE4.2080100@eprocess.fr>
Date: Wed, 29 May 2002 17:04:04 +0200
From: Frederic Marmond <fmarmond@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UnitSizeFactor in nftlmount.c
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

hi all,

I'm trying to make my doc2000 work for booting...
any idea?
;-)

well, in fact, I'm OK in:
nftl_format /dev/mtd0 2097152
(reboot, as all is compiled in kernel, no module)
fdisk /dev/nftla
mkfs -t ext2 /dev/nftla1

it works all right...
but impossible to boot (even with the "lilo-mtd -r /diskonchip").

It seems that when making the fs (mkfs), the firmware is erased.
And when I try to rewrite it, with the DOS util (dformat, given by 
m-sys), it says that I have not enough binary place to put it in.

I'm on 2.4.8, latest mtd-tool from cvs, on a x86/geode SC1200.

any idea would be welcome...

Fred
