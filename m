Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SomPp-0002Bv-8X
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 02:12:34 +0000
Received: by ghbf11 with SMTP id f11so774879ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 19:12:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FE9FE1A.9070801@newsguy.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
 <4FE9FE1A.9070801@newsguy.com>
Date: Tue, 10 Jul 2012 19:12:27 -0700
Message-ID: <CAN8TOE8d73CMSuNeLDQ7EiBA0mR9rmA-fCf_QQvKbVvsO4X69w@mail.gmail.com>
Subject: Re: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 26, 2012 at 11:23 AM, Mike Dunn <mikedunn@newsguy.com> wrote:
> Reviewed-by Mike Dunn <mikedunn@newsguy.com>

I'll add your/Shmulik's tags in a resend. This is getting a bit late
in the rc cycle, but it should still go in on 3.5 right?

> This should fix the problem, but it's still confusing and inconsistent; s=
ee below...
>
> On 06/22/2012 04:35 PM, Brian Norris wrote:
>> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
>> index fcfce24..75288d3 100644
>> --- a/drivers/mtd/mtdcore.c
>> +++ b/drivers/mtd/mtdcore.c
>> @@ -860,10 +860,22 @@ EXPORT_SYMBOL_GPL(mtd_panic_write);
>>
>> =A0int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_op=
s *ops)
>> =A0{
>> + =A0 =A0 int ret_code;
>> =A0 =A0 =A0 ops->retlen =3D ops->oobretlen =3D 0;
>> =A0 =A0 =A0 if (!mtd->_read_oob)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EOPNOTSUPP;
>> - =A0 =A0 return mtd->_read_oob(mtd, from, ops);
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* In cases where ops->datbuf !=3D NULL, mtd->_read_oob() ca=
n have
>> + =A0 =A0 =A0* semantics similar to mtd->_read(), regarding max bitflips=
. In other
>> + =A0 =A0 =A0* cases, mtd->_read_oob() may return -EUCLEAN. In all cases=
, perform
>> + =A0 =A0 =A0* similar logic to mtd_read() (see above).
>> + =A0 =A0 =A0*/
>> + =A0 =A0 ret_code =3D mtd->_read_oob(mtd, from, ops);
>> + =A0 =A0 if (unlikely(ret_code < 0))
>> + =A0 =A0 =A0 =A0 =A0 =A0 return ret_code;
>
> As Brian explains in the comment, here the return code propagated up coul=
d be
> -EUCLEAN for an oob-only read (ops->databuf =3D=3D NULL), which is unlike=
 the
> mtd_read() case, where here only a hard error will be propagated up. =A0T=
o be
> consistent, nand_do_read_oob(), and non-nand drivers' implementation of
> mtd->_read_oob(), should not return -EUCLEAN. =A0When (or if) a policy is=
 decided
> for reporting bitflips within the oob area, this will need to be revisite=
d.

Yeah, this seems to be a recurring theme: that no in-tree drivers
actually implement ECC for the OOB region. If no other drivers need to
report ECC flips/errors from OOB, then I can't really establish a
policy here. Perhaps I can rethink my driver sometime...

> Thanks Brian!

You're welcome,
Brian
