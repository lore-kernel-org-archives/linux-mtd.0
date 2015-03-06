Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTuZD-0003NO-5N
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 15:53:35 +0000
Received: by iecvy18 with SMTP id vy18so22387337iec.9
 for <linux-mtd@lists.infradead.org>; Fri, 06 Mar 2015 07:53:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150304192453.GO18140@ld-irv-0074>
References: <1423520026-27068-1-git-send-email-namnguyen@chromium.org>
 <CAAK6Zt1YM+bBKwkEZ2nT5iWYaL0HOvfTWj_xAq+5fp4spcZJXA@mail.gmail.com>
 <20150304185119.GL18140@ld-irv-0074>
 <20150304192453.GO18140@ld-irv-0074>
Date: Fri, 6 Mar 2015 16:53:13 +0100
Message-ID: <CAAQYJAv2j8zVDL3G=Ux-1k4YxpT2Su9gUeOiww647b=kP5fQ+Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd-utils: Add nandpart to add/delete partition
From: Andrea Adami <andrea.adami@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Nam T. Nguyen" <namnguyen@chromium.org>,
 Mike Frysinger <vapier@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Daniel Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 4, 2015 at 8:24 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Mar 04, 2015 at 10:51:19AM -0800, Brian Norris wrote:
>> On Wed, Mar 04, 2015 at 10:45:44AM -0800, Daniel Ehrenberg wrote:
>> > On Mon, Feb 9, 2015 at 2:13 PM, Nam T. Nguyen <namnguyen@chromium.org> wrote:
>> > > Add a simple utility to exercise BLKPG ioctl.
>> > >
>> > > Signed-off-by: Nam T. Nguyen <namnguyen@chromium.org>
>> >
>> > Suggestion: rename to flash_part.c . This utility is not
>> > nand-specific, and flash_ is used for general MTD utilities.
>>
>> Agreed.
>
> I'll retract that a bit. I think mtdpart might make more sense.
> (Following after mtdinfo, rather than flash_erase.) And technically, not
> all MTD's are flash.
>
> Brian
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

While fiddling with BLKPG and mtd, would it be useful to implement
BLKPG_RESIZE_PARTITION to have repartitoning on the fly? Maybe with a
separate tool like i.e. https://patchwork.ozlabs.org/patch/60224/ ?

Regards
Andrea
