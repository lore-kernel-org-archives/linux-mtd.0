Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KaYzN-0003fn-6s
	for linux-mtd@lists.infradead.org; Tue, 02 Sep 2008 16:44:21 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3379136wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Sep 2008 09:44:19 -0700 (PDT)
Message-ID: <6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
Date: Tue, 2 Sep 2008 09:44:19 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Geert Uytterhoeven" <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	<6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	<Pine.LNX.4.64.0808281737150.28552@vixen.sonytel.be>
	<Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
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

> I found what's wrong.
>
> The size of an AxFS image created by mkfs.axfs is always n*4096+4 bytes large.
> So when it wants to check the magic value in the last 4 bytes, the block layer
> tries to read a whole 512-byte sector, which fails for loop-mounted images.
>
> If you test on real FLASH, additional bytes after the end of the AxFS image can
> be read, hence it works.
>
> By padding the image with 508 zero bytes, I can mount it, on both PS3 (ppc64)
> and UML (ai32). I can even read images created on PS3.

Right.  We haven't tested loopback since we added the magic end value.

How is one expected to read those last 4 bytes of a loopbacked file?
Are they unreadable?  We can add the padding.   I am just wondering if
this is a bug or a known limitation in the loopback handling or if
there is a different safer way of reading block devs with truncated
last blocks.

> However, there still are weird things going on, like `find' not seeing all
> files and directories, or just aborting, and `ls -lR' showing actual file
> contents in its output.

Do you see this behavior for all builds for just the PS3?
