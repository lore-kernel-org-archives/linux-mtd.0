Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCLjI-0005H8-6I
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 03:06:20 +0000
Message-ID: <51340FBF.9090000@freescale.com>
Date: Mon, 4 Mar 2013 11:06:39 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>	
 <1359349039-11510-2-git-send-email-b32955@freescale.com>
 <1362233972.2745.7.camel@sauron>
In-Reply-To: <1362233972.2745.7.camel@sauron>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B403=E6=9C=8802=E6=97=A5 22:19, Artem Bityutskiy =E5=
=86=99=E9=81=93:
> On Mon, 2013-01-28 at 12:57 +0800, Huang Shijie wrote:
>> As time goes on, we begin to meet the situation that we can not get en=
ough
>> information from some nand chips's id data. Take some Toshiba's nand c=
hips
>> for example. I have 4 Toshiba's nand chips in my hand:
>> 	TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2
>>
>> When we read these chips' datasheets, we will get the geometry of thes=
e chips:
>> 	TC58NVG2S0F : 4096 + 224
>> 	TC58NVG3S0F : 4096 + 232
>> 	TC58NVG5D2  : 8192 + 640
>> 	TC58NVG6D2  : 8192 + 640
>>
>> But we can not parse out the correct oob size for these chips from the=
 id data.
> Very good start of the commit message - you clearly defined the problem=
.
>
>> So it is time to add some new fields to the nand_flash_dev{}, and upda=
te the
>> detection mechanisms.
> But continued with very poor description of how you address the problem=
.
> Please, provide a better description.

sorry. It's my fault.

I will add more description in the next version.
>> This patch just adds some new fields to the nand_flash_dev{}:
>>    @id[8] : the 8 bytes id data.
> id[8] =3D 8 bytes id data, just like password[5] =3D 5 bytes of passwor=
d
> data. Please, provide a better commentary.
>
okay.

>>    @id_len: the valid length of the id data.
> What does "valid" mean? Are "invalid" parts?
yes.

  some nand chips may only have 5 valid bytes in the 8 bytes id data=20
which is read
  out by the READ ID(0x90) command. for example, the 8 bytes id data may=20
like this:
     A1, A2, A3, A4, A5, A1, A2, A3

  The last three bytes are just the repeat of the first three bytes.

Of course, we can remove this field, in other word, treat the last three=20
bytes as the
valid bytes too.
>>    @oobsize: the oob size.
> Try to invent a better comment.
>
> Huang, it is not that I am trying to be difficult, but I truly do not
not at all, it's my fault.
> understand how you are solving the issue.
>
My method is:
   Use the 8 bytes id data (which is read out by READ ID command) as the=20
keyword.
The 8bytes id data is unique for each nand chip. Do we meet two=20
different nand chips
have the same 8 bytes id data? I afraid not.

   Since we can not parse out the oob size for these Toshiba nand chips,=20
we can add a
new field oob_size to store the right oob size for the nand chips.=20
that's why i add
the @oobsize field.

Are you clear now?

thanks
Huang Shijie
