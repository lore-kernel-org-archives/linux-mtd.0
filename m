Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBjq5-0000wt-Hp
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 08:29:48 +0000
Received: by iyb39 with SMTP id 39so4654002iyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 01:29:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303031774.2308.13.camel@koala>
References: <AANLkTi=GsmJOjurETG930t-TW7uXLR1M6yKXWBSk7ebV@mail.gmail.com>
	<AANLkTik5qKMM3onfv=wsJFFHhO4t0C_8gAXUoGca2fKE@mail.gmail.com>
	<1301671910.2789.98.camel@localhost>
	<BANLkTi=pZqEwWYy=7mYQ_p73cHQ4rA6Rbg@mail.gmail.com>
	<1302873226.3220.43.camel@localhost>
	<1302873423.3220.45.camel@localhost>
	<BANLkTin=dfsO9N02oVZg=kU3ghfymbzJWA@mail.gmail.com>
	<1303031774.2308.13.camel@koala>
Date: Mon, 18 Apr 2011 16:29:43 +0800
Message-ID: <BANLkTi=We=H92+DHuJF7TPVUagePgqF48g@mail.gmail.com>
Subject: Re: UBI memory usage on large page nand
From: Nicholas <ciliwung36@gmail.com>
To: dedekind1@gmail.com
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

Dear Artem,

If I reduce ubi->peb_buf1 and ubi->peb_buf2 with allocation of smaller
memory spaces, will they affect to IO ( read / write ) ?
Will it cause block data wasted ? Since buffer is allocated less than
block size .

Regards,
Alex

On Sun, Apr 17, 2011 at 5:16 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Sun, 2011-04-17 at 17:03 +0800, Nicholas wrote:
>> Dear Artem,
>>
>> Thanks for the advices. I'll try start for UBI first.
>>
>> Reducing peb_buf would mean i need to modify the ubi IO for read/write.
>> As i know, ubi did an erase for a whole block before start writing,
>>
>> Please correct me if i've written in a wrong way.
>
> Yes, when you investigate the code, you'll even find that if extra self
> checks are enabled, UBI will verify that the area it writes to contains
> only 0xFFs - it will read the area, compare with 0xFFs, and if all bytes
> are 0xFFs it will proceed, otherwise it will shout loudly. See:
>
> ubi_io_write() - all writes go through this function, and
> ubi_dbg_check_all_ff - does the verification I talked about, but only in
> debugging mode, because it is too costly to do it in production mode.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
>
>
