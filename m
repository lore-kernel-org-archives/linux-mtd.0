Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWFtG-00088l-Pi
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 19:32:15 +0000
Received: by yx-out-1718.google.com with SMTP id 3so80011yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 12:32:14 -0700 (PDT)
Message-ID: <6934efce0808211232i21fcf347vb6baa6502246adb2@mail.gmail.com>
Date: Thu, 21 Aug 2008 12:32:13 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com>
	<ac9c93b10808202332n2654884eh877848df2da59f20@mail.gmail.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
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

> Jared, nice work!

Thanks.

> A few questions:

I meant to address these before.  Sorry.

> - how does this benchmark compared to cramfs and squashfs in a NAND-only system
>  (or is it just not a good plan to use this with NAND-only (of course
> I won't get XIP with NAND, I understand that)

I don't know, I'm interested to find out.  I just benchmarked that.
Actually it should work very well as a NAND-only fs.  Also you do get
something like XIP with NAND.  If you boot an XIP AXFS image on NAND
or a blkdev it will copy that XIP region into RAM and "XIP" it from
there.  I think this will make it very good for LiveCD's.  Though we
just (minutes ago) realized our testing of that feature was flawed, so
no guarantees.

> - would axfs be suitable as a filesystem on a ram disk?

It could be.  I plan on implementing support for brd.  That might work nicely.
