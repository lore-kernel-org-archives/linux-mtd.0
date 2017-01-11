Received: from mail-wj0-x244.google.com ([2a00:1450:400c:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRHif-0007TJ-IS
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2017 12:09:35 +0000
Received: by mail-wj0-x244.google.com with SMTP id qs7so52961711wjc.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2017 04:09:13 -0800 (PST)
Subject: Re: [PATCH v3 4/7] mtd: nand: raw: prefix conflicting names with
 nandc instead of nand
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
 <1479732328-18363-5-git-send-email-boris.brezillon@free-electrons.com>
 <8fb86bb7-425a-3897-2d1d-7277e94918ec@gmail.com>
 <20170111084613.69e80a40@bbrezillon>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Peter Pan <peterpansjtu@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Kelvin Cheung <keguang.zhang@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <47760b42-607c-bcae-18b9-3ede5773125a@gmail.com>
Date: Wed, 11 Jan 2017 13:09:09 +0100
MIME-Version: 1.0
In-Reply-To: <20170111084613.69e80a40@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/11/2017 08:46 AM, Boris Brezillon wrote:
> On Tue, 10 Jan 2017 20:08:23 +0100
> Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>> On 11/21/2016 01:45 PM, Boris Brezillon wrote:
>>> Some raw NAND function names conflict with names defined in nand.h.
>>> Prefix all those functions with nandc (for nand chip) instead of nand so
>>> we can include nand.h from rawnand.h
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>  
>>
>> Nit, nand and nandc is quite confusing, why not call it nand_chip in full?
>>
> 
> Indeed, the name is confusing as hell, I just tried to keep it
> short but that's probably not a good idea.
> Maybe I should just prefix/suffix the new functions with nanddev instead
> of changing the existing ones. What do you think?

That'd be less intrusive, but tbh, if the name is descriptive enough, I
don't care either way. What does 'nanddev' imply though ? NAND device as
in physical device or chip or just a kernel device object ? :-)

-- 
Best regards,
Marek Vasut
