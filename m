Received: from relay00.pair.com ([209.68.5.9])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWajD-0002Hu-6g
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 17:14:59 +0000
Date: Tue, 04 Mar 2008 09:14:36 -0800
Subject: Re: MTD and jffs2 mount problem on Linux-2.6.23 rc2
From: Grant Erickson <gerickson@nuovations.com>
To: Dach Miroslaw <miroslaw.dach@psi.ch>
Message-ID: <C3F2C37C.DC5B%gerickson@nuovations.com>
In-Reply-To: <1B4F8000449511488D1A640DD6DECA3501EC25DC@MAILBOX0A.psi.ch>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/4/08 2:34 AM, Dach Miroslaw wrote:
> I have created on my target board the jffs2 image which is foreseen to be
> place on /dev/mtd3:
> 
> ./mkfs.jffs2 --pad=0xA0000 --eraseblock=0x20000 --root=TEST-DIR
> --output=image2.jffs2
> flash_erase /dev/mtd3
> dd if=./image2.jffs2 of=/dev/mtd3 bs=2 count=327680
> 
> Up to this point all went fine.
> 
> The problem emerged when I have tried to mount the jffs2 partition:
> mkdir /mnt
> mount -t jffs2 /dev/mtdblock3  /mnt

Dach:

Based on recent experience, I found the following to work with my board and
a 2.6.25-rc2 kernel:

% mkfs.jffs2 -n -e 16 KiB -b -d /export/haleakala -n -o root.img -s 512 -p
  512

# flash_eraseall -q /dev/mtd9
# nandwrite -q /dev/mtd9 root.img
# mount -t jff2 /dev/mtdblock9 /import

So, based on your steps above, it looks like you might meet success by
replacing 'flash_erase' with 'flash_eraseall' and 'dd' with 'nandwrite'.

Regards,

Grant Erickson
