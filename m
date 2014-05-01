Message-ID: <536284E1.50001@free-electrons.com>
Date: Thu, 01 May 2014 19:31:13 +0200
From: Boris BREZILLON <boris.brezillon@free-electrons.com>
MIME-Version: 1.0
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [RFC PATCH 0/3] mtd: nand: add randomizer support
References: <1398906592-24677-1-git-send-email-b.brezillon.dev@gmail.com>
 <20140501163407.GB3296@obsidianresearch.com>
In-Reply-To: <20140501163407.GB3296@obsidianresearch.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 01/05/2014 18:34, Jason Gunthorpe wrote:
> On Thu, May 01, 2014 at 03:09:49AM +0200, Boris BREZILLON wrote:
>> Hello,
>>
>> This series is a proposal to add support for randomizers (either software
>> or hardware) to NAND flash controller drivers.
> FWIW, I think the term for reversibly combining a PRBS with data is
> 'scrambling', it is often used in communication systems for similar
> reasons - probabilisticly increasing transition density.
>
> randomizing is something else entirely :)

I totally agree with you, this is not a randomizer but rather a scrambler.
The reason I chose the "randomizer" word is that all the documents I
read are talking about randomizers.
But, other than I don't have any concern about changing all references
to "randomizer" into "scrambler" ;-).

>
> BTW, there are security concerns here. The scrambler PRBS must not be
> predictable by the user, otherwise they can write data that undoes the
> scramble and defeat it, ie deliberately writing the last 2k of a 4k
> write block as all 0's after scrambling could cause the first 2k to be
> lost. That feels like something that could be scary ..

AFAICT, the scramblers/randomizers used in NAND applications are all
predictable, which means the scrambler state does not depend on the last
data being scrambled.
For example, the sunxi HW scrambler is using a Fibonacci LFSR [1].
Do you have any example of non predictable scrambler that are used to
scramble NAND data ?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
