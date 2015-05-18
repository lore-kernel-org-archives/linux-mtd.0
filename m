Received: from mail-vn0-x22f.google.com ([2607:f8b0:400c:c0f::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuPK7-0000Rb-JC
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 17:59:32 +0000
Received: by vnbf1 with SMTP id f1so1600928vnb.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 10:59:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
 <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
 <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
Date: Mon, 18 May 2015 19:59:08 +0200
Message-ID: <CAFLxGvwTiwCK80V=KBV-okHWFZrng8q=fwjSUj1hmJXS5hqvMg@mail.gmail.com>
Subject: Re: Wear-leveling peculiarities
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Johannes Bauer <weolanwaybqm@spornkuller.de>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 18, 2015 at 7:58 PM, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
> On Mon, May 18, 2015 at 4:09 PM, Johannes Bauer
> <weolanwaybqm@spornkuller.de> wrote:
>> Am 18.05.2015 15:53, schrieb Johannes Bauer:
>>
>>> I don't grasp the whole picture.
>>
>>
>> Obviously.
>>
>> I've been thinking about this some more and had an epiphany pretty much ten
>> seconds after I hit the "send" button on my email.
>>
>> Wear-leveling is working alright, but of course some parts (static operating
>> system components, for example) will never be written a lot of times,
>> because there is no need to change their contents. Wear-leveling is only
>> performed on the sectors which are actively written (and on those which are
>> unoccupied). This would explain the graphs, but is the explanation also
>> correct?
>
> Wear-leveling is done on UBI and UBIFS.

Should be read as *not* UBIFS.

-- 
Thanks,
//richard
