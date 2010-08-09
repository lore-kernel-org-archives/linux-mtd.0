Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiMuW-0002yl-3k
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 07:36:42 +0000
Received: by wyf19 with SMTP id 19so7063746wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Aug 2010 00:36:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281267200.19967.246.camel@macbook.infradead.org>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
	<1276352794.19028.122.camel@localhost>
	<1280914408.19499.8.camel@localhost>
	<AANLkTikMrbK4B22Q=aa1zWmx_M-f_eqnKHcaZZb7qj9i@mail.gmail.com>
	<1281267200.19967.246.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 9 Aug 2010 03:36:18 -0400
Message-ID: <AANLkTinTntguz9sZVKb2NJEUHW_+rj7S1u2XT02PDi2q@mail.gmail.com>
Subject: Re: [Uclinux-dist-devel] [PATCH 1/2] mtd: physmap: add
	physmap_unmapped_area() for no-mmu XIP
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David@blackfin.uclinux.org, uclinux-dev@uclinux.org, dedekind1@gmail.com,
	Paul@blackfin.uclinux.org, Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>, Mundt <lethal@linux-sh.org>,
	linux-mtd@lists.infradead.org, Greg Ungerer <gerg@uclinux.org>,
	uclinux-dist-devel@blackfin.uclinux.org,
	Bernd@blackfin.uclinux.org, McCullough <davidm@snapgear.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 8, 2010 at 07:33, David Woodhouse wrote:
> On Sat, 2010-08-07 at 19:26 -0400, Mike Frysinger wrote:
>> if we delve a bit, what you're referring to is only possible i think
>> if this change is merged (we posted this back in Jan w/no feedback):
>> =C2=A0 mtd-physmap: add support users can assign the probe type in board=
 files
>>
>> otherwise, there's no way of declaring a physmap of a parallel nor
>> flash and having it end up with read-only capabilities ...
>
> Hm, yeah -- that one looks sane enough. I can merge that, although part
> 1 of that 2-part series I still object to because I don't *want*
> different architectures to use different config symbols for the same
> thing. Driver code shouldn't have to cope with that.

the two arent really dependent on each other.  i'll probably just
change the Blackfin code to also enable the XIP_KERNEL symbol and
forget about the whole damned mess.
-mike
