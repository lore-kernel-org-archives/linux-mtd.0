From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Pete MacKay'" <linux@architechnical.net>, <linux-mtd@lists.infradead.org>
References: <35297.69.30.123.186.1176335422.squirrel@architechnical.net>
Subject: RE: "OneNAND oobfree" revisited
Date: Thu, 12 Apr 2007 17:09:27 +0900
Message-ID: <004e01c77cd9$e79f6940$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-reply-to: <35297.69.30.123.186.1176335422.squirrel@architechnical.net>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> In this conversation between Adrian and Kyungmin it's stated that the
> OneNAND driver optimizes memcpy for 32-bit transfers:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2007-January/01
> 7201.html
> 
> While this might work on some platforms, it seems to cause 
> bus errors on
> our PXA-270-based machine.  So I replace memcpy, memset, and 
> memcmp with
> local routines optimized for 16-bit access and the crashes go away.  I
> also tried overriding the optimization with "EXTRA_CFLAGS += 
> -O0" in the
> Makefile but I doubt it has any effect.
> 
> My issue with this is that I'd have to patch onenand_base.c, 
> or I could
> put conditionals in, but either way I'm wondering if there's 
> a cleaner way
> to fix this.  Any ideas?
> 

The memcpy, memset, and memcmp is arm generic routine. It is located in
arch/arm/lib/* .
Even though you send the unaligned buffer, it is handled by onenand driver.
Actually it's not happend with recent code

       if (ONENAND_CHECK_BYTE_ACCESS(count)) {
                unsigned short word;

                /* Align with word(16-bit) size */
                count--;

                /* Read word and save byte */
                word = this->read_word(bufferram + offset + count);
                buffer[count] = (word & 0xff);
        }

First, Check who send the unaligned buffer.
Second, if there are some unwanted oobfree access, use this->oobbuf instaed of
passed buffer.
e.g., read oob with this->oobbuf and copy this->oobbuf to passed buffer.

Could you point out which code are problem? onenand_read_oob,
onenand_write_oob???

Thank you,
Kyungmin Park
