Received: from mail-qy0-f108.google.com ([209.85.221.108])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzI0a-0008Ui-HA
	for linux-mtd@lists.infradead.org; Wed, 29 Apr 2009 22:12:07 +0000
Received: by qyk6 with SMTP id 6so4168691qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Apr 2009 15:12:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <587a08410904281722r3ceb08afraa80701a44f618fa@mail.gmail.com>
References: <587a08410904271402h6e9cf4fl8d4bb843cd03990f@mail.gmail.com>
	<Pine.LNX.4.64.0904280922270.25523@lnxricardw.se.axis.com>
	<587a08410904280721k30a5045bifb03423ae3aed3ec@mail.gmail.com>
	<Pine.LNX.4.64.0904281652020.25523@lnxricardw.se.axis.com>
	<587a08410904281722r3ceb08afraa80701a44f618fa@mail.gmail.com>
Date: Wed, 29 Apr 2009 17:12:03 -0500
Message-ID: <587a08410904291512g626b35b3s2f968670ec4be60f@mail.gmail.com>
Subject: Re: Mounting NAND flash as the root file system
From: Jatin Sharma <sharmaj@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I thought I post how I fixed this problem. It actually turned out to
be some debug code in do_mount.c that we added which led to this
issue. After updating this file from the original BSP from Montavista,
I was able to mount rootfs on NAND. Thanks for the help from this
forum.

Regards,
Jatin

2009/4/28 Jatin Sharma <sharmaj@gmail.com>:
> After turning on JFFS2 debug, I found that kernel is trying to mount
> /dev/root even though I gave "root=3D/dev/mtdblock0" in my command line.
> Is the command line correct:
>
> Command line=3D"root=3D/dev/mtdblock0 rootfstype=3Djffs2 rw"
>
> Here is the error:
> IP-Config: Complete:
> =A0 =A0 =A0device=3DWP-SED, addr=3D10.100.54.179, mask=3D255.255.255.0, g=
w=3D10.100.54.33,
> =A0 =A0 host=3D10.100.54.179, domain=3D, nis-domain=3D(none),
> =A0 =A0 bootserver=3D255.255.255.255, rootserver=3D255.255.255.255, rootp=
ath=3D
> <7>jffs2_get_sb(): dev_name "/dev/root"
> <7>jffs2_get_sb(): path_lookup() returned 0, inode 81731c94
> <0>Kernel panic - not syncing: VFS: Unable to mount root fs on
> unknown-block(0,255)
>
> I have attached complete kernel log with this email. Thanks for helping.
>
> Regards,
> Jatin
>
> 2009/4/28 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>>
>> On Tue, 28 Apr 2009, Jatin Sharma wrote:
>>
>>> Actually, I was mounting the block device but wrote it wrong in the ema=
il.
>>>
>>> WDS# mount -t jffs2 /dev/mtdblock0 /mnt
>>> mount: mounting /dev/mtdblock0 on /mnt failed
>>
>> Ok. Well I don't really have any other ideas, it's just a typical mistak=
e
>> that people make (I do it all the time...).
>>
>>> Since the flash_eraseall and nandwrite tools are working on the NAND
>>> device, NAND driver is working fine. Would you agree? I don't have the
>>> nanddump tools on my file system but will include it to make sure NAND
>>> is getting updating after being written by nandwrite.
>>
>> What happens if you erase the flash and the mount it directly (without
>> writing an image to it). An empty flash is a valid jffs2 file system, so=
 if
>> this works, but mounting the partition with an image in it doesn't, ther=
e
>> could be something wrong with your image.
>>
>> /Ricard
>> --
>> Ricard Wolf Wanderl=F6f =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 ricardw(at)axis.com
>> Axis Communications AB, Lund, Sweden =A0 =A0 =A0 =A0 =A0 =A0www.axis.com
>> Phone +46 46 272 2016 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 Fax +46 46 13 61 30
>>
>
