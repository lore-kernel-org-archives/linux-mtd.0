Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oo28c-0005LT-OJ
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 22:38:43 +0000
Received: by wyg36 with SMTP id 36so21101wyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 15:38:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282501832.16502.97.camel@brekeke>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
Date: Tue, 24 Aug 2010 18:38:34 -0400
Message-ID: <AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 22, 2010 at 2:30 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> Could you please dump LEB 5586 and check whether it is really erased or
> not? Please, apply the following patch:
>
...

Hi Artem,

I applied your patch to 2.6.35 and booted that on the same bad device
for which I posted a boot log.  But to my surprise, it didn't give any
errors at all - the boot process completed normally, and it appears to
be working fine so far.  I had booted the kernel from memory, so I
pulled the power and let it go through the normal boot process (using
the 2.6.31 kernel that's built in to the firmware) - that also works
fine.

I checked my sanity by trying another bad device, and the same thing
happened there - booting 2.6.35 somehow "fixed" my problem.
Unfortunately, this means I can no longer tell what happened to the
original block you were interested in.  I'll try to dig up another bad
device, and use your patch with an older kenel version to see what
happens there.

Is it at all possible that the error was caused by something at the
UBI or MTD layer which was fixed between 2.6.34 and 2.6.35, and
booting up with 2.6.35 "touched" something that made it work again
even after reverting to an older kernel?  Sounds pretty far-fetched,
but I don't know how else to explain these suddenly-recovered
devices...

-- 
Matthew L. Creech
