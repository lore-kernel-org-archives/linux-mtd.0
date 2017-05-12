Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d961J-00053D-KB
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 08:33:55 +0000
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Mario Rugiero <mrugiero@gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <ecb9a289-cac4-d7b1-1897-ed52553407e3@nod.at>
Date: Fri, 12 May 2017 10:33:27 +0200
MIME-Version: 1.0
In-Reply-To: <20170512102407.217b805a@bbrezillon>
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

Boris, Mario,

Am 12.05.2017 um 10:24 schrieb Boris Brezillon:
>>> Hmm, this sounds like a gross hack.  
>> It is, but I see no other solution. The NAND chips were used in an
>> incompatible way by a hack-n-slash driver made by allwinner, and
>> trying to load them with a proper MTD driver fails miserably if this
>> is not done.
>> If anyone can propose a better solution I'll more than happily implement it.
>> I'm open to suggestions, and of course I'm open to rejection of my
>> patches if needed.
> 
> u-boot provides the nand.scrub command, which does exactly what you're
> looking for. And no, I don't think it's a good idea to allow erasing
> bad blocks, at least not by default.

To make this very clear for all MTD users out there, scrubbing the NAND and
losing the information which blocks are bad is awful.
Bad blocks can work somehow and fail much later in funny ways.
UBI/FS problems ahead...

Do this only if you *really* know what you are doing.

Thanks,
//richard
