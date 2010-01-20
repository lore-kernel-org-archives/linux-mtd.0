Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NXbC7-0007zt-9i
	for linux-mtd@lists.infradead.org; Wed, 20 Jan 2010 14:06:08 +0000
Received: by pzk33 with SMTP id 33so911783pzk.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Jan 2010 06:06:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1263995903.3046.2.camel@localhost>
References: <2c3b11251001200158w56bf5cb8l9a27ade9ec3524f2@mail.gmail.com>
	<20100120134142.GE30789@shareable.org>
	<1263995903.3046.2.camel@localhost>
Date: Wed, 20 Jan 2010 22:06:01 +0800
Message-ID: <2c3b11251001200606l6351d5efs7803242d85a2aa1d@mail.gmail.com>
Subject: Re: Is it an atomic operation for writing a page in NAND flash
From: Liu Hui <onlyflyer@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Jamie Lokier <jamie@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I didn't see this e-mail of Theo and I also can't find it in my
fs-devel mail list, could you please share it with us?

much appreciated!

2010/1/20 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2010-01-20 at 13:41 +0000, Jamie Lokier wrote:
>> Liu Hui wrote:
>> > This is a question confused me for a long time. As I know, writing a
>> > sector for a hard disk is atomic. That is to say, when we are writing
>> > a sector to hard disk and power failure happen, the sector will be
>> > written completely or not at all.
>>
>> Are you sure about that?
>> I have never seen a reliable confirmation of it.
>
> Theo sent a longish e-mail some time ago to fs-devel or lkml, explaining
> why this almost never true in practice.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>



--=20
Thanks & Best Regards
Liu Hui
--
