Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqER5-0007hS-C3
	for linux-mtd@lists.infradead.org; Tue, 22 Sep 2009 23:06:19 +0000
Received: by yxe40 with SMTP id 40so277799yxe.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Sep 2009 16:06:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253394106.6317.38.camel@macbook.infradead.org>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
	<1253390936.6317.33.camel@macbook.infradead.org>
	<8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
	<1253394106.6317.38.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 22 Sep 2009 19:05:53 -0400
Message-ID: <8bd0f97a0909221605j1f4a0d62m5707e0ad11c7ece4@mail.gmail.com>
Subject: Re: [PATCH] [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible flash
	chip driver
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 19, 2009 at 17:01, David Woodhouse wrote:
> On Sat, 2009-09-19 at 16:28 -0400, Mike Frysinger wrote:
>>
>> > Can't you do the same?
>>
>> afaik, it isnt JEDEC compliant either. =C2=A0you can find the data sheet
>> here:
>> http://www.st.com/stonline/products/literature/ds/8116/psd4256g6v.htm
>>
>> so if i created a probe function that created a fake cfi table and
>> then called cfi_cmdset_0002(), you think the read/write/erase
>> functions would work ?
>
> At first glance, it looks like that would work, yes. It basically seems
> to be the same command set, at its core.
>
>> i dont see any mapping drivers that do this
>> kind of thing. =C2=A0where can i find an example ?
>
> The examples are cfi_probe.c and jedec_probe.c. We have no example of
> setting it up _directly_ from a map driver, but that doesn't mean it
> can't be done.

thanks, this got me poking at the jedec chip driver.  i tried adding a
new MTD_UADDR_0x0AAA_0x0554 and then defining a jedec_table entry like
so:
+    {
+       .mfr_id =3D 0xff20,
+       .dev_id =3D 0xffe9,
+       .name   =3D "STM PSD4256G6V",
+       .uaddr  =3D MTD_UADDR_0x0AAA_0x0554,
+       .devtypes   =3D CFI_DEVICETYPE_X16,
+       .dev_size =3D SIZE_1MiB,
+       .cmd_set =3D P_ID_AMD_STD,
+       .nr_regions =3D 1,
+       .regions =3D {
+           ERASEINFO(0x10000,16)
+       },
+   },

then i was able to read/write/erase the flash device just fine from
userspace /dev/mtd via the physmap mapping driver.

the only problem i have here is with the need to 0xff pad the mfr/dev
id's.  any idea what's up with that ?  the device is 16bit and i set
my .width in my board resources to 2, but the id field is only 8bit,
so in 16bit mode the id is padded with 0xff instead of 0x00.
-mike
