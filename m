Received: from [217.109.194.170] (helo=intranet.mtp.eprocess.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17D5k0-0003qd-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2002 16:52:01 +0100
Message-ID: <3CF4F995.4060608@eprocess.fr>
Date: Wed, 29 May 2002 17:53:57 +0200
From: Frederic Marmond <fmarmond@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
MIME-Version: 1.0
To: Ilguiz Latypov <ilatypov@superbt.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: can't boot with DiskOnChip2000 / nftlmount UnitSizeFactor ????
References: <Pine.LNX.4.44.0205291138490.3100-100000@server.superbt.com>
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

...
i made a "nftl_format /dev/mtd0 2097152", from the lastest CVS from 
mtd-tool...
it works fine, and i can make a fs (ext2) on /dev/nftla1 (after, of 
course having made a fdisk /dev/nftla)

but the message still remain at boot time (see it in dmesg
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device
)

this check is in nftlmount.c in kernel directory (drivers/mtd/nftlmount.c)
do you mean that i can comment this check?
do you know what is the risk?

Fred

Ilguiz Latypov wrote:

>On Wed, 29 May 2002, Frederic Marmond wrote:
>
>>is there any info to make my nftlmount works, even if i have this
>>message? ("Sorry, we don't support UnitSizeFactor of != 1 yet.")
>>
>
>I circumvented such problem by re-formatting the chip with the MTD
>nftlformat utility.  The latter has a built-in check for erase block size
>which you may need to remove if you find the risk acceptable.
>
>Ilguiz
>
>
