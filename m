Received: from mail-pw0-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXaLX-0001Kd-8v
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 13:11:47 +0000
Received: by pwj11 with SMTP id 11so3491180pwj.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 05:11:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<Pine.LNX.4.64.1001201111550.32263@lnxricardw.se.axis.com>
Date: Wed, 20 Jan 2010 21:11:41 +0800
Message-ID: <2c3b11251001200511x549f7285if75806e92300818b@mail.gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
From: Liu Hui <onlyflyer@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
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

Richard,

Thank you for your confirmation and good idea.

I also think about your idea before, that is, when power failure
happens, generate an interrupt and blocks any other write requests in
interrupt handler. But this is a little complex.

Now, I think I can use ECC to check the partial write, if a write was
not finished, the ECC should be wrong, so we can detect this partial
write and discard this write. Do you think this is a good idea?

Thanks,
Hui

2010/1/20 Ricard Wanderlof <ricard.wanderlof@axis.com>:
>
> On Wed, 20 Jan 2010, Liu Hui wrote:
>
>> Hi guys,
>>
>> This is a question confused me for a long time. As I know, writing a
>> sector for a hard disk is atomic. That is to say, when we are writing
>> a sector to hard disk and power failure happen, the sector will be
>> written completely or not at all.
>>
>> For NAND flash, I didn't see the atomic guarantee in any material.
>> Could you please tell me if writing a page for NAND flash is atomic?
>> This is very important for a transaction based file system.
>
> It is my understanding that if you get a power failure while the nand fla=
sh
> chip is writing the page the page could get partly written.
>
> The only way around something like this would be to monitor the power lin=
e
> prior to the supply regulator, and not start a write if it can be detecte=
d
> that a power failure has occurred and there is not enough power to comple=
te
> the write.
>
> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0www.axis.com
> Phone +46 46 272 2016 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fax +46 46 13 61 30
>



--=20
Thanks & Best Regards
Liu Hui
--
