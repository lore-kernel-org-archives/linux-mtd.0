Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nouiz-00013X-1T
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 08:23:37 +0000
Received: by wyf23 with SMTP id 23so3566798wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Mar 2010 00:23:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791003082107r43df18by8cbcd8a9f589c326@mail.gmail.com>
References: <804f0d21003080735q49fb834bo3369987059b17208@mail.gmail.com>
	<ce9ab5791003082107r43df18by8cbcd8a9f589c326@mail.gmail.com>
Date: Tue, 9 Mar 2010 09:23:31 +0100
Message-ID: <804f0d21003090023h1787eebds8106b4fea1b0e7b4@mail.gmail.com>
Subject: Re: flashcp failed (bad block)?
From: Arno Steffen <arno.steffen@googlemail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/3/9 Vimal Singh <vimal.newwork@gmail.com>:
> On Mon, Mar 8, 2010 at 9:05 PM, Arno Steffen
> <arno.steffen@googlemail.com> wrote:
>> I used the mtd-utils to flash a partition on my system on a running
>> linux. This time I get an error:
>>
>> flashcp -v /tmp/mtd5 /dev/mtd5
>> Erasing blocks: 24/320 (7%)
>> While erasing blocks 0x002e0000-0x00300000 on /dev/mtd5: Input/output er=
ror
>>
>> So I tried to erase the partition:
>>
>> flash_eraseall -j /dev/mtd5
>> Erasing 128 Kibyte @ 2c0000 -- =A06 % complete.
>> Skipping bad block at 0x002e0000
>> Erasing 128 Kibyte @ 27e0000 -- 99 % complete.
>>
>> Until now I have been sure that flashcp can handle bad blocks? Am I wron=
g?
>> What can I do?
>
> Yes, you are wrong. 'flashcp' does not handle bad blocks. Ideally you
> should use:
> 'flash_eraseall' and 'nandwrite' mtd-utils to flash a image to NAND.
>
>> flashcp works with same image file on other partition /dev/mtd6 which
>> have the same size.
>
> Perhaps partition '/dev/mtd6' did not have any bad block.
>
> --
> Regards,
> Vimal Singh
>

Thanks. That's true, mtd6 doesn't have bad blocks
I did a
"flash_eraseall -j /dev/mtd5"    and
"nandwrite -amp /dev/mtd5 /tmp/rootfs.jffs2"

( I tried the  some options but get
nandwrite -ajmp /dev/mtd5 /tmp/rootfs.jffs2
Autoplacement is not possible for legacy -j/-y options
[root@SPV ]# nandwrite -jmp /dev/mtd5 /tmp/rootfs.jffs2
MEMSETOOBSEL: Inappropriate ioctl for device )

I am not sure about the options, at least I could boot the system.
But again I get empty flash message after change in filesystem
(although set size to 2048 in jffs2 and I did a clean halt on the
system).

Regards
 Arno
