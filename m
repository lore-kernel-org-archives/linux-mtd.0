Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cc4sS-0000Hj-Rh
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 06:40:19 +0000
Received: by mail-wm0-x234.google.com with SMTP id r141so39777457wmg.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 22:39:56 -0800 (PST)
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com> <20170210024624.GA142725@google.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <85f9f5e3-dc2f-40de-9932-e99f0c0a1721@gmail.com>
Date: Fri, 10 Feb 2017 07:39:39 +0100
MIME-Version: 1.0
In-Reply-To: <20170210024624.GA142725@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.02.2017 um 03:46 schrieb Brian Norris:
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
The patch was submitted in Aug 2016 already and there was also an inquiry
to get it into 4.9:
http://lists.infradead.org/pipermail/linux-mtd/2016-September/069363.html

But due to whatever circumstances nothing happened and there was no
response.

> OK, I've reviewed the rest of the pull request as well as I care for.
> I still have this one objection: I don't think this belongs in -stable.
> 
> Am I crazy? Or else Cyrille, can you remove the stable tag and resend?
> Or I can go rewrite your history for you and do this...
> 
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
