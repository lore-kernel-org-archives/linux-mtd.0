Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA3he-0005Kr-8F
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 17:18:06 +0000
Received: by vxd2 with SMTP id 2so780771vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 10:18:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302686325.2768.18.camel@localhost>
References: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
	<1302683190.2768.11.camel@localhost>
	<1302683341.2768.12.camel@localhost>
	<BANLkTinwRXGTSP+zhzY2jMiX_ymwabkc3w@mail.gmail.com>
	<1302686325.2768.18.camel@localhost>
Date: Wed, 13 Apr 2011 10:18:04 -0700
Message-ID: <BANLkTi=c7Qpf8mO=H5zwCqrTO-0wdOjuNg@mail.gmail.com>
Subject: Re: [PATCH v2] Fix gcc-4.5.2 "statement with no effect" warnings in
	UBIFS
From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
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

Artem,

Yes, the compilation is clean now, no warnings.

Maksim.

On Wed, Apr 13, 2011 at 2:18 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Wed, 2011-04-13 at 01:49 -0700, Maksim Rayskiy wrote:
>> Artem,
>>
>> >> This patch does not compile and does not apply to the current tree. I=
'll
>> >> need to do a lot of massage as well because I dislike the "tabs as
>> >> dynamic spaces" style which you use, and the whole UBIFS code does no=
t
>> >> use this approach, so I would like to maintain consistency.
>> >
>> > Sorry, it does compile with older UBIFS, but not with the current one.
>> >
>> >
>>
>> I checked it against Linus tree. What tree you want me to use?
>> I am not clear what you want me to do with formatting.
>
> Maksim,
>
> would you please confirm the patch I pushed to ubifs-2.6.git tree fixes
> all the gcc-4.5 warnings?
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>
