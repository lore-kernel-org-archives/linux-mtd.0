Received: from bh-25.webhostbox.net ([208.91.199.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zpfb9-0003xH-C6
 for linux-mtd@lists.infradead.org; Fri, 23 Oct 2015 16:53:47 +0000
Subject: Re: [PATCH -next] mtd: fsl-quadspi: Never build on SPARC
To: Han Xu <xhnjupt@gmail.com>
References: <1445437906-23633-1-git-send-email-linux@roeck-us.net>
 <20151023010757.GI13239@google.com> <5629899C.5040404@roeck-us.net>
 <CA+EcR214vdP=W2Sg0zGHUxywxWcjs6e=+ffW41j7eVvQXb42og@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Han Xu <b45815@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <562A6604.70200@roeck-us.net>
Date: Fri, 23 Oct 2015 09:53:24 -0700
MIME-Version: 1.0
In-Reply-To: <CA+EcR214vdP=W2Sg0zGHUxywxWcjs6e=+ffW41j7eVvQXb42og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/23/2015 09:31 AM, Han Xu wrote:
> On Thu, Oct 22, 2015 at 8:13 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> On 10/22/2015 06:07 PM, Brian Norris wrote:
>>>
>>> + Han
>>>
>>> On Wed, Oct 21, 2015 at 07:31:46AM -0700, Guenter Roeck wrote:
>>>>
>>>> Attempts to build fsl-quadspi on SPARC fail with
>>>>
>>>> drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
>>>> drivers/mtd/spi-nor/fsl-quadspi.c:369:1: error:
>>>>          'LUT_0' undeclared (first use in this function)
>>>> drivers/mtd/spi-nor/fsl-quadspi.c:418:1: error:
>>>>          pasting "LUT_" and "(" does not give a valid preprocessing token
>>>> drivers/mtd/spi-nor/fsl-quadspi.c:418:2: error:
>>>>          implicit declaration of function 'LUT_'
>>>
>>>
>>> I don't think this is only a SPARC problem. The macro concatenation is
>>> generally suspect.
>>>
>>> I see that READ and WRITE are problems at least. If something like
>>> <linux/fs.h> gets included somehow, then these tokens resolve to
>>> integers or expressions before they fall through to literal
>>> concatentation, so we get 'LUT_0' or 'LUT_(1ULL << __REQ_WRITE)' instead
>>> of 'LUT_READ' and 'LUT_WRITE'.
> Hi Brian
> We have two options, either undef READ and WRITE before these macros
> or change the LUT_READ to LUT_FSLREAD and same as WRITE. So what's
> your opinion? Thanks.

Undef sounds like a really bad solution to me.

Guenter

>>>
>> You are right, that deserves a better fix. I'll leave it up to you.
>>
>> Thanks,
>> Guenter
>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
