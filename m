Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TBj6K-0002RT-B0
 for linux-mtd@lists.infradead.org; Wed, 12 Sep 2012 09:19:18 +0000
Received: by wibhm2 with SMTP id hm2so3712513wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2012 02:19:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1347361186.26206.5.camel@sauron.fi.intel.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
 <1347358840.21359.67.camel@sauron.fi.intel.com>
 <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
 <1347361186.26206.5.camel@sauron.fi.intel.com>
Date: Wed, 12 Sep 2012 11:19:14 +0200
Message-ID: <CACna6rwP-DAV=H3FC+WXevekMB65dM42hsWnwVrxutUGhY=FFg@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, "John W. Linville" <linville@tuxdriver.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2012-09-11 at 12:35 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> 2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
>> > On Mon, 2012-09-03 at 21:07 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> >> This registers MTD driver for serial flash platform device. Right now=
 it
>> >> supports reading only, writing still has to be implemented.
>> >> At this point it's marked as BROKEN, because it requires code present=
 in
>> >> net tree that wasn't mainlined yet.
>> >>
>> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> >
>> > What are exactly the changes it depends on? URL? Are they staged for
>> > 3.7?
>>
>> http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.gi=
t;a=3Dcommitdiff;h=3D23cb3b2121323443834296a8ecb582b8aeb78d75
>> http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.gi=
t;a=3Dcommitdiff;h=3Dd57ef3a6a2eeb88df47e892c66692e3f59722ffe
>>
>> (Yes, there are queued to be pulled during 3.7 merge window)
>
> CCing John. I am not 100% sure how the net drivers are handled, but if
> John does not rebase and just sends a pull request to David Miller, who
> also does not rebase, then we could pull John's tree into the MTD tree.

Not sure if my plans were clear since beginning so just for sure,
order I imagined:
1) Me adding mtd drivers
2) Linus releasing 3.7-rc1 with disabled mtd driver and changes from
wireless tree
3) Me sending trivial patch enabling mtd driver for -fixes tree

--=20
Rafa=C5=82
