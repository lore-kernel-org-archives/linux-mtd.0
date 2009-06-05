Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCj3Q-0002b3-E3
	for linux-mtd@lists.infradead.org; Fri, 05 Jun 2009 23:42:39 +0000
Received: by yw-out-1718.google.com with SMTP id 9so1052999ywk.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jun 2009 16:42:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244224312.3751.187.camel@macbook.infradead.org>
References: <8bd0f97a0905061941s6055c6dfrf467a6b2b837c8f8@mail.gmail.com>
	<1244224312.3751.187.camel@macbook.infradead.org>
Date: Fri, 5 Jun 2009 19:42:30 -0400
Message-ID: <8bd0f97a0906051642i6a270831peddba0f49e22b75@mail.gmail.com>
Subject: Re: physmap and pointless shutdown() function ?
From: Mike Frysinger <vapier.adi@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 5, 2009 at 13:51, David Woodhouse wrote:
> On Wed, 2009-05-06 at 22:41 -0400, Mike Frysinger wrote:
>> waaaay back when power management support was added to the physmap.c
>> driver, it added the standard suspend/resume functions. =C2=A0no problem
>> there. =C2=A0but it also added a shutdown function which causes the flas=
h
>> to suspend/resume when rebooting:
>> static void physmap_flash_shutdown(struct platform_device *dev)
>> {
>> =C2=A0 =C2=A0 struct physmap_flash_info *info =3D platform_get_drvdata(d=
ev);
>> =C2=A0 =C2=A0 int i;
>> =C2=A0 =C2=A0 for (i =3D 0; i < MAX_RESOURCES && info->mtd[i]; i++)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->mtd[i]->suspend && info->mtd[i]->r=
esume)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->mtd[i]->suspend(info=
->mtd[i]) =3D=3D 0)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->mtd[i]->re=
sume(info->mtd[i]);
>> }
>>
>> i cant see any point in doing this. =C2=A0it isnt like the flash has
>> buffers that need flushing, and if they did, using suspend/resume as a
>> hack for flushing sounds pretty broken to me.
>>
>> seems to me the function should just be dropped completely.
>
> Wasn't that just to put it into read mode in case the bootloader is
> running from the same chip?

the flash isnt put into read mode though.  if i add printk's to the
shutdown function like so:
    for (i =3D 0; i < MAX_RESOURCES && info->mtd[i]; i++) {
        printk(KERN_EMERG "%s: %i: before: %x\n", __func__, i,
*(unsigned long *)info->map[i].phys);
        if (info->mtd[i]->suspend && info->mtd[i]->resume)
            if (info->mtd[i]->suspend(info->mtd[i]) =3D=3D 0)
                info->mtd[i]->resume(info->mtd[i]);
        printk(KERN_EMERG "%s: %i: after: %x\n", __func__, i,
*(unsigned long *)info->map[i].phys);
    }

then during reboot i see:
physmap_flash_shutdown: 0: before: aded5006
physmap_flash_shutdown: 0: after: 800080

the first value is the correct value

> Reboot doesn't work very well if all you
> have is flash status bits at your reset vector,

your assumption is faulty in that the reset vector is the base of the
flash.  i.e. the physmap base is 0x20000000 as is the reset vector.

physmap platform flash device: 02000000 at 20000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
 Intel/Sharp Extended Query Table at 0x010A
Using buffer write method
Using auto-unlock on power-up/resume
cfi_cmdset_0001: Erase suspend on write enabled
RedBoot partition parsing not available
Using physmap partition information
Creating 3 MTD partitions on "physmap-flash.0":
0x00000000-0x00040000 : "bootloader(nor)"
0x00040000-0x00440000 : "linux kernel(nor)"
0x00440000-0x01000000 : "file system(nor)"

> because you didn't bother to wire up a hardware reset line to the flash.

i'm not disputing the hardware sucks, except your assertion that
"didnt bother" is simply wrong.  there is no hardware reset line that
could possibly be wired up in the first place (deficiency in the
processor itself).
-mike
