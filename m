Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBpLG-0003xf-NR
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 14:22:19 +0000
Received: by gwb1 with SMTP id 1so1941059gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Apr 2011 07:22:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303135646.8589.12.camel@localhost>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
	<BANLkTik3bKP4=zBgqxpN2vNTWD5V5DzKAA@mail.gmail.com>
	<1303134901.8589.9.camel@localhost>
	<BANLkTi=7yxRMgw+UpCZ+bmwrQw_QfFT44A@mail.gmail.com>
	<1303135646.8589.12.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 18 Apr 2011 10:21:57 -0400
Message-ID: <BANLkTikJGXM_ryKunm9Wrxk1O2vMNz2wgw@mail.gmail.com>
Subject: Re: [PATCHv2 2/2] mkfs.jffs2: fix casting of __off64_t
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 18, 2011 at 10:07, Artem Bityutskiy wrote:
> On Mon, 2011-04-18 at 10:04 -0400, Mike Frysinger wrote:
>> On Mon, Apr 18, 2011 at 09:55, Artem Bityutskiy wrote:
>> > On Mon, 2011-04-18 at 09:49 -0400, Mike Frysinger wrote:
>> >> On Mon, Apr 18, 2011 at 04:31, Andy Shevchenko wrote:
>> >> > The casting of __off64_t to unsigned long potentially wrong for val=
ues higher
>> >> > than ULONG_MAX. =C2=A0Let's fix that.
>> >>
>> >> i dont think this is the way to go. =C2=A0on 64bit systems, long long=
 is
>> >> 128bits. =C2=A0i imagine the way to go (assuming we're always using L=
FS) is
>> >> to use PRIu64 from inttypes.h
>> >
>> > sizeof(unsigned long long) is 8 (64 bits) on my x86_64 fedora.
>>
>> so it is. =C2=A0i still think PRIu64 is the correct way to handle this a=
s
>> there is no sizeof() assumption and no need for casting.
>
> Never used this, but yes, as long as this is something which has worked
> for ages and we are not going to have "this is not supported" issues -
> sure!

glibc has been shipping this since 1999 (if not earlier), so i dont
think that'll be an issue.  glibc-2.2.5 was released in 2002, and it's
hard to even find that anymore.

> But unsigned long long is 64 bits I think in all GNU systems, and
> casting to unsigned long long is quite standard practice AFAIK, so I do
> not see why it would be very bad thing to do.

i think we should strive for the correct types in the printf string
rather than attempting to cast things away all the time.  casting
things away can make us miss stuff, such as printf'ing a 64bit as a
32bit ;).
-mike
