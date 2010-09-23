Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyrMc-00079a-FL
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 19:21:51 +0000
Received: by yxm34 with SMTP id 34so921956yxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 12:21:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1285241097.29268.80.camel@localhost>
References: <AANLkTi=efR8LkMr_FVxV7V6TzZ2yd1-=2ph5vsaNz41U@mail.gmail.com>
	<1285241097.29268.80.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 23 Sep 2010 15:21:27 -0400
Message-ID: <AANLkTik2qGUa9T3cpRDQv1SxuQxUoPfwDh-b31_2Q9qG@mail.gmail.com>
Subject: Re: flash_erase vs flash_eraseall
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

On Thu, Sep 23, 2010 at 07:24, Artem Bityutskiy wrote:
> On Wed, 2010-09-22 at 00:35 -0400, Mike Frysinger wrote:
>> also in looking at these utils, flash_erase does not support the
>> extended 64bit api as it is doing ioctls directly nor does it use
>> getopt. =C2=A0flash_eraseall however is using the common libmtd api (so =
it
>> gets the extend api support for free), and it is cleanly using getopt
>> cleanly. =C2=A0which leads to a simple conclusion from my side ...
>>
>> let's punt the current flash_erase code, rename flash_eraseall to
>> flash_erase, and then extend its options to support the minor
>> functionality of flash_erase. =C2=A0doesnt look like it'll be hard at al=
l
>> to do this. =C2=A0but before i undertake the task, i want to make sure t=
he
>> idea isnt simply going to be rejected due to some concern about
>> retaining backwards compatibility.
>>
>> running `flash_erase /dev/mtd#` (no arguments) will make it erase the
>> first block. =C2=A0this seems kind of useless to me.
>>
>> so i'd make the arguments:
>> flash_erase [options] <mtd> <start> [count]
>> Options:
>> =C2=A0 -N, --erasebad
>> =C2=A0 -j, --jffs2
>> =C2=A0 -u, --unlock
>> =C2=A0 -q, --quiet
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 --silent
>>
>> for the "all" functionality, we can have a value of "-1" or "0" for
>> the count mean "all", or make people type "all".
>
> I'm perfectly fine with getting rid of one of these, this would be a
> very good clean-up. May be additionally we could create a
> flashe_eraseall shell script which will just run flash_erase <mtd> 0 -1
> <other flags>.

OK, i'll get going on this then

> But also, it need a careful look to make sure all flash_eraseall
> functionality is also in flash_erase.

shouldnt be too hard :)
-mike
