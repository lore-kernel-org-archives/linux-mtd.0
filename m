Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYCxQ-0005nD-Ux
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 12:20:22 +0000
Message-ID: <55096D6D.5000707@nod.at>
Date: Wed, 18 Mar 2015 13:19:57 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Tanya Brokhman <tlinder@codeaurora.org>, ricard.wanderlof@axis.com
Subject: Re: [PATCH 2/2] ubi-utils: ubinize: Add fastmap suport to image
 creation
References: <1426668763-6463-1-git-send-email-tlinder@codeaurora.org>
 <550951C9.2040509@nod.at> <550956D7.9030309@codeaurora.org>
 <55095E45.8030401@nod.at> <55096BA6.1030708@codeaurora.org>
In-Reply-To: <55096BA6.1030708@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 18.03.2015 um 13:12 schrieb Tanya Brokhman:
>> We should still add a big and fat warning.
> 
> In ubinize? yes, you're probably right. Will do. But if it's ok with you, I'll wait to get some inputs on the code before uploading another version.

In ubinize. Yes, there no need to hurry. :-)

>>
>>>> Maybe it would make sense to but the whole fastmap creation logic into the flasher.
>>>
>>> But then you will delay the flashing process and this time is valuable. We're always looking for ways to decrease flashing of the images and the first boot duration.
>>
>> But if your flasher will invalidate fastmap if it faces a bad block a certain amount of board will still boot slowly. Can you deal with that?
>> As I said NAND is allowed to be shipped with bad blocks.
> 
> If my flasher finds bad blocks and invalidates fastmap - then the boot time will be as it was before, without this enhancement. The flashing time will be delayed by T_erase +
> T_write_header for one PEB -> can be neglected. If We implement the whole fastmap generation in flasher then the  flashing time will increase significantly.

I'm sure I miss something, how log does the fastmap creation take?
If you update the image in memory it should be extremely fast.
I.e. scan the NAND for bad blocks, amend the image and flash it.

>>
>>> Also, if you move this logic inside the flasher, perhaps we can skip ubinize at all since it feels like the logic will be just duplicated.
>>
>> It is not uncommon to skip ubinize.
>>
>>>> We could create a libfastmap (LGPLv2) such that everyone is allowed to use it in his custom
>>>> flasher.
>>>
>>> Perhaps. It wont work for us though, so unfortunately I wont be able to help out with that if this is the solution you prefer.
>>
>> Why would this not work for your? Don't you have the sources of your flasher?
>> Of course we'd have to write libfastmap in a way such that one can use it on non-Linux systems like a bootloader.
> 
> I do have the source (just updated it). I meant that implementing libfastmap and integrating it into our flasher will be too much work and it's just not justified in our case, so I
> wont be able to do it. Sorry....

Okay.

Thanks,
//richard
