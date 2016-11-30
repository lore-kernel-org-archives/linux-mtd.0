Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBzpE-0001NT-Le
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 08:01:11 +0000
Date: Wed, 30 Nov 2016 09:00:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Brian
 Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 19/39] mtd: nand: denali: perform erased check against
 raw transferred page
Message-ID: <20161130090047.37ee420a@bbrezillon>
In-Reply-To: <CAK7LNATA_iy=ntNixpxiJKpTTYy2tXnFaPd4UQ3uiS34tNNT7A@mail.gmail.com>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-20-git-send-email-yamada.masahiro@socionext.com>
 <20161127171213.704e6856@bbrezillon>
 <CAK7LNATA_iy=ntNixpxiJKpTTYy2tXnFaPd4UQ3uiS34tNNT7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 Nov 2016 14:36:13 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris
> 
> 
> 2016-11-28 1:12 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Sun, 27 Nov 2016 03:06:05 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >  
> >> The erased page check must be done against the raw transferred data.
> >> The current first call of is_erase() is against the data after ECC
> >> correction.  I saw cases where not all of the data in the page are
> >> 0xFF after they are manipulated by the ECC correction engine.  
> >
> > Hm, that's surprising. Usually ECC engines leaves data unchanged when
> > uncorrectable errors are detected. Do you have examples where this
> > happens? How did you trigger this case?  
> 
> 
> It always happens on some of my boards.
> At the bottom of this mail, I attached a dump of an erased page
> after it was manipulated by the ECC engine.
> 
> See offset 0x2c1, 0x6c1
> The data is 0xfd, not 0xff.

So you confirm that is dump is done with ECC engine enabled, right?
All I see is 2 bitflips in an erased page, and AFAICT, the engine did
not try to fix other things (with the risk of making it worst).

My point was that, if you already have the in-band data, and can easily
retrieve the ECC and OOB sections, then it's more efficient than
transferring the whole page again.

> 
> 
> I think basically two ways for erased page checking.
> 
> [1] Read the whole of page + oob in raw mode transfer,
>     then check if all the data are 0xFF.

I'm pretty sure you have bitflips even when reading in raw mode in your
specific case.

> 
> [2] Read the ECC-corrected page + oob,
>     then check if *most* of the data are 0xFF.
>     bit-flips less than ecc.strength are allowed.

That's how other drivers are doing it.

> 
> 
> I think [2] is equivalent to calling nand_check_erased_ecc_chunk()
> with ecc.strength for threshold,
> as you suggested in 09/39

Yep, you can use this helper and pass the data and ECC sections (you'll
have to loop over the different ECC chunks and call this function for
each iteration)

> 
> 
> But, the current Denali driver does:
> 
> [3] Read the ECC-corrected page + oob,
>     then check if all the data are 0xFF.
>     (no bit-flips are allowed)
> 
> I think this is wrong
> because this erased page checking is false negative.

Yep, that does not work as soon as you have at least one bitflip in the
page, which can be a problem on MLCs or modern SLCs.

> 
> 
> 
> This patches adopts [1] to solve my problem, but [2] will work as well.

Yes, but as I said, I'm don't understand how #1 can work here. I'd
expect to see the same bitflips when reading in raw mode.

> 
> In my case, only one bit-flip (0xff -> 0xfd) in each ECC section.
> 
> 
> 
> [   19.194200]    0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.200275]   10: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.206355]   20: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.212430]   30: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.218511]   40: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.224586]   50: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.230659]   60: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.236733]   70: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.242807]   80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.248881]   90: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.254955]   a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.261030]   b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.267102]   c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.273177]   d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.279254]   e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.285326]   f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.291407]  100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.297481]  110: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.303555]  120: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.309630]  130: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.315702]  140: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.321778]  150: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.327850]  160: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.333927]  170: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.340006]  180: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.346082]  190: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.352154]  1a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.358230]  1b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.364303]  1c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.370377]  1d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.376451]  1e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.382525]  1f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.388598]  200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.394674]  210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.400754]  220: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.406829]  230: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.412903]  240: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.418977]  250: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.425049]  260: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.431124]  270: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.437199]  280: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.443274]  290: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.449354]  2a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.455431]  2b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.461503]  2c0: ff fd ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.467578]  2d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.473651]  2e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.479727]  2f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.485812]  300: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.491883]  310: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.497963]  320: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.504040]  330: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.510120]  340: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.516195]  350: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.522267]  360: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.528343]  370: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.534416]  380: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.540490]  390: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.546565]  3a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.552638]  3b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.558711]  3c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.564787]  3d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.570868]  3e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.576944]  3f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.583024]  400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.589100]  410: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.595172]  420: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.601247]  430: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.607319]  440: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.613395]  450: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.619467]  460: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.625542]  470: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.631615]  480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.637690]  490: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.643764]  4a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.649839]  4b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.655911]  4c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.661986]  4d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.668058]  4e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.674133]  4f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.680208]  500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.686282]  510: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.692356]  520: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.698431]  530: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.704510]  540: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.710586]  550: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.716659]  560: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.722734]  570: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.728806]  580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.734881]  590: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.740954]  5a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.747030]  5b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.753103]  5c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.759178]  5d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.765250]  5e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.771326]  5f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.777398]  600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.783473]  610: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.789547]  620: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.795621]  630: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.801698]  640: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.807770]  650: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.813850]  660: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.819925]  670: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.825997]  680: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.832074]  690: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.838154]  6a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.844230]  6b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.850303]  6c0: ff fd ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.856378]  6d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.862450]  6e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.868525]  6f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.874597]  700: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.880673]  710: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.886746]  720: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.892821]  730: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.898894]  740: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.904969]  750: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.911042]  760: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.917118]  770: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.923198]  780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.929274]  790: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.935346]  7a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.941421]  7b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.947493]  7c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.953569]  7d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.959642]  7e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [   19.965717]  7f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> 
> 
> 
> 
