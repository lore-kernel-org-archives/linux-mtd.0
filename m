Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5ThE-00077l-Ih
	for linux-mtd@lists.infradead.org; Sun, 08 Jun 2008 22:49:19 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1865164wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Jun 2008 15:49:04 -0700 (PDT)
Message-ID: <a791a2dc0806081549g74f6af40yb91d3a5e1a6c31d@mail.gmail.com>
Date: Sun, 8 Jun 2008 19:49:03 -0300
From: "Alaor Koppe" <alakoppe@gmail.com>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: NAND and vfat
In-Reply-To: <bae050c10806071804k7bddc290s8538ce55989118e0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
	<bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
	<a791a2dc0806071251v23b74c67ne160bebc5774374b@mail.gmail.com>
	<bae050c10806071804k7bddc290s8538ce55989118e0@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nancy

I followed what you said but something is wrong. I'm trying to mount
my board as a device to windows, using the vfat.img as a Backing
Storage File (with gadget driver).
Well, I created the file with 50 Mb, indicated the file to driver and
formated the file as vfat at Windows. I put files in this volume at
Windows and all works fine, but when I mount the vfat.img at board
with mount command (-t vfat -o loop vfat.img /mnt/fat), I can't see
the files that I put with Windows.
The gadget driver is working fine, and the mount command doesn't
return error when I mount the loopback file.
Can be an error on Vfat fs in uclinux? (I'm using 2.6.11.8-hsc0)?

Thanks

Alaor


On Sat, Jun 7, 2008 at 10:04 PM, Nancy <nancydreaming@gmail.com> wrote:
> Hi Alaor,
> On Sun, Jun 8, 2008 at 3:51 AM, Alaor Koppe <alakoppe@gmail.com> wrote:
>> I created by dd command, after that, I used fdisk to format as VFAT,
>> directly on board. Maybe I had used in a wrong way "dd" command, but I
>> don't know.
>   fdisk is not right command to do format.
>
>> on LPC board I did:
>>
>> # mount -t jffs2 /dev/mtdblock0 /mnt
>> # dd bs=1M count=10 if=/dev/zero of=/mnt/vfat.img
>> # fdisk /mnt/vfat.img
>
> You can try this:
> On PC:
>  # dd bs=1M count=10 if=/dev/zero of=vfat.img
>  # loseup /dev/loop0 vfat.img
>  # mkfs.vfat /dev/loop0
>  # loseup -d /dev/loop0
>
>  On board:
>  # mount  -t jffs2 /dev/mtdblock0 /mnt
>  # cp that vfat.img to /mnt/
>  # mount -t vfat -o loop /mnt/vfat.img /mnt
>  OK, done!
>
>> When I use fdisk, I enter on expert mode and set the sectors, heads
>> and cylinders, but after I close with write command, when I enter
>> again, these information aren't as I set. So, when I use the mount
>> command with vfat option to loopback file, I get the error specified.
>   I think fdisk can't run on reguler file properly. You should try to
> loopback that file to loop device, then fdisk /dev/loop0. Just like
> mkfs.vfat /dev/loop0.
>   HTH!
>
> --
> Best wishes,
> Nancy
>



-- 
Alaor Abel Koppe
