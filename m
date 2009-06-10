Received: from mail-px0-f176.google.com ([209.85.216.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MEEXd-0005bJ-QW
	for linux-mtd@lists.infradead.org; Wed, 10 Jun 2009 03:32:04 +0000
Received: by pxi6 with SMTP id 6so490421pxi.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Jun 2009 20:31:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1244445964.5847.349.camel@localhost.localdomain>
References: <a1fb7300906022244g5cd882acw7de4b9b0ecc35547@mail.gmail.com>
	<a1fb7300906051703p148c5d1k7fd46257c8031ac6@mail.gmail.com>
	<1244370180.5847.322.camel@localhost.localdomain>
	<1244445964.5847.349.camel@localhost.localdomain>
Date: Wed, 10 Jun 2009 10:31:54 +0700
Message-ID: <a1fb7300906092031m2945b2d4i7534afac880945fb@mail.gmail.com>
Subject: Re: Confuse with WL_THRESHOLD
From: Thang Dao Duy <hanbaoquansexy@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 8, 2009 at 2:26 PM, Artem Bityutskiy<dedekind@infradead.org> wr=
ote:
> On Sun, 2009-06-07 at 13:23 +0300, Artem Bityutskiy wrote:
>> On Sat, 2009-06-06 at 07:03 +0700, Thang Dao Duy wrote:
>> > Hi everyone.
>> > I used NANDsim and ubifs not for along time. Now, I have confused with
>> > wear-leveling threshold. If i give parameter WL_THRESHOLD in Kernel is
>> > small (example, the value is =9A3), then when i write a file size 2 Mi=
B
>> > to NAND about 200 times, it makes me cannot read EC and VID headers of
>> > one PEB (example PEB 10). May be that PEB is bad ? And when i set the
>> > WL_THRESHOLD is higher (the value is 20), i write a file 2MiB about
>> > 1000 times, nothing 's happen, i can read headers of any PEB. So can
>> > you tell me what make this happen, and show me where in ubi source in
>> > kernel.
>>
>> Looks like a bug. Please, describe precisely how to reproduce it,
>> and I'll take a look at this.
>
> Please, also make sure you are using the latest UBI/UBIFS. Please, take
> a look here:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>
> I've configured my UBI and made the threshold to be 3 now. I've also
> enabled additional UBI and UBIFS debugging checks. I'm running the
> following test:
>
> $ sudo modprobe nandsim
> $ sudo modprobe ubi mtd=3D0
> $ sudo ubimkvol /dev/ubi0 -m -N test_fs
> Set volume size to 128674304
> Volume ID 0, size 8107 LEBs (128674304 bytes, 122.7 MiB), LEB size 15872 =
bytes (15.5 KiB), dynamic, name "test_fs", alignment 1
> $ sudo modprobe ubifs
> $ sudo mount -t ubifs ubi0:test_fs /mnt/ubifs/
> $ while true; do sudo dd if=3D/dev/urandom of=3Dubifs/file count=3D2048; =
sync; done
> 2097152 bytes (2.1 MB) copied, 0.316768 s, 6.6 MB/s
> 4096+0 records in
> 4096+0 records out
> ....
>
> It's being run for some time now, so far so good - no issues.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>

Thanks to Atem Bityutskiy.
I have modified some code in kernel drivers/mtd/nand/, so may be it
makes that happen. I tested =9Athe useful nand (512 and 2048 byte page
size), it have the same with small or big WL_THRESHOLD. So that is my
fault.
