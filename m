Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjcXX-00040z-Vj
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 17:57:59 +0000
Received: by wwd20 with SMTP id 20so438756wwd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 09:57:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <OFB51E93AB.187F855F-ONC12576D2.00618F62-C12576D2.0061DEB5@transmode.se>
References: <a9e22dff1002220826p63209a33n27e84ea10e191a19@mail.gmail.com>
	<a9e22dff1002220840x7e86a1a0i3d44cefc1c6a79c0@mail.gmail.com>
	<OFB51E93AB.187F855F-ONC12576D2.00618F62-C12576D2.0061DEB5@transmode.se>
From: niam <niam.niam@gmail.com>
Date: Mon, 22 Feb 2010 19:57:29 +0200
Message-ID: <a9e22dff1002220957r469ea79cg38309ffd24c19644@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix memory leak if the sector was successfully
	erased
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Joe Perches <joe@perches.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
	Michael Trimarchi <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, you are right.
Michael Trimarchi also responded that it's freed by the callback.

My concern now that it's not obvious to free erase instruction in
jffs2_erase_callback.
Why not to free it the same piece of code where it was allocated?

--Dima

On Mon, Feb 22, 2010 at 7:49 PM, Joakim Tjernlund
<joakim.tjernlund@transmode.se> wrote:
> niam <niam.niam@gmail.com> wrote on 2010/02/22 17:40:11:
>>
>> Resending patch to proper people/mailing list.
>>
>> Memory allocated for erase instruction is not freed if the sector was
>> successfully erased.
>
> NAK, jffs2_erase_callback() will free it so
> you have added a double free I think. Did you measure a memory leak?
>
>>
>> Signed-off-by: Dmytro Milinevskyy <niam.niam@gmail.com>
>> ---
>> =A0fs/jffs2/erase.c | =A0 =A04 +++-
>> =A01 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
>> index b47679b..c0a5604 100644
>> --- a/fs/jffs2/erase.c
>> +++ b/fs/jffs2/erase.c
>> @@ -74,8 +74,10 @@ static void jffs2_erase_block(struct jffs2_sb_info *c=
,
>> =A0 =A0 =A0 =A0((struct erase_priv_struct *)instr->priv)->c =3D c;
>>
>> =A0 =A0 =A0 =A0ret =3D c->mtd->erase(c->mtd, instr);
>> - =A0 =A0 =A0 if (!ret)
>> + =A0 =A0 =A0 if (!ret) {
>> + =A0 =A0 =A0 =A0kfree(instr);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>> + =A0 =A0}
>>
>> =A0 =A0 =A0 =A0bad_offset =3D instr->fail_addr;
>> =A0 =A0 =A0 =A0kfree(instr);
>>
>
>
