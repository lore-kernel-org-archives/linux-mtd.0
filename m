Message-ID: <55EA0B0F.8030601@ni.com>
Date: Fri, 04 Sep 2015 16:20:15 -0500
From: Xander Huff <xander.huff@ni.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?B?IkJlYW4gSHVvIOmcjQ==?=
 =?UTF-8?B?5paM5paMIChiZWFuaHVvKSI=?= <beanhuo@micron.com>
CC: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jeff.westfahl@ni.com" <jeff.westfahl@ni.com>,
 "jaeden.amero@ni.com" <jaeden.amero@ni.com>,
 "joshc@ni.com" <joshc@ni.com>, Ben Shelton <ben.shelton@ni.com>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZyki?=
 <peterpandong@micron.com>, nathan.sullivan@ni.com
Subject: Re: [RESEND RESEND RESEND PATCH v2] mtd: nand_bbt: scan for next
 free bbt block if writing bbt fails
References: <1439330122-41912-1-git-send-email-xander.huff@ni.com>
 <1440524966-29627-1-git-send-email-xander.huff@ni.com>
 <20150825183400.GH81844@google.com>
 <A765B125120D1346A63912DDE6D8B6310BF47F35@NTXXIAMBX02.xacn.micron.com>
 <20150827000731.GW81844@google.com>
In-Reply-To: <20150827000731.GW81844@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/26/2015 7:07 PM, Brian Norris wrote:
> On Wed, Aug 26, 2015 at 03:57:00PM +0000, Bean Huo =E9=9C=8D=E6=96=8C=E6=
=96=8C (beanhuo) wrote:
>>> On Tue, Aug 25, 2015 at 12:49:26PM -0500, Xander Huff wrote:
>
>>>> diff --git a/drivers/mtd/nand/nand=5Fbbt.c b/drivers/mtd/nand/nand=5Fb=
bt.c
>>>> index 63a1a36..09f9e62 100644
>>>> --- a/drivers/mtd/nand/nand=5Fbbt.c
>>>> +++ b/drivers/mtd/nand/nand=5Fbbt.c
>
>>>> -787,13 +788,42 @@ static int write=5Fbbt(struct mtd=5Finfo *mtd, uint=
8=5Ft *buf,
>>>>   		einfo.addr =3D to;
>>>>   		einfo.len =3D 1 << this->bbt=5Ferase=5Fshift;
>>>>   		res =3D nand=5Ferase=5Fnand(mtd, &einfo, 1);
>>>> -		if (res < 0)
>>>> +		if (res =3D=3D -EIO && einfo.state =3D=3D MTD=5FERASE=5FFAILED
>>>> +		    && einfo.priv =3D=3D NAND=5FERASE=5FBLOCK=5FERASE=5FFAILED) {
>>>
>>> Do you actually need that last condition? What's wrong with the first t=
wo?
>>>

The intent of the extra condition is to distinguish from other erase failur=
es=20
due to write protection or an already known bad block. We don't want to mar=
k a=20
write protected block as bad simply because we failed to erase it, for exam=
ple.

>>>> +			/* This block is bad. Mark it as such and see if
>>>> +			 * there's another block available in the BBT area. */
>>>> +			int block =3D page >>
>>>> +				(this->bbt=5Ferase=5Fshift - this->page=5Fshift);
>>>> +			pr=5Finfo("nand=5Fbbt: failed to erase block %d when writing
>>> BBT\n",
>>>> +				block);
>>>> +			bbt=5Fmark=5Fentry(this, block, BBT=5FBLOCK=5FWORN);
>>>> +
>>>> +			res =3D this->block=5Fmarkbad(mtd, block);
>>>> +			if (res)
>>>> +				pr=5Fwarn("nand=5Fbbt: error %d while marking block %d
>>> bad\n",
>>>> +					res, block);
>>>> +			goto next;
>>>> +		} else if (res < 0)
>>>>   			goto outerr;
>>
>>
>> For my knowledge , we don't directly mark this block be a bad block,
>> Just like ubi layer,this block also need to further testing and verify if
>> It is real bad block.right?
>
> That's a good point...we might want some kind of separate function for a
> torture test. Might look at UBI's torture=5Fpeb() for inspiration.
>

Hmm, I'll look into this. Any performance concerns if we're torturing for e=
very=20
potential bad block we come across?

>>>>
>>>>   		res =3D scan=5Fwrite=5Fbbt(mtd, to, len, buf,
>>>>   				td->options & NAND=5FBBT=5FNO=5FOOB ? NULL :
>>>>   				&buf[len]);
>>>> -		if (res < 0)
>>>> +		if (res =3D=3D -EIO) {
>>>> +			/* This block is bad. Mark it as such and see if
>>>> +			 * there's another block available in the BBT area. */
>>>> +			int block =3D page >>
>>>> +				(this->bbt=5Ferase=5Fshift - this->page=5Fshift);
>>>> +			pr=5Finfo("nand=5Fbbt: failed to erase block %d when writing
>>> BBT\n",
>>>> +				block);
>>>> +			bbt=5Fmark=5Fentry(this, block, BBT=5FBLOCK=5FWORN);
>>>> +
>>>> +			res =3D this->block=5Fmarkbad(mtd, block);
>>>> +			if (res)
>>>> +				pr=5Fwarn("nand=5Fbbt: error %d while marking block %d
>>> bad\n",
>>>> +					res, block);
>>>> +			goto next;
>>>> +		} else if (res < 0)
>>>>   			goto outerr;
>>>>
>>>>   		pr=5Finfo("Bad block table written to 0x%012llx, version 0x%02X\n"=
,>
>>>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h index
>>>> 272f429..86e11f6 100644
>>>> --- a/include/linux/mtd/nand.h
>>>> +++ b/include/linux/mtd/nand.h
>>>> @@ -1030,4 +1030,11 @@ struct nand=5Fsdr=5Ftimings {
>>>>
>>>>  /* get timing characteristics from ONFI timing mode. */  const struct
>>>> nand=5Fsdr=5Ftimings *onfi=5Fasync=5Ftiming=5Fmode=5Fto=5Fsdr=5Ftiming=
s(int mode);
>>>> +
>>>> +/* reasons for erase failures */
>>>> +#define NAND=5FERASE=5FOK			0
>>>> +#define NAND=5FERASE=5FWRITE=5FPROTECTED	1
>>>> +#define NAND=5FERASE=5FBAD=5FBLOCK		2
>>>> +#define NAND=5FERASE=5FBLOCK=5FERASE=5FFAILED	3
>>>
>>> Why exactly do you need these statuses? I thought the existing error co=
des
>>> were sufficient..

This goes along with why we were originally using the 'priv' field. Lots of=
=20
places use MTD=5FERASE=5FFAILED to see if an erase failed, but we want to c=
heck=20
specifically what type of erase failure occurred. Do ya'll have any suggest=
ions=20
on how better to accomplish this? I'm thinking maybe adding a new member to=
 the=20
erase=5Finfo struct like 'fail=5Finfo' to get this information to nand=5Fbb=
t.


--=20
Xander Huff
Staff Software Engineer
National Instruments
