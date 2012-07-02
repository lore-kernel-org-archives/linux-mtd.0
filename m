Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SljFu-0002Dc-1m
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 16:13:46 +0000
Received: by yenr9 with SMTP id r9so4568212yen.36
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2012 09:13:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1340796875.29342.60.camel@sauron.fi.intel.com>
References: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
 <1340796875.29342.60.camel@sauron.fi.intel.com>
Date: Mon, 2 Jul 2012 09:13:28 -0700
Message-ID: <CAN8TOE_zv1n_Ugx9YD2XYH2trnPhHuYdWOzg5g4v2jys5Eg=fw@mail.gmail.com>
Subject: Re: [PATCH 0/2] UBI(FS): fixing IS_ENABLED() usage + backport trees
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

On Wed, Jun 27, 2012 at 4:34 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Mon, 2012-06-18 at 16:31 -0700, Brian Norris wrote:
>> =A02) IS_ENABLED() has changed some between v3.3 and when this commit wa=
s
>> =A0originally integrated in mainline, so it masks a compile error in the
>> =A0mainline version
>
> Not sure what you mean. It was introduced in 3.1
> (2a11c8ea20bf850b3a2c60db8c2e7497d28aba99), so I have to back-port it
> older ubifs backport trees.

I was referring to
kconfig: fix IS_ENABLED to not require all options to be defined
69349c2dc01c489eccaa4c472542c08e370c6d7e
which was introduced in 3.4. I think this masks some errors in your
mainline patch, but when you backport between 3.1..3.4-rc2, you get
compilation errors.

>> This patch series addresses issue 1. I suggest that this be backported t=
o
>> the appropriate UBIFS tree to solve some build failures. But I think iss=
ue
>> 2 may still be a problem, so perhaps the mainline IS_ENABLED() fix shoul=
d
>> be backported as well?
>
> I guess you are talking about commit
> 69349c2dc01c489eccaa4c472542c08e370c6d7e ? I'll port it too, thanks.

Right, I was talking about this fix (above); but on second thought,
you may not need to port it. It is only needed to mask your error, but
now that it's fixed, you don't need the port. But I didn't look very
closely :)

Regards,
Brian
