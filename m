Received: from mail157c50.megamailservers.eu ([91.136.10.167]
 helo=mail51c50.megamailservers.eu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggOYo-0000rz-4r
 for linux-mtd@lists.infradead.org; Mon, 07 Jan 2019 06:38:56 +0000
Subject: Re: [PATCH v2] mtd: rawnand: nandsim: Add support to disable subpage
 writes.
To: Richard Weinberger <richard@nod.at>, bbrezillon@kernel.org
Cc: linux-mtd@lists.infradead.org
References: <20181222124008.28046-1-ken@kenjo.org>
 <10756fcb-b284-5465-ed5c-8251cb00d9c2@kenjo.org>
 <6672633.KqxhzBgVKO@blindfold>
From: Kenneth Johansson <ken@kenjo.org>
Message-ID: <0663db61-e9f9-9b10-b1e0-9068cfa0c367@kenjo.org>
Date: Mon, 7 Jan 2019 07:38:42 +0100
MIME-Version: 1.0
In-Reply-To: <6672633.KqxhzBgVKO@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2019-01-03 21:43, Richard Weinberger wrote:
> Kenneth,
>
> Am Samstag, 22. Dezember 2018, 13:53:39 CET schrieb Kenneth Johansson:
>> So there was a comment from Richard on the original patch that got
>> mangled so it did not even have a subject line.
>>
>> The original intent for this patch was to make it possible to setup the
>> simulator with the same parameters as some real hardware.
>> That is the command "mtdinfo /dev/mtdX" would show the same on the
>> simulator as the real hardware.
> Just to make sure: nandsim simulates a given NAND chip but the simulated
> NAND flash controller will always be different.
> Think of ECC layout.

Yes but ecc layout is generally not visible to layers on top of MTD in 
the same way that the smallest writeable block size(sub page) is. It 
just feels strange that the simulator could not simulate lack of subpage 
writes as it do exist on quite a few nand controllers. And in real life 
there is always going to be a controller in front of the nand chip so 
any simulator really should take that into account.
