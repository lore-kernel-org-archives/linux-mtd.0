Received: from mail-ve0-f171.google.com ([209.85.128.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRRkU-0003sy-9c
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 19:06:15 +0000
Received: by mail-ve0-f171.google.com with SMTP id pa12so987419veb.30
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 12:05:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1310020954040.18310@lnxricardw.se.axis.com>
References: <CAHqTa-0d=U+W2nju8WeCJ=gL+ja8DVuK0BUquajOL6qXV5C0+g@mail.gmail.com>
 <alpine.DEB.2.00.1310020954040.18310@lnxricardw.se.axis.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Wed, 2 Oct 2013 12:05:28 -0700
Message-ID: <CAHqTa-2tS_Kw6973m22KehWWTGReCAzjhw5Mwga6sFsHAaOwYQ@mail.gmail.com>
Subject: Re: Page corruption when writing non-sequential pages in an MLC NAND
 eraseblock
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 2, 2013 at 12:58 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
> On Wed, 2 Oct 2013, Avery Pennarun wrote:
>> Steps:
>> - Disable ECC to avoid any confusion (ECC turns out to not affect the
>> test results, but I wanted to make sure)
>> - Erase any eraseblock
>> - Write all-zeroes to page 0x18 of that eraseblock; read it back -> ok
>> - Write all-zeroes to page 0x12 of that eraseblock; read it back ->
>> FAIL, all 0xff instead
>> - Read page 0x18 -> completely random data (about 12% of bits are flipped)
>
> Not much help, but AFAIU, you can get so-called 'write disturb' when writing
> to the other page in a pair, even without power failure during the write.
> But to my mind, 12% flipped bits sounds very excessive. I don't have any
> experience with MLC though.
>
> Instictively it sounds like there is some other mechanism causing problems,
> for instance if mtd does the write to the pages in two goes, rather than in
> one write, as I think MLC in general can only accept one write operation per
> page, in contrast to SLC where it is legal to write the main and oob data at
> different times (normally 2 or 3 writes per page is legal, after that the
> page must be erased or the data can not be considered stable).

Thanks Ricard.  Based on this suggestion, I added some trace printk's
to the nand driver and did find that it was writing the data, then the
oob, for each page.  So I commented out all the code that writes to
the oob (since I have ECC disabled anyhow for this test).  The traces
now show just two 4096-byte page writes.  But the problem still
occurs.  So I think that rules out this theory, unless I missed some
ways the nand can be written.

Note that I was slightly mistaken earlier: the number of flipped bits
seems to sometimes be 12%, sometimes 25%.  It's a little suspicious
that this is almostly exactly 1/8 and 1/4 respectively.
