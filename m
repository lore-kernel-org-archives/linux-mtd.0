Received: from mail-vc0-x22a.google.com ([2607:f8b0:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq7Q1-00019V-Kx
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 20:27:06 +0000
Received: by mail-vc0-f170.google.com with SMTP id la4so811507vcb.1
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 12:26:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131209184410.GP27149@ld-irv-0074.broadcom.com>
References: <1885453.87ds9Vg2nc@leonp.plris.com>
 <CAFLxGvyvB_tTsVm1j6H26W+its4+ko8Ug5vmSBk0zRp-t3HGuw@mail.gmail.com>
 <2617855.2mDaZaEr79@leonp.plris.com>
 <20131209184410.GP27149@ld-irv-0074.broadcom.com>
Date: Mon, 9 Dec 2013 21:26:43 +0100
Message-ID: <CAFLxGvzDF4sGVR2Mw9jqK9v8aCvX+cNu+KJb=Zxf31w16VH3Uw@mail.gmail.com>
Subject: Re: Erase error does not mark smth in BBT
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Leon Pollak <leonp@plris.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 9, 2013 at 7:44 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Dec 09, 2013 at 05:02:29PM +0200, Leon Pollak wrote:
>> On Sunday 08 December 2013 15:43:33 Richard Weinberger wrote:
>> > On Sun, Dec 8, 2013 at 10:51 AM, Leon Pollak <leonp@plris.com> wrote:
>> > > I am studying the code in nand_base.c
>> > > I thought that when erase command ends with an error, the
>> > > corresponding block will be marked as bad or in OOB or in BBT or in
>> > > both.
>> > > I think I walked through the code carefully, but did not find this
>> > > BBT/OOB treatment.
>> > >
>> > > Please, help me - where is my error?
>> >
>> > You're looking at the wrong layer. :-)
>> > Look at the users of mtd_block_markbad().
>>
>> Yes, I understood my problem - I expected to see the BBT update on
>> erasure failure in the kernel driver.
>> But, as I understood after your hint and code study, the BBT update is
>> totally on the "user's" responsibility.
>>
>> ---
>> So, I went to the mtd-utils package.
>
> The mtd_block_markbad() API is actually still a kernel-internal API, so
> Richard was probably pointing you to the few in-kernel users, like UBI
> (drivers/mtd/ubi/io.c) and other filesystems (e.g., JFFS2) or
> translation layers (NFTL?).

Correct. :)

-- 
Thanks,
//richard
