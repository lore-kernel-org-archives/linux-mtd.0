Received: from rv-out-0708.google.com ([209.85.198.251])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5t4p-0005cj-JJ
	for linux-mtd@lists.infradead.org; Tue, 10 Jun 2008 01:55:11 +0000
Received: by rv-out-0708.google.com with SMTP id b17so3206833rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Jun 2008 18:55:07 -0700 (PDT)
Message-ID: <a791a2dc0806091855p5e35ae1biebdce6009795399e@mail.gmail.com>
Date: Mon, 9 Jun 2008 22:55:07 -0300
From: "Alaor Koppe" <alakoppe@gmail.com>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: NAND and vfat
In-Reply-To: <bae050c10806081958v5575545ay977877f3aaca7e1@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a791a2dc0806061011yc1d0021m96c0a64260f03a83@mail.gmail.com>
	<bae050c10806061841j27dab8cp48ac7b75dadf7cd1@mail.gmail.com>
	<a791a2dc0806071251v23b74c67ne160bebc5774374b@mail.gmail.com>
	<bae050c10806071804k7bddc290s8538ce55989118e0@mail.gmail.com>
	<a791a2dc0806081549g74f6af40yb91d3a5e1a6c31d@mail.gmail.com>
	<bae050c10806081958v5575545ay977877f3aaca7e1@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nancy,

What board are you using? What uclinux version?
I tried a little bit with your tips, but I can't write correct and
jffs2 returned these errors:

Buffer I/O error on device loop0, logical block 19
lost page write due to I/O error on loop0

At windows we can format with FAT or FAT32, but whe we use the volume,
all that we write generate an error at board and also we receive a
message that is not possible to read. After that we umount and mount
again at windows side and we can see the files that we tried to create
with correct name but empty.

Any idea?

Best regards

Alaor

On Sun, Jun 8, 2008 at 11:58 PM, Nancy <nancydreaming@gmail.com> wrote:
> Hi Alaor,
> On Mon, Jun 9, 2008 at 6:49 AM, Alaor Koppe <alakoppe@gmail.com> wrote:
>> Hi Nancy
>>
>> I followed what you said but something is wrong. I'm trying to mount
>> my board as a device to windows, using the vfat.img as a Backing
>> Storage File (with gadget driver).
>> Well, I created the file with 50 Mb, indicated the file to driver and
>> formated the file as vfat at Windows. I put files in this volume at
>> Windows and all works fine, but when I mount the vfat.img at board
>> with mount command (-t vfat -o loop vfat.img /mnt/fat), I can't see
>> the files that I put with Windows.
>> The gadget driver is working fine, and the mount command doesn't
>> return error when I mount the loopback file.
>> Can be an error on Vfat fs in uclinux? (I'm using 2.6.11.8-hsc0)?
>   I think you miss some important VFAT meta data which should be
> written on Nand, but due to your wrong operations, they do not.
>   Try this:
>  # dd bs=1M count=10 if=/dev/zero of=vfat.img
>  # loseup /dev/loop0 vfat.img
>  # modprobe g_file_storage file=/dev/loop0
>
>  On windows side:
>  fast FAT or FAT32 format
>  cp files ...
>  unload USB device
>
>  On Board:
> # rmmod g_file_storage
> # mount -t vfat -o loop vfat.img /mnt/fat
> # ls /mnt/fat
> See it ?
>
> --
> Best wishes,
> Nancy
>



-- 
Alaor Abel Koppe
