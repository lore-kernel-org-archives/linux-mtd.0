Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwWLx-0004rc-6L
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 15:30:58 +0000
Received: by mail-oi0-x242.google.com with SMTP id p136so14409502oic.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Oct 2016 08:30:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
References: <0a3eaa21fb0f38743308c9cc9fc5d2373f4877de.1476802288.git.cyrille.pitchen@atmel.com>
 <d4e954c1-0bbb-fc16-4e9a-46c25ec4fb9e@denx.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 18 Oct 2016 17:30:34 +0200
Message-ID: <CAFLxGvy9okx1cHnRhq2U-u574PzAk=Tampw1Fmvp4KzY8vnDnw@mail.gmail.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: add a maintainer for the SPI NOR
 subsystem
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 nicolas.ferre@atmel.com,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 18, 2016 at 5:17 PM, Marek Vasut <marex@denx.de> wrote:
> On 10/18/2016 04:58 PM, Cyrille Pitchen wrote:
>> I would like to volunteer as a maintainer for the SPI NOR part of the MTD
>> subsystem.
>>
>> Over the last months, a significant number of SPI NOR related patches have
>> been submitted, some of them have been reviewed, but very few have finally
>> been merged. Hence, the number of pending SPI NOR related patches continues
>> to increase over the time.
>>
>> Through my work on SPI NOR memories from many manufacturers over the last
>> two years, I've gained a solid understanding of this technology.
>> I've already helped by reviewing patches from other contributors on the
>> mailing list, and would like to help getting those patches integrated by
>> volunteering as a maintainer for this specific area.
>>
>> Boris Brezillon has already stepped up as a maintainer for the NAND
>> sub-subsystem in MTD, and the SPI NOR sub-subsystem could be handled in
>> the same way: I would be reviewing patches touching this area, collecting
>> them and sending pull requests to Brian Norris.

I'd suggest you send pull requests directly to Linus.
Same for NAND.

>> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
>
> Let me know if you need co-maintainer.

+1

While we are here, what about forming a MTD maintainer team?
This concept works very well for other subsystems.

-- 
Thanks,
//richard
