Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qa9ty-0008JY-CG
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 17:10:44 +0000
Received: by iwn35 with SMTP id 35so3108724iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 10:10:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308917226.7715.6.camel@koala>
References: <BANLkTi=G+HxWtLgj6wUSQAY1FfjTFC8JjQ@mail.gmail.com>
	<1308917226.7715.6.camel@koala>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 24 Jun 2011 13:10:18 -0400
Message-ID: <BANLkTikeC+kfbuowKHbx_yC4ZmcX4nT6Pw@mail.gmail.com>
Subject: Re: mkfs.jffs2 min erase block size: 4 vs 8 KiB
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

On Fri, Jun 24, 2011 at 08:07, Artem Bityutskiy wrote:
> On Wed, 2011-06-22 at 01:02 -0400, Mike Frysinger wrote:
>> the current mkfs.jffs2 util has in its --eraseblock handling:
>> /* If it's less than 8KiB, they're not allowed */
>> if (erase_block_size < 0x2000) {
>> =C2=A0 =C2=A0 fprintf(stderr, "Erase size 0x%x too small. Increasing to =
8KiB minimum\n",
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 erase_block_size);
>> =C2=A0 =C2=A0 erase_block_size =3D 0x2000;
>> }
>>
>> but i cant seem to find documentation on where this comes from. =C2=A0it=
's
>> not uncommon to have SPI flashes with 4KiB erase sectors, and removing
>> this sanity check and allowing 4 KiB seems to produce an image that
>> works OK.
>>
>> am i missing something ? =C2=A0or should i send a patch to drop this che=
ck ?
>
> I do not believe JFFS2 is able to work with such small erase blocks. In
> JFFS2 (and in UBIFS as well) an eraseblock is the basic garbage
> collection unit, and nodes cannot cross eraseblock boundaries. And the
> maximum node size is 4KiB of data plus few bytes of node header. So 4KiB
> won't even fit the largest data node, e.g., containing uncompressible
> data.
>
> Even 8KiB is bad, because the amount of wasted space will be large -
> JFFS2 will waste the rest of the eraseblock if it does not fit the node.
> So the smaller EB is, the more wasted space you have.

i'll send a patch then to mkfs.jffs2 with a little bit of info.  i
couldnt find a FAQ on the mtd webpage that covered this.

> For SPI flashes the way out is to emulate larger eraseblock sizes on MTD
> level. I'd recommend at least 32 KiB.

sorry, but emulate how ?  just tell jffs2 to use an eraseblock size of
32KiB when creating the fs ?
-mike
