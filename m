Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oo712-00079V-Kt
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 03:51:09 +0000
Received: by fxm12 with SMTP id 12so89859fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 20:51:07 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1282501832.16502.97.camel@brekeke>
	<AANLkTi=AXo7Ziiz9qWTFMuYaMJbq0xpS2YcuJeWL3BC5@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 25 Aug 2010 06:51:03 +0300
Message-ID: <1282708264.16502.106.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2010-08-24 at 18:38 -0400, Matthew L. Creech wrote:
> I applied your patch to 2.6.35 and booted that on the same bad device
> for which I posted a boot log.  But to my surprise, it didn't give any
> errors at all - the boot process completed normally, and it appears to
> be working fine so far.  I had booted the kernel from memory, so I
> pulled the power and let it go through the normal boot process (using
> the 2.6.31 kernel that's built in to the firmware) - that also works
> fine.
> 
> I checked my sanity by trying another bad device, and the same thing
> happened there - booting 2.6.35 somehow "fixed" my problem.
> Unfortunately, this means I can no longer tell what happened to the
> original block you were interested in.  I'll try to dig up another bad
> device, and use your patch with an older kenel version to see what
> happens there.

This is interesting. BTW, if you use 2.6.31, you should in any case
apply patches from the ubifs-v2.6.31 back-port tree, there were some
good fixes.

> Is it at all possible that the error was caused by something at the
> UBI or MTD layer which was fixed between 2.6.34 and 2.6.35, and
> booting up with 2.6.35 "touched" something that made it work again
> even after reverting to an older kernel?  Sounds pretty far-fetched,
> but I don't know how else to explain these suddenly-recovered
> devices...

OK :-)

Artem.
