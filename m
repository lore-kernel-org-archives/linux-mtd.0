Received: from mail-gx0-f160.google.com ([209.85.217.160])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZxZW-0002OG-GJ
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2009 01:19:29 +0000
Received: by gxk4 with SMTP id 4so527408gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Feb 2009 17:19:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20090219.093715.229615835.nemoto@toshiba-tops.co.jp>
References: <20090211164247.8119de8d.akpm@linux-foundation.org>
	<1234601859.3564.95.camel@macbook.infradead.org>
	<8bd0f97a0902171202i449ede68k3dd726039b4c2f4a@mail.gmail.com>
	<20090219.093715.229615835.nemoto@toshiba-tops.co.jp>
Date: Wed, 18 Feb 2009 20:19:25 -0500
Message-ID: <8bd0f97a0902181719yd553c31lab33047d46922434@mail.gmail.com>
Subject: Re: [patch for 2.6.29? 4/4] mtd/maps: blackfin async flash maps: fix
	up memory leak
From: Mike Frysinger <vapier.adi@gmail.com>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org, cooloney@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 18, 2009 at 19:37, Atsushi Nemoto wrote:
> On Tue, 17 Feb 2009 15:02:11 -0500, Mike Frysinger wrote:
>> i'm not entirely sure what the change is by reading that patch.  what
>> i've got is attached.
>
> Looks fine for me.  Thanks.

ok, i'll wait for my other patches against bfin-async-flash to make it
into mainline and i'll post a follow up patch for this.
-mike
