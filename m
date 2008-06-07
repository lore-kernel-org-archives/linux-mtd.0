Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K54Rl-0005t3-W1
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 19:51:30 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1507306wfc.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Jun 2008 12:51:27 -0700 (PDT)
Message-ID: <a791a2dc0806071251v23b74c67ne160bebc5774374b@mail.gmail.com>
Date: Sat, 7 Jun 2008 16:51:27 -0300
From: "Alaor Koppe" <alakoppe@gmail.com>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: NAND and vfat
In-Reply-To: <bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
	<bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I created by dd command, after that, I used fdisk to format as VFAT,
directly on board. Maybe I had used in a wrong way "dd" command, but I
don't know.

on LPC board I did:

# mount -t jffs2 /dev/mtdblock0 /mnt
# dd bs=1M count=10 if=/dev/zero of=/mnt/vfat.img
# fdisk /mnt/vfat.img

When I use fdisk, I enter on expert mode and set the sectors, heads
and cylinders, but after I close with write command, when I enter
again, these information aren't as I set. So, when I use the mount
command with vfat option to loopback file, I get the error specified.

Any idea?

Thanks...

Alaor

On Fri, Jun 6, 2008 at 10:41 PM, Nancy <nancydreaming@gmail.com> wrote:
> On 6/7/08, Alaor Koppe <alakoppe@gmail.com> wrote:
>> I have mounted my jfss2 on NAND Flash and created my file.img (with
>> fat12 filesystem) and when I try to mount I get:
>>
>> # mount -t msdos file.img fat -o loop,ro
>> FAT: bogus number of reserved sectors
>> VFS: Can't find a valid FAT filesystem on dev loop0.
>> mount: Mounting /mnt/file.img on /mnt/fat failed: Invalid argument
>
> How you create the file.img?
> I can use
> #mount -t vfat -o loop file.img /mnt    on top of JFFS2, but cannot on
> top of UBIFS
>
> --
> Best wishes,
> Nancy
>



-- 
Alaor Abel Koppe
