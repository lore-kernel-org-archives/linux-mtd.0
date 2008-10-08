Received: from rv-out-0708.google.com ([209.85.198.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnTQn-00055l-Fj
	for linux-mtd@lists.infradead.org; Wed, 08 Oct 2008 07:26:01 +0000
Received: by rv-out-0708.google.com with SMTP id b17so5561462rvf.42
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Oct 2008 00:26:00 -0700 (PDT)
Message-ID: <8f6e22a70810080026g2d271c0dhb44bb6befb54de9b@mail.gmail.com>
Date: Wed, 8 Oct 2008 15:26:00 +0800
From: "zheng shi" <neversetsun@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [JFFS2] Request help on EBS option in Linux-2.6.21.5
In-Reply-To: <8f6e22a70810072036r515b00f9p4a8e23b5a456265c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <8f6e22a70810011900x188b2d85j90d125a707a0cf09@mail.gmail.com>
	<1223017438.3328.14.camel@macbook.infradead.org>
	<8f6e22a70810072036r515b00f9p4a8e23b5a456265c@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 8, 2008 at 11:36 AM, zheng shi <neversetsun@gmail.com> wrote:
> I got a little confused about making an empty file system.
> I think "flash_eraseall /dev/mtdX" will do, but I get messages like:
>
> ...
> JFFS2: Erase block at 0x03f40000 is not formatted. It will be erased
> JFFS2: Erase block at 0x03f80000 is not formatted. It will be erased
> JFFS2: Erase block at 0x03fc0000 is not formatted. It will be erased
> Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
> empty_blocks 0, bad_blocks 0, c->nr_blocks 256
>
> So I changed my way:
> 1. mkdir empty
> 2. mkfs.jffs2 -e 0x40000 -s 0x800 --pad=0x40000 -n -d empty/ -o img/emtpy.img
> (-p 0x40000 seems not to work, it just generates an image with zero
> size, only long option --pad generates an image with 256*1024 byte)

sorry for missing:
2.5  flash_eraseall  /dev/mtd3

> 3. nandwrite -a -p -m /dev/mtd3 img/empty.img
>
> Have I mistaken anything?
>
> BTW,
> My NAND flash's parameter:
> page size: 2KB
> oob size: 64B
> Block size: 256KB
>
> On Fri, Oct 3, 2008 at 3:03 PM, David Woodhouse <dwmw2@infradead.org> wrote:
>> On Thu, 2008-10-02 at 10:00 +0800, zheng shi wrote:
>>>
>>>
>>> I'm using JFFS2 in linux-2.6.21.5.
>>>
>>> When I enabled JFFS2 summary support (EXPERIMENTAL) option, the EBS
>>> mechanism did promote mount time.
>>> But unfortunately files (size>10k) couldn't be written on flash
>>> permanently, i.e., though cp was done, but when remount the file just
>>> copied disappeared.
>>
>> That's strange. Can you reproduce on an empty file system? Just mount it
>> empty, write the large file, then unmount. Take a snapshot of the
>> contents of the flash. Then mount it, confirm that the file is missing,
>> and show me the contents of the flash.
>>
>> Also, build your kernel with CONFIG_JFFS2_FS_DEBUG=1 and capture all the
>> debug output (over a serial port) when you mount the offending file
>> system.
>>
>> The 2.6.21.5 kernel isn't particularly interesting though -- please try
>> something more recent, first.
>>
>>> I have tried -o sync with mount option.
>>
>> That should make no difference.
>>
>> --
>> David Woodhouse                            Open Source Technology Centre
>> David.Woodhouse@intel.com                              Intel Corporation
>>
>>
>
>
>
> --
> Regards, neversetsun
>



-- 
Regards, neversetsun
