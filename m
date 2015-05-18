Received: from mail-vn0-x229.google.com ([2607:f8b0:400c:c0f::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuPJK-0000Fv-V8
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 17:58:43 +0000
Received: by vnbg190 with SMTP id g190so7107646vnb.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 10:58:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
References: <5b9c6106e355c0a676481e1de95ad15c@joe.dyn.spornkuller.de>
 <55f052b8b8f65bf34b0ed9f20b4f2f07@joe.dyn.spornkuller.de>
Date: Mon, 18 May 2015 19:58:20 +0200
Message-ID: <CAFLxGvxQeeA8dk7DY6ZcsAm0WBch7c6gOn92gUZB138B6bfeGA@mail.gmail.com>
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

On Mon, May 18, 2015 at 4:09 PM, Johannes Bauer
<weolanwaybqm@spornkuller.de> wrote:
> Am 18.05.2015 15:53, schrieb Johannes Bauer:
>
>> I don't grasp the whole picture.
>
>
> Obviously.
>
> I've been thinking about this some more and had an epiphany pretty much ten
> seconds after I hit the "send" button on my email.
>
> Wear-leveling is working alright, but of course some parts (static operating
> system components, for example) will never be written a lot of times,
> because there is no need to change their contents. Wear-leveling is only
> performed on the sectors which are actively written (and on those which are
> unoccupied). This would explain the graphs, but is the explanation also
> correct?

Wear-leveling is done on UBI and UBIFS.
What is CONFIG_MTD_UBI_WL_THRESHOLD set to?

>From the Kconfig help:
          This parameter defines the maximum difference between the highest
          erase counter value and the lowest erase counter value of eraseblocks
          of UBI devices. When this threshold is exceeded, UBI starts performing
          wear leveling by means of moving data from eraseblock with low erase
          counter to eraseblocks with high erase counter.

          The default value should be OK for SLC NAND flashes, NOR flashes and
          other flashes which have eraseblock life-cycle 100000 or more.
          However, in case of MLC NAND flashes which typically have eraseblock
          life-cycle less than 10000, the threshold should be lessened (e.g.,
          to 128 or 256, although it does not have to be power of 2)

I suspect that your threshold was never reached.
>From your provided graph it looks like all erase block have been
erased t most 300 times.
If your NAND starts dying after 300 erases you're in trouble.

-- 
Thanks,
//richard
