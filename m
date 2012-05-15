Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUMQu-0002dW-3m
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 18:25:19 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: docg3 fix in-middle of blocks reads
References: <1333970348-10319-1-git-send-email-robert.jarzmik@free.fr>
 <1337094261.4170.70.camel@shinybook.infradead.org>
Date: Tue, 15 May 2012 20:25:05 +0200
In-Reply-To: <1337094261.4170.70.camel@shinybook.infradead.org> (David
 Woodhouse's message of "Tue, 15 May 2012 16:04:21 +0100")
Message-ID: <87ipfxuwse.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

David Woodhouse <dwmw2@infradead.org> writes:

> On Mon, 2012-04-09 at 13:19 +0200, Robert Jarzmik wrote:
>>=20
>> The reason seams that the first 111 bytes read ends between
>> the 2 docg3 planes, and that the first following read (in
>> the 12 bytes sequence, read of 16 bit word) returns the byte
>> of the rightmost plane duplicated in high and lower byte of
>> the word.
>>=20
>> Fix this behaviour by ensuring that if the previous read
>> ended up in-between the 2 planes, there will be a first 1
>> byte read to get back to the beginning of leftmost plane.=20
>
> Um, this seems complex. Wouldn't it be easier just to say "Don't Do That
> Then" =E2=80=94 always read a multiple of two bytes, even if the caller d=
oesn't
> care about the last byte?

Hi David,

I don't get the "Don't Do That Then".

The caller here, UBIFS, wants to read 12 bytes at offset 111 =3D> [
byte111..byte122]. Note that the number of wanted bytes is even, and it's t=
he
offset which is _odd_.

The problem for the driver is to read the 111 first bytes and forget them, =
and
then store the next 12 bytes. I don't see an alternative here, apart from h=
aving
a bounce buffer to read the bytes [byte110..byte122], and then copy into the
destination buffer. And I really don't want the bounce buffer.

Do you see any other alternative ?

Cheers.

--=20
Robert
