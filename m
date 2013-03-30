Received: from mail-db8lp0188.outbound.messaging.microsoft.com
 ([213.199.154.188] helo=db8outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULoX9-0003yo-2w
 for linux-mtd@lists.infradead.org; Sat, 30 Mar 2013 05:40:56 +0000
Message-ID: <51567AD3.5030704@caviumnetworks.com>
Date: Fri, 29 Mar 2013 22:40:35 -0700
From: Aaron Williams <Aaron.Williams@caviumnetworks.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: MTD NAND BCH support for 24 bits/1K of ECC correction?
References: <5154C2C5.5000903@caviumnetworks.com>
 <20130329090219.GB6928@parrot.com>
In-Reply-To: <20130329090219.GB6928@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/29/2013 02:02 AM, Ivan Djelic wrote:
> On Thu, Mar 28, 2013 at 10:23:01PM +0000, Aaron Williams wrote:
>> Hi all,
>>
>> I am trying to clean up our OCTEON NAND flash driver in the Linux kernel
>> and enable support for multi-bit ECC using BCH and am having some
>> issues. I am able to successfully work with NAND flash that requires 4
>> bits ECC per 512 bytes but I am having issues with one of our boards
>> that has a NAND device that requires 24 bits of ECC per 1024 bytes.
>>
>> I was wondering if ECC of this magnitude has been successfully tested in
>> the past. By my calculations I should have 42 bytes of ECC per 1K block
>> (m=14, t=24 for 336 bits of ECC data). My problem is that when decoding
>> an encoded block I am seeing that nroots != err in decode_bch() after
>> find_poly_roots(). I am seeing this for all of the blocks I attempt to
>> read. As far as I can tell the data being sent to BCH is good, though it
>> might have a few bad bits but nowhere near 24.
>>
>> I am also seeing this same behavior in my U-Boot code which uses the
>> identical bch and nand_bch code.
>>
> Hi Aaron,
>
> CC-ing your message to linux-mtd which is the place to go for such questions :-)
>
> Your configuration (m=14 t=24 with 1024 bytes of data) has been tested, and should work
> with the BCH library. Could you give some details about your ECC setup:
>
> 1. Are you trying to locate and correct errors from hardware-computed syndromes ?
>
> 2. If yes, did you provide the BCH lib with the specific primitive polynomial used by
>     your hardware ? What is this polynomial ?
>
> 3. Could you provide the ECC bytes generated for the following block patterns:
>    - a 0xff-filled 1024 bytes block
>    - a 0xff-filled 1024 bytes block, except for the first byte set to 0xfe
>    This would help me find out how to setup the library to match your hardware.
>
> Regards,

We are doing the BCH support entirely in software due to limitations of 
our hardware to 1 bit ECC.

I may have to get back to you. I may have found the problem and will try 
and look at it some more next week. It looks like I now have it working 
in U-Boot and the same bug exists in our Linux driver. It wouldn't be 
the first one... our NAND drivers haven't been updated in ages.

-Aaron

-- 
Aaron Williams
Software Engineer
Cavium, Inc.
(408) 943-7198  (510) 789-8988 (cell)
