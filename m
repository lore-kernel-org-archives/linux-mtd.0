Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3AsG-0007IN-8F
	for linux-mtd@lists.infradead.org; Mon, 21 Feb 2005 05:33:09 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Lior Balkohen <balkohen@gmail.com>
In-Reply-To: <196b7d31050219120065170409@mail.gmail.com>
References: <196b7d31050219120065170409@mail.gmail.com>
Content-Type: text/plain
Date: Mon, 21 Feb 2005 13:32:33 +0300
Message-Id: <1108981953.13420.46.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS3 & performance checksum test results.
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-02-19 at 21:00 +0100, Lior Balkohen wrote:
> I don't know where/whom to provide to results, so I send the results
> for my IBM embedded powerpc 405 based set top box to the linux-mtd
> list. I hope, I'm right here.

Thank you Lior.

After we've talked with Joern at IRC we are in substantial agreement
that it is good idea not to switch to adler32 and keep CRC32.

The main reason is weakness of adler32 checksum algorithm:
1. It is claimed that the a-priori probability of checksum collisions
might be much higher that 1/2^32 when adler32 ais applied to short data
chunks.

2. It is asserted that adler32 becomes weak (and doesn't detect even
some 1-bit errors) for data chunks > 5552 bytes.

Particularly, SCTP protocol's checksum has recently been changed from
adler32 to CRC32c. For more information, see RFC3309.

But the test is still actual - we can observe the difference between
forward/backward calculation directions.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
