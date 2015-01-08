Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y96Uv-0007ul-RM
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 06:23:10 +0000
Received: by mail-ig0-f169.google.com with SMTP id z20so1277116igj.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 22:22:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54AE04ED.8080002@vanguardiasur.com.ar>
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
 <54AE04ED.8080002@vanguardiasur.com.ar>
Date: Wed, 7 Jan 2015 22:22:48 -0800
Message-ID: <CALupW3BrZpq1GwJL1VRw8adPUdhR8SmprveTtEOHAiG==AQ=Qw@mail.gmail.com>
Subject: Re: NAND ECC capabilities
From: Steve deRosier <derosier@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Ezequiel!

On Wed, Jan 7, 2015 at 8:17 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> On 01/08/2015 12:10 AM, Steve deRosier wrote:
>> So, doing further experiments and I wondered if someone could confirm
>> this finding.
>>
>> With atmel_nand, we're setup for 4-bit ECC on 512 sectors with a 2k
>> page.  I was thinking about this a bit and realized that there's 4 of
>> these sectors per page, and this implies then that we can detect and
>> correct 4 bad bits _per_ each sector.  Assuming that they're evenly
>> spread, that's up to 16 bad bits per page.  Obviously in practice,
>> that assumption wouldn't hold...
>>
>
> Not sure why you say that woulnd't hold.
>

Ah, simple.  We have a 2048 byte page (2112 if you count the OOB).  4
bits per 512.  Which means 16 per page _assuming_ they're evenly
spread.  That means 4 in the first 512, 4 in the next etc...   But if
all 16 bit flips were in the first 512, boom, we're done (actually,
only need 5 in that first one). There's no reason to believe that the
bitflips would be evenly over the page (in fact, the opposite is often
true, they seem to cluster in my experience).

This NAND doesn't have subpages, it's a 2K page. The ECC hardware can
do the calculations in 1024 or 512 byte chunks. But those are all for
the one page which acts as a single entity.

It's fair to say we can only do 4 bit-flips per page in this case
because the worst case scenario is all the bits in question would be
in the same 512 sector.


Thanks for your reply!

- Steve
