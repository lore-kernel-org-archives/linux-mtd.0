Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K59Kg-000763-Mw
	for linux-mtd@lists.infradead.org; Sun, 08 Jun 2008 01:04:31 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1574074wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Jun 2008 18:04:29 -0700 (PDT)
Message-ID: <bae050c10806071804k7bddc290s8538ce55989118e0@mail.gmail.com>
Date: Sun, 8 Jun 2008 09:04:29 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Alaor Koppe" <alakoppe@gmail.com>
Subject: Re: NAND and vfat
In-Reply-To: <a791a2dc0806071251v23b74c67ne160bebc5774374b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
	<bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
	<a791a2dc0806071251v23b74c67ne160bebc5774374b@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alaor,
On Sun, Jun 8, 2008 at 3:51 AM, Alaor Koppe <alakoppe@gmail.com> wrote:
> I created by dd command, after that, I used fdisk to format as VFAT,
> directly on board. Maybe I had used in a wrong way "dd" command, but I
> don't know.
   fdisk is not right command to do format.

> on LPC board I did:
>
> # mount -t jffs2 /dev/mtdblock0 /mnt
> # dd bs=1M count=10 if=/dev/zero of=/mnt/vfat.img
> # fdisk /mnt/vfat.img

You can try this:
On PC:
 # dd bs=1M count=10 if=/dev/zero of=vfat.img
 # loseup /dev/loop0 vfat.img
 # mkfs.vfat /dev/loop0
 # loseup -d /dev/loop0

 On board:
  # mount  -t jffs2 /dev/mtdblock0 /mnt
  # cp that vfat.img to /mnt/
  # mount -t vfat -o loop /mnt/vfat.img /mnt
  OK, done!

> When I use fdisk, I enter on expert mode and set the sectors, heads
> and cylinders, but after I close with write command, when I enter
> again, these information aren't as I set. So, when I use the mount
> command with vfat option to loopback file, I get the error specified.
   I think fdisk can't run on reguler file properly. You should try to
loopback that file to loop device, then fdisk /dev/loop0. Just like
mkfs.vfat /dev/loop0.
   HTH!

-- 
Best wishes,
Nancy
