Received: from alias1.ihug.co.nz ([203.96.222.11])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GrLCM-0001an-0X
	for linux-mtd@lists.infradead.org; Mon, 04 Dec 2006 21:18:06 +0000
From: "Gavin Lambert" <gavinl@compacsort.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: MTD pointer alignment
Date: Tue, 5 Dec 2006 10:11:32 +1300
Message-ID: <038001c717e8$c9c98ff0$4800a8c0@gavinlpc>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1165239426.5253.11.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Quoth David Woodhouse [dwmw2@infradead.org]:
> That's news to me. If we don't always align to sizeof(int)
> and have appropriate (i.e. three bytes) padding after the
> initial 'char' field, then surely the 'int' fields are
> sometimes going to be misaligned?
> 
> What platform is this? Precisely how is it padded/aligned?

The int fields do get their natural alignment (ie. three bytes padding
after the initial char).  But that initial char (and the structure as a
whole) is not necessarily aligned on a four-byte boundary.

This is on Coldfire, using m68k-elf-gcc 3.4.4.

Test case for making it go wrong was embedding it in a structure similar
to this:

struct some_device
{
    u8 a_byte_field;
    struct mtd_info mtd;
    struct device dev;
};

The compiler inserted one single byte of padding between the byte field
and the MTD structure, making the structure aligned on a 2-byte
boundary, not a 4-byte one.


However I've now looked at the latest MTD sources (in 2.6.18) and it
looks like this issue may be moot, since file->private_data is now
pointing at some other structure rather than pointing directly at the
mtd_info.  I didn't check where you're keeping your OTP mode info now,
but as long as you're not hijacking bits then it shouldn't be a problem
:)
