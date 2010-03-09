Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Norf7-00085Q-Ig
	for linux-mtd@lists.infradead.org; Tue, 09 Mar 2010 05:07:26 +0000
Received: by bwz10 with SMTP id 10so4440604bwz.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Mar 2010 21:07:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <804f0d21003080735q49fb834bo3369987059b17208@mail.gmail.com>
References: <804f0d21003080735q49fb834bo3369987059b17208@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Tue, 9 Mar 2010 10:37:00 +0530
Message-ID: <ce9ab5791003082107r43df18by8cbcd8a9f589c326@mail.gmail.com>
Subject: Re: flashcp failed (bad block)?
To: Arno Steffen <arno.steffen@googlemail.com>
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

On Mon, Mar 8, 2010 at 9:05 PM, Arno Steffen
<arno.steffen@googlemail.com> wrote:
> I used the mtd-utils to flash a partition on my system on a running
> linux. This time I get an error:
>
> flashcp -v /tmp/mtd5 /dev/mtd5
> Erasing blocks: 24/320 (7%)
> While erasing blocks 0x002e0000-0x00300000 on /dev/mtd5: Input/output err=
or
>
> So I tried to erase the partition:
>
> flash_eraseall -j /dev/mtd5
> Erasing 128 Kibyte @ 2c0000 -- =A06 % complete.
> Skipping bad block at 0x002e0000
> Erasing 128 Kibyte @ 27e0000 -- 99 % complete.
>
> Until now I have been sure that flashcp can handle bad blocks? Am I wrong=
?
> What can I do?

Yes, you are wrong. 'flashcp' does not handle bad blocks. Ideally you
should use:
'flash_eraseall' and 'nandwrite' mtd-utils to flash a image to NAND.

> flashcp works with same image file on other partition /dev/mtd6 which
> have the same size.

Perhaps partition '/dev/mtd6' did not have any bad block.

--=20
Regards,
Vimal Singh
