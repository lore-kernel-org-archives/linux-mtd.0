Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbCrX-00083T-9T
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 14:32:32 +0000
Received: by yxe42 with SMTP id 42so2250902yxe.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 07:31:40 -0700 (PDT)
Message-ID: <4E089441.3010809@gmail.com>
Date: Mon, 27 Jun 2011 10:31:29 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Preventing JFFS2 partial page writes?
References: <4DF789FC.1030305@gmail.com> <1308722655.18119.40.camel@sauron>	
	<4E020A36.6070708@gmail.com> <1308943581.13493.15.camel@koala>
In-Reply-To: <1308943581.13493.15.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/24/2011 03:26 PM, Artem Bityutskiy wrote:
> On Wed, 2011-06-22 at 11:28 -0400, Peter Barada wrote:
>> Thoughts?
> Sorry, could you please define the problem you are trying to solve?
> Sorry if you did define it in your long post, but I could not easily
> find it.
The problem I'm trying to solve is that the Micron NAND  I'm using has 
an internal 4-bit ECC engine and uses four 8-byte ECCs that provide 
4-bit protection per 512 data bytes + four OOB bytes.  The ecclayout I'm 
using is:

ecclayout = {
         eccbytes = 32,
         eccpos = { 8, 9, 10, 11, 12, 13, 14, 15, /* ECC data bytes 
0-511 + OOB bytes 4-7 */
                 24, 25, 26, 27, 28, 19, 30, 31, /* ECC data bytes 
512-1023 + OOB bytes 20-23 */
                 40, 41, 42, 43, 44, 45, 46, 47,  /* ECC data bytes 
1024-1535 + OOB bytes 36-39 */
                 56, 57, 58, 59, 60, 61, 62, 63},  /* ECC data bytes 
1536-2047 + OOB bytes 52-55 */
         .oobfree = {
                 { .offset = 4,
                   .length = 4},
                 { .offset = 20,
                   .length = 4},
                 { .offset = 36,
                   .length = 4},
                 { .offset = 52,
                   .length = 4},
         },
};

After the JFFS2 cleanmarker is written into bytes 4-7 and 16-23 of the 
OOB, nanddump shows:

   OOB Data: ff ff ff ff 85 19 03 20 5a e3 da 69 01 40 f1 36
   OOB Data: ff ff ff ff 08 00 00 00 91 99 3c 05 01 d0 5d b3
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Note that the ECC bytes 8-15 and 24-31 are no longer FF due to bytes 4-7 
and bytes 20-23 being written with non-zero data.

When data is later written to this same page (w/o an intervening erase 
of its block) reading the page causes an uncorrectable ECC error.

There are eight additional bytes of OOB space available for writing, but 
they are not ECC'd.

The issue I'm trying to solve is how to communicate from MTD to JFFS2 
that some bytes of the oobfree array perturb the data ECC and can not be 
used to write the cleanmarker.

-- 
Peter Barada
peter.barada@gmail.com
