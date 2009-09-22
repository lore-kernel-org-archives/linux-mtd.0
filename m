Received: from mail-yx0-f202.google.com ([209.85.210.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqEoP-0005NH-VE
	for linux-mtd@lists.infradead.org; Tue, 22 Sep 2009 23:30:26 +0000
Received: by yxe40 with SMTP id 40so297085yxe.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Sep 2009 16:30:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253661650.27055.494.camel@macbook.infradead.org>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
	<1253390936.6317.33.camel@macbook.infradead.org>
	<8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
	<1253394106.6317.38.camel@macbook.infradead.org>
	<8bd0f97a0909221605j1f4a0d62m5707e0ad11c7ece4@mail.gmail.com>
	<1253661650.27055.494.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 22 Sep 2009 19:30:01 -0400
Message-ID: <8bd0f97a0909221630n62b72c86we8c01ec062acdade@mail.gmail.com>
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

On Tue, Sep 22, 2009 at 19:20, David Woodhouse wrote:
> On Tue, 2009-09-22 at 19:05 -0400, Mike Frysinger wrote:
>> the only problem i have here is with the need to 0xff pad the mfr/dev
>> id's. =C2=A0any idea what's up with that ? =C2=A0the device is 16bit and=
 i set
>> my .width in my board resources to 2, but the id field is only 8bit,
>> so in 16bit mode the id is padded with 0xff instead of 0x00.
>
> Hm, odd -- but I wouldn't lose sleep over it.
>
> However, the datasheet suggests that the high byte is unspecified. Could
> it be returning the value of the flash data at that location, rather
> than a constant 0xFF? If so, we'd need to add a flag to the jedec match
> table to make it match only the low byte?
>
> Or maybe I'd make you do your own probe in that case, rather than
> polluting jedec_probe.c... :)

nah, none of the first 0x10 bytes are 0xff:
00000000  7f 1d bb 58 8f 04 4c 6d  f5 ee 55 d6 79 b4 31 51  |...X..Lm..U.y.=
1Q|

this is the only board ive seen that has this part, but i can do a
sampling of different revisions to make sure they're all 0xff.  if
you're ok with the small changes i mentioned, then i'll post a patch
for that (to replace the original proposed chip driver) and call it a
day.
-mike
