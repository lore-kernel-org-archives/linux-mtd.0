Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDc6-0000xU-3Z
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:40:46 +0000
Received: by wgbdt11 with SMTP id dt11so8402498wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:40:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323725206.2297.24.camel@koala>
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
 <1323725206.2297.24.camel@koala>
Date: Mon, 12 Dec 2011 13:40:43 -0800
Message-ID: <CAN8TOE9-4j0pC5Vocu4v9toczvKAyKnRtZ6AE3fjt7Fk8PaZ=g@mail.gmail.com>
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, Dec 12, 2011 at 1:26 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Fri, 2011-12-09 at 11:45 -0800, Brian Norris wrote:
>> MEMWRITE is a recently introduced write interface for MTD; however, it
>> is, for now, only supported on NAND flash. mtd-utils should fall back to
>> old write methods when either ENOTTY or EOPNOTSUPP are returned.
>>
>> This is a showstopper when, for instance, using ubiformat on NOR, which
>> don't have a mtd->write_oob interface (and thus don't support MEMWRITE):
>>
>> =A0 ubiformat: formatting eraseblock 2 -- =A01 % complete =A0libmtd: err=
or!: MEMWRITE ioctl failed for eraseblock 2 (mtd3)
>> =A0 =A0 =A0 =A0 =A0 error 122 (Operation not supported)
>>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> I guess this require an urgent mtd-utils release.
>
> Also, why you say 'for now', does even make-sense to implement this for
> NOR?

I think when (somewhat hurriedly) writing this patch, I was
considering issues with the libmtd interface (mtd_write) and with the
ioctl (MEMWRITE). I kinda mixed them up and wrote something that
wasn't really applicable to either one. Deleting "for now" is good.

Another issue: there are strictly non-NAND flash with OOB as well, so
my statement ("only supported on NAND flash") isn't quite as good as
yours ("not supported for flashes without OOB, e.g., NOR flash"). Not
hugely important on a mtd-utils patch though.

> I've also just pushed this patch, does it look OK to you?

Yes, it looks fine.

Brian

P.S. FYI, I don't see the mtd-utils "push" yet.
