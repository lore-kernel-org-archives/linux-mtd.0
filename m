Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWIpm-0007pT-VY
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 22:40:51 +0000
Received: by wa-out-1112.google.com with SMTP id v33so60930wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 15:40:50 -0700 (PDT)
Message-ID: <6934efce0808211540p237f2c52pd71c2b955b3f54a8@mail.gmail.com>
Date: Thu, 21 Aug 2008 15:40:50 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
In-Reply-To: <200808211424.31966.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00E6.2070505@gmail.com> <200808211424.31966.arnd@arndb.de>
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

> This bytetable stuff looks overly complicated, both the data structure and
> the access method. It seems like you are implementing your own custom Huffman
> compression with this.
>
> Is the reasonn for the bytetable just to pack numbers efficiently, or do you
> have a different intention?

It looks more complicated than it is.  I need a data structure that is
64bit capable, easily read-in-place (remember this is designed to be
an XIP fs), and highly space efficient.  Because it's XIP I didn't
want something that required a lot of calculation nor something that
made you incur a lot of cache misses.  So yes I just want to pack
numbers in an easily read-in-place fashion.

If I have an array of u64 numbers tracking small numbers (a[0] = 1;
a[1] = 2;) just throwing that onmedia is a big waste.
(0x0000000000000001; 0x0000000000000002)  Having different array types
for different images such as arrays of u8,u16,u32,u64 becomes less
efficient for 3,5,6 and 7 byte numbers, 3 bytes was a particularly
interesting size for me.

All I'm doing is removing the totally unnecessary zeros and aligning by bytes.
Take an array of u64 like this :
0x0000000000000005
0x0000000000001001
0x00000000000a0000

I strip off the unneeded leading zeros:
0x000005
0x001001
0x0a0000

Then pack them to byte alignment:
0x0000050010010a0000

Sure it could be encoded more but that would make it harder to extract
the data.  This way I can read the data in one, maybe two, cache
misses.  A couple of shifts to deal with the alignment and endianness
and we are done.

> Did you see a significant size benefit over simply storing all metadata as
> uncompressed data structures like in cramfs?

Yes. For some modest values of significant.  In terms of the amount of
space required to track the metadata it is more dramatic.  For a small
rootfs I can fit many of the data structures in an u8 array, while
maintaining u64 compatibility.  Compared to dumping u64 arrays onmedia
that's an 8X savings.  But it's an 8X savings of a smallish percentage
of the image size.  The difference is more pronounced on a smaller
(2MB) filesystem I tested but it was only ~5% if memory serves me
correct.

> Have you considered storing simple dentry/inode data in node_type==Compressed
> nodes?

Yes, I thought a lot about that.  But I choose against it because I
wanted read-in-place data structures for minimum RAM usage in the XIP
case and I figure the way I do it would stat() faster.
