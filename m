Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq64c-00081u-Iv
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 15:15:03 +0000
Received: by bwz13 with SMTP id 13so4683306bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 08:15:01 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1283181047.2005.1.camel@brekeke>
References: <1283028125-6027-1-git-send-email-vapier@gentoo.org>
	<1283173086.12995.74.camel@brekeke> <1283173173.12995.75.camel@brekeke>
	<AANLkTikE93Uqnf7_8p72rEhcRydmx0LdBVCM_z3tNr-z@mail.gmail.com>
	<1283181047.2005.1.camel@brekeke>
From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 30 Aug 2010 11:14:41 -0400
Message-ID: <AANLkTinsov-zKRVLePv-9DwFYMK9Pmr+CWfqFZSYpE8g@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH] mtd: Blackfin NFC: fix invalid free
	in remove()
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 30, 2010 at 11:10, Artem Bityutskiy wrote:
> On Mon, 2010-08-30 at 09:32 -0400, Mike Frysinger wrote:
>> On Mon, Aug 30, 2010 at 08:59, Artem Bityutskiy wrote:
>> > On Mon, 2010-08-30 at 15:58 +0300, Artem Bityutskiy wrote:
>> >> On Sat, 2010-08-28 at 16:42 -0400, Mike Frysinger wrote:
>> >> > Since info->mtd isn't dynamically allocated, we shouldn't attempt t=
o
>> >> > kfree() it. =C2=A0Otherwise we get random fun corruption when unloa=
ding
>> >> > the driver built as a module.
>> >> >
>> >> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> >> > ---
>> >> > note: this should be merged for 2.6.36 and probably sent to stable =
trees
>> >>
>> >> You send the same patch 2 times once with this note and the other tim=
e
>> >> without this note. Which one should be ignored?
>> >
>> > I guess it is 2.6.36 material. Also, if you want this in -stable, add
>> > corresponding CC please.
>>
>> once it gets merged, then i can notify the stable guys
>
> AFAIK, this is not the way they prefer to work. The right protocol is
> that you add 'Cc: stable@kernel.org' to the commit message, ane they
> pick the patch. I might be mistaken, but AFAIK this is the way.

np ... i'm not claiming to know more than you ;)
-mike
