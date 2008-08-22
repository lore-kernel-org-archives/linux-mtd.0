Received: from yx-out-1718.google.com ([74.125.44.155])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWb7i-0006Kw-1D
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 18:12:34 +0000
Received: by yx-out-1718.google.com with SMTP id 3so405737yxi.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 11:12:33 -0700 (PDT)
Message-ID: <6934efce0808221112p64fe1346kc5530ca71dbb108b@mail.gmail.com>
Date: Fri, 22 Aug 2008 11:12:32 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Geert Uytterhoeven" <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 03/10] AXFS: axfs.h
In-Reply-To: <Pine.LNX.4.64.0808221402170.17105@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00E6.2070505@gmail.com> <200808211424.31966.arnd@arndb.de>
	<6934efce0808211540p237f2c52pd71c2b955b3f54a8@mail.gmail.com>
	<200808221327.37371.arnd@arndb.de>
	<Pine.LNX.4.64.0808221402170.17105@vixen.sonytel.be>
Cc: cotte@de.ibm.com, Arnd Bergmann <arnd@arndb.de>,
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

>> So do I understand right that 3 bytes is your minimum size, and going
>> smaller than that would not be helpful? Otherwise I would assume that
>> storing a '5' should only take one byte instead of three.

Right.  But you need 3 bytes to store the maximum value 0x0a0000

If we had:
0x0000000000000003
0x00000000000000FF
0x000000000000000A

You would only need a 1 byte depth.

> From the paper, the minimum size (called `depth') is 1.

Correct the depth can be from 1 to 8 bytes.  The depth is determined
by the maximum value in the array.

>> I don't unsterstand yet why you store the length of each word separate
>> from the word. Most variable-length codes store that implicitly in
>> the data itself, e.g. in the upper three bits, so that for storing
>> 0x5, 0x1001, 0xa0000, this could e.g. end up as 0x054010014a0000,
>> which is shorter than what you have, but not harder to decode.
>
> AFAIU, the length (`depth') of each word is not stored separate, as the
> depth is the same for all values in the same table.

That is correct.  Each table has a single depth stored in the region descriptor.
