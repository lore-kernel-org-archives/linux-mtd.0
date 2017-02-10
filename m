Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAoV-0004h2-SW
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 13:00:38 +0000
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Brian Norris <computersforpeace@gmail.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com> <20170210024624.GA142725@google.com>
CC: Heiner Kallweit <hkallweit1@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Boris BREZILLON
 <boris.brezillon@free-electrons.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, MTD
 Maling List <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Mark Brown <broonie@kernel.org>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <da21420a-e90a-d873-8f59-e376e4dac37b@atmel.com>
Date: Fri, 10 Feb 2017 14:00:10 +0100
MIME-Version: 1.0
In-Reply-To: <20170210024624.GA142725@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 10/02/2017 à 03:46, Brian Norris a écrit :
> On Wed, Feb 08, 2017 at 11:09:39AM -0800, Brian Norris wrote:
>> On Wed, Feb 08, 2017 at 11:36:10AM +0100, Cyrille Pitchen wrote:
>>> Le 08/02/2017 à 06:52, Heiner Kallweit a écrit :
>>>> Am 08.02.2017 um 02:09 schrieb Marek Vasut:
>>>>> On 02/07/2017 04:31 PM, Cyrille Pitchen wrote:
>>> [...]
>>>>>> Heiner Kallweit (1):
>>>>>>       mtd: m25p80: consider max message size in m25p80_read
>>>>>
>>>>> I cannot say I'm super-happy about this particular patch, still ...
>>>>>
>>>> W/o it at least the fsl-espi driver is broken for transfers >= 64kB.
>>>>
> [...]
> 
>> One thing I do object to: why is this change marked for stable? It's not
>> our fault you broke your duct-taped-together SPI driver in 4.9. I don't
>> think backporting features is the way to satisfy the -stable
>> requirements. Maybe some reverts would be the right way...
> 
> OK, I've reviewed the rest of the pull request as well as I care for.
> I still have this one objection: I don't think this belongs in -stable.
> 
> Am I crazy? Or else Cyrille, can you remove the stable tag and resend?
> Or I can go rewrite your history for you and do this...
>

No problem, I'm rewriting the history to prepare a new PR :)

So 2 modifications:
1 - remove the stable tag from "mtd: spi-nor: rename SPINOR_OP_* macros of
the 4-byte address op codes"
2 - fix * alignment in comment in "mtd: spi-nor: Add support for S3AN
spi-nor devices"

Best regards,

Cyrille


> Brian
> 
> P.S. Also, this stuck out at me in the diffs, and checkpatch complained
> too. Not a real big deal:
> 
> WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each
> line
> #42: FILE: drivers/mtd/spi-nor/spi-nor.c:83:
> +					 * ATMEL flashes)
> +					*/
> 
> total: 0 errors, 1 warnings, 264 lines checked
> 
> 
