Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyJqY-0005E4-7t
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2010 07:34:30 +0000
Received: by qwe4 with SMTP id 4so9940qwe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Sep 2010 00:34:28 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1285139570.7512.137.camel@localhost>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
	<1284308851.1783.23.camel@brekeke>
	<AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
	<1284358990.27765.154.camel@localhost>
	<AANLkTin4u=jQOxxuTwzMHrEEg=vDc2TSTah_=_Li02xx@mail.gmail.com>
	<1284441967.2084.18.camel@brekeke>
	<AANLkTin+2ocUT_NMToGHoAhX5=Trn2CdLFmiMBmvSVuC@mail.gmail.com>
	<1285139570.7512.137.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 22 Sep 2010 03:34:08 -0400
Message-ID: <AANLkTi=ssyUrvaic86hx8tT0TvZiMzyDa_KL0SfU144J@mail.gmail.com>
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
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

On Wed, Sep 22, 2010 at 03:12, Artem Bityutskiy wrote:
> On Wed, 2010-09-22 at 00:23 -0400, Mike Frysinger wrote:
>> On Tue, Sep 14, 2010 at 01:26, Artem Bityutskiy wrote:
>> > On Mon, 2010-09-13 at 21:21 -0400, Mike Frysinger wrote:
>> >> ... policy is for the end user to determine ... this is putting
>> >> artificial limits for no real reason that i can see.
>> >
>> > But the problem is not artificial limits. The problem is that I do not
>> > think your option is usable at all, because, as I explained, bad
>> > eraseblock is not necessarily writable, it's contents and the state is
>> > unpredictable. It may contain unstable bits, for example. You really
>> > need to erase it before writing.
>>
>> it is completely artificial. =C2=A0as you said yourself, it is "not
>> necessarily writable". =C2=A0that means i should be able to tell the
>> hardware "do XXX" and let the hardware do it. =C2=A0instead, i'm stuck w=
ith
>> userspace utils that say "no, you cant do that". =C2=A0except the only
>> thing telling me i cant do that is the userspace utils. =C2=A0as clearly
>> demonstrated, adding this option lets me do what i want -- write to
>> pages and change their contents.
>>
>> the fact that i might not get the same data back as what i wrote is
>> completely irrelevant. =C2=A0i can already do this to good pages without
>> erasing them first. =C2=A0by your logic, nandwrite should also be
>> artificially aborting with "oh, you need to erase these blocks first".
>> =C2=A0but it isnt
>>
>> the fact that normally you want to skip badblocks is also irrelevant.
>> that's why it is an option the user specifically needs to enable
>> themselves. =C2=A0i dont care if the default policy is "dont write to ba=
d
>> blocks". =C2=A0the default policy has no bearing here.
>
> You are pushing for this quite aggressively, so I guess you really need
> this :-) And you sound convincing

i'm open to logic, but i cant figure out your side.  all i can see is
"it's been this way" and "we shouldnt write bad blocks".  but both
sound like policies that the end user should have control over rather
than the userspace utils always enforcing.  so if you feel i've missed
something, please highlight it.

> but give me some time to think about this please.

np
-mike
