Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNYGs-0008U9-B5
 for linux-mtd@lists.infradead.org; Wed, 21 Jun 2017 05:33:43 +0000
Received: by mail-ot0-x242.google.com with SMTP id q16so14996453otb.0
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 22:33:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170620225007.GB14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170526131415.27186-2-zajec5@gmail.com>
 <20170620225007.GB14148@google.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Wed, 21 Jun 2017 07:33:19 +0200
Message-ID: <CACna6rwsFBFmrdvumBa9H6C0uJuaY=cS-Q+akXsQmgo2dqTFVQ@mail.gmail.com>
Subject: Re: [PATCH V6 1/5] mtd: partitions: add helper for deleting partition
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 June 2017 at 00:50, Brian Norris <computersforpeace@gmail.com> wrote:
> On Fri, May 26, 2017 at 03:14:11PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> There are two similar functions handling deletion. One handles single
>> partition and another whole MTD flash device. They share (duplicate)
>> some code so it makes sense to add a small helper for that part.
>>
>> Function del_mtd_partitions has been moved a bit to keep all deleting
>> stuff together.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
>> +/**
>> + * __mtd_del_partition - delete MTD partition
>> + *
>> + * @priv: internal MTD struct for partition to be deleted
>> + *
>> + * This function must be called with the partitions mutex locked.
>> + */
>> +static int __mtd_del_partition(struct mtd_part *priv)
>> +{
>> +     int err;
>> +
>> +     sysfs_remove_files(&priv->mtd.dev.kobj, mtd_partition_attrs);
>
> Notably, the above wasn't called in del_mtd_partitions() previously. Is
> that intentional?
>
> As I read the code, we were actually missing this before; either in
> error handling, or on device removal. But in either case, the entire
> device was going to disappear, so the sysfs files would have been
> cleaned up anyway?
>
> Also, is there any chance of double-calling this? I think not, but even
> if there is, it looks like the low-level routines are reslient to
> non-existent files.
>
> I'm mostly thinking out loud here. I think this is a positive change,
> even if it wasn't noted explicitly.

I think that call was missing, however I could make it more clear I'm
adding it. I'll try splitting this change out V7 and add a proper
description.

--=20
Rafa=C5=82
