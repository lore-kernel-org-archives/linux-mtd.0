Received: from yx-out-1718.google.com ([74.125.44.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KaZyn-0004DG-1C
	for linux-mtd@lists.infradead.org; Tue, 02 Sep 2008 17:47:49 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1714655yxi.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Sep 2008 10:47:48 -0700 (PDT)
Message-ID: <6934efce0809021047h40127b72u5d35f457e0546635@mail.gmail.com>
Date: Tue, 2 Sep 2008 10:47:45 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?UTF-8?Q?J=C3=B6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
In-Reply-To: <20080902171500.GC19618@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	<6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	<Pine.LNX.4.64.0808281737150.28552@vixen.sonytel.be>
	<Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
	<6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
	<20080902171500.GC19618@logfs.org>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com,
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> How is one expected to read those last 4 bytes of a loopbacked file?
>> Are they unreadable?  We can add the padding.   I am just wondering if
>> this is a bug or a known limitation in the loopback handling or if
>> there is a different safer way of reading block devs with truncated
>> last blocks.
>
> Can't you just include the final magic into the last block, thereby
> making the size a clean multiple of 4k?  It looks as if you have some
> padding before the magic anyway.  So you just have to make sure the
> padding is at least 4 bytes and write the magic to the end of it.  Apart
> from solving this bug, it should also save you some space. ;)

I'm going to have to look into this n*4K thing.  The image doesn't
need to be aligned.  There shouldn't be any last block to put the
magic in.  But I haven't messed with the mkfs.axfs code for a while.
