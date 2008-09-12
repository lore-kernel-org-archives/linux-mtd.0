Received: from rn-out-0910.google.com ([64.233.170.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeF58-0005M8-Bq
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 20:17:30 +0000
Received: by rn-out-0910.google.com with SMTP id m7so788783rnd.3
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Sep 2008 13:17:28 -0700 (PDT)
Message-ID: <6934efce0809121317r418c80e8s4755669cc74975c4@mail.gmail.com>
Date: Fri, 12 Sep 2008 13:17:28 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Jamie Lokier" <jamie@shareable.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <20080822183713.GC24179@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com> <20080821110749.GA1926@shareable.org>
	<6934efce0808210711t686a88eci6eb294dbb54d68fe@mail.gmail.com>
	<48AE0476.80109@snapgear.com> <20080822181314.GB24179@shareable.org>
	<6934efce0808221116w76a662b0t954b0922b69d3232@mail.gmail.com>
	<20080822183713.GC24179@shareable.org>
Cc: cotte@de.ibm.com, Greg Ungerer <gerg@snapgear.com>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I think the "fast" in "fast synchronous" gives it away :-)

Yes, I suppose it does.

> I'm using Spansion MirrorBit S29GL128N, which reads at about 0.6 MByte/s.

I think you should get more like an order of magnitude higher.... Get
an expert to look at your timings in the bootloader.  Make sure things
are cached too.  ioremap_cached()...

> Not because they're good, but because that's what the board I'm coding
> for has on it.  I presume they were cheap and familiar to the board
> designers.  (There is 32MB of RAM to play with after all.)
>
> So start a sequence of Busybox processes from a shell script is noticable,
> if it reads from NOR each time.
>
> Oh, and it's a 166MHz ARM, so it's quite capable of decompressing
> faster than the NOR can deliver.

Depends on how you are measuring it.   You ought to be able to get at
least 2 orders of magnitude higher read speeds with a good sync Flash.
 Some of the newer stuff is even faster.
