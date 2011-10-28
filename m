Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RJsI8-0000r3-Vx
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 19:40:38 +0000
Received: by faaf16 with SMTP id f16so5304723faa.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Oct 2011 12:40:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE-1+0F=80jYpMQC5+V70BMpqnUZxTZ72tQ9_fy3K2F=-w@mail.gmail.com>
References: <CAEq8YR8Vq1mDxOovREb5CBH-PfoWAP4_p-54W4icZ8bvip90Eg@mail.gmail.com>
	<CAEq8YR_pw4LO_1wvUELXR9Q7e11NA6xU0_082hYJ=oyZd5+=8g@mail.gmail.com>
	<CAEq8YR8wu5xL_nL8==m3gin+R50QsZiQPbuEM=gR98XeXCEn0g@mail.gmail.com>
	<CAN8TOE-1+0F=80jYpMQC5+V70BMpqnUZxTZ72tQ9_fy3K2F=-w@mail.gmail.com>
From: Robert Orzanna <orschiro@googlemail.com>
Date: Sat, 29 Oct 2011 08:39:52 +1300
Message-ID: <CAEq8YR8op9MSb3THcJ=-G5rUiYKgyESkiR1_gvdbuaPL=vv_Jg@mail.gmail.com>
Subject: Re: Access to a xd memory card
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Very much thanks for the hint with SSFDC. Loading the module
immediately created a mountable device.

Finally I can access my camera picture. Yes!

Just for the understanding. SSFDC is the file system of my xD card and
by loading the module the SSFDC system can be mounted?

Regards,

Robert

2011/10/29 Brian Norris <computersforpeace@gmail.com>:
> Hi,
>
> I don't know much about xD, but I can try and point you in the right
> general direction, since you're so insistent.
>
> On Fri, Oct 28, 2011 at 1:25 AM, Robert Orzanna <orschiro@googlemail.com>=
 wrote:
>> Here is what mtdinfo gives me.
>>
>> [/home/robert]$ mtdinfo
>> Count of MTD devices: =A0 =A0 =A0 =A0 =A0 1
>> Present MTD devices: =A0 =A0 =A0 =A0 =A0 =A0mtd0
>> Sysfs interface supported: =A0 =A0 =A0yes
>>
>> [/home/robert]$ sudo mount /dev/mtd0 /mnt
>> mount: /dev/mtd0 is not a block device
>
> You rarely will mount /dev/mtd0 directly, as Memory Technology Devices
> are much different beasts than block devices. You could use a NAND
> filesystem like JFFS2 or, in the case of xD, you probably want one of
> the xD/SmartMedia Flash Translation Layers (FTLs) - see below. You can
> also read a little bit about using SSFDC with DOS-FAT on top (common
> for multimedia, which may be what you're looking for?) under
> "Filesystems supporting NAND" at:
> http://www.linux-mtd.infradead.org/doc/nand.html
>
>> Considering the block device problem, may this be solved by specifing
>> a file system for the card?
>
> Yes and no. You can read linux-mtd documentation on how to use JFFS2
> or YAFFS, perhaps, but this would not be compatible with most consumer
> devices that use xD.
>
>> If so, what file system does a xD card use?
>
> I believe FAT with a software FTL (note my inexperience)
>
>> Sorry for almost spamming you with my issue but I really would like to
>> get behind it why it is working under Ubuntu but not under Archlinux.
>
> Ubuntu must have some different kernel configuration options. I see
> that my Ubuntu has CONFIG_SSFDC set as a module. If you read the
> kernel config menus (make menuconfig) you'd find MTD stuff under
> "Device Drivers > Memory Technology Device (MTD) support". You'll find
> the "NAND SSFDC (SmartMedia) read-only" Flash Translation Layer as
> well as the experimental "SmartMedia/xD new translation layer" there.
> You can also read a little bit of info under the description for the
> "Ricoh xD card reader" under "Device Drivers > Memory Technology
> Devices > NAND support".
>
> In the end, I'm guessing you will use SSFDC with a "modprobe ssfdc",
> then see what new block device shows up (again, I'm guessing a bit
> here...)
>
>>> Should not mtd-utils be the solution then?
>
> mtd-utils is not used for mounting. Among other things, it can erase,
> read, and write the bare flash memory (/dev/mtd0), although that is
> probably not what you want. These tools would often be destructive to
> your original xD data, although you could use them to write a new
> filesystem to your flash (e.g., JFFS2, YAFFS).
>
> Brian
>
