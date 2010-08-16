Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OkqQB-0004WX-Ow
	for linux-mtd@lists.infradead.org; Mon, 16 Aug 2010 03:31:36 +0000
Received: by wwi14 with SMTP id 14so4856374wwi.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 15 Aug 2010 20:31:34 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <AANLkTi=7YJ1_Wd499WTVfmpvqxdysROCRHpekfkUyrDT@mail.gmail.com>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
	<1281020864-26842-4-git-send-email-vapier@gentoo.org>
	<1281021362.8720.6.camel@localhost>
	<AANLkTi=7YJ1_Wd499WTVfmpvqxdysROCRHpekfkUyrDT@mail.gmail.com>
From: Mike Frysinger <vapier@gentoo.org>
Date: Sun, 15 Aug 2010 23:31:13 -0400
Message-ID: <AANLkTimF0PBuxXYpWHgiR1MsoJ5ijCJdUqoaNwKN8DSO@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 4/7] mtd: Blackfin NFC: wait for the
	ECC reset to finish
To: Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 15, 2010 at 22:54, Barry Song wrote:
> On Thu, Aug 5, 2010 at 11:16 PM, David Woodhouse wrote:
>> On Thu, 2010-08-05 at 11:07 -0400, Mike Frysinger wrote:
>>>
>>> + =C2=A0 =C2=A0 =C2=A0 while (bfin_read_NFC_RST() & ECC_RST)
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_relax();
>>
>> All applied, but I'd be happier if this one had some kind of timeout and
>> didn't have the potential to loop forever if the hardware misbehaves.
>
> If this loop forever, it means a chip bug and really has no any way to
> continue to run the system. So the point is "bfin_read_NFC_RST() &
> ECC_RST" will must be real for the right chip, if the chip has bug,
> there should be workaround but not a timeout.

i think the presumption on the linux/driver side is that hardware has
the tendency to suck, so rather than hang the whole system because the
NFC flakes out, it should recover gracefully.  so spitting out NAND
I/O errors all over the console is preferable to a system that goes
nowhere.

personally, i think it depends on the driver/situation, and in the
embedded world, i tend to agree with you Barry in that a dead subpiece
is the same as the whole system being dead.  but my opinion doesnt
matter much if the subsystem maintainers reject the patches ;).
-mike
