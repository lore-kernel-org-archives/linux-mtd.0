Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAw0-0000F9-RL
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 13:08:25 +0000
Received: by mail-wm0-x243.google.com with SMTP id v77so7285571wmv.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 05:07:59 -0800 (PST)
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com> <20170210024624.GA142725@google.com>
 <85f9f5e3-dc2f-40de-9932-e99f0c0a1721@gmail.com>
Cc: Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <b0da3e92-3734-62dc-e112-8541d61cf986@gmail.com>
Date: Fri, 10 Feb 2017 14:07:56 +0100
MIME-Version: 1.0
In-Reply-To: <85f9f5e3-dc2f-40de-9932-e99f0c0a1721@gmail.com>
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

On 02/10/2017 07:39 AM, Heiner Kallweit wrote:
> Am 10.02.2017 um 03:46 schrieb Brian Norris:
>> On Wed, Feb 08, 2017 at 11:09:39AM -0800, Brian Norris wrote:
>>> On Wed, Feb 08, 2017 at 11:36:10AM +0100, Cyrille Pitchen wrote:
>>>> Le 08/02/2017 à 06:52, Heiner Kallweit a écrit :
>>>>> Am 08.02.2017 um 02:09 schrieb Marek Vasut:
>>>>>> On 02/07/2017 04:31 PM, Cyrille Pitchen wrote:
>>>> [...]
>>>>>>> Heiner Kallweit (1):
>>>>>>>       mtd: m25p80: consider max message size in m25p80_read
>>>>>>
>>>>>> I cannot say I'm super-happy about this particular patch, still ...
>>>>>>
>>>>> W/o it at least the fsl-espi driver is broken for transfers >= 64kB.
>>>>>
>> [...]
>>
>>> One thing I do object to: why is this change marked for stable? It's not
>>> our fault you broke your duct-taped-together SPI driver in 4.9. I don't
>>> think backporting features is the way to satisfy the -stable
>>> requirements. Maybe some reverts would be the right way...
>>
> The patch was submitted in Aug 2016 already and there was also an inquiry
> to get it into 4.9:
> http://lists.infradead.org/pipermail/linux-mtd/2016-September/069363.html
> 
> But due to whatever circumstances nothing happened and there was no
> response.

Is that a bugfix ?

-- 
Best regards,
Marek Vasut
