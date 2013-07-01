Received: from mail-wg0-x229.google.com ([2a00:1450:400c:c00::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtfRa-00086n-SI
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 14:51:07 +0000
Received: by mail-wg0-f41.google.com with SMTP id y10so3672302wgg.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2013 07:50:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1372662331.22014.27.camel@sauron.fi.intel.com>
References: <CAP+RiCCTo-_iH=bXuZMYY_BCMZjZzAkTB7Nm0_B0i2FErv+VAQ@mail.gmail.com>
 <1372662331.22014.27.camel@sauron.fi.intel.com>
Date: Mon, 1 Jul 2013 09:50:44 -0500
Message-ID: <CAP+RiCDA=WnWfja+qa25Va60Wjee9Pcq69B02yMsvtw4BcwcKQ@mail.gmail.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops
From: Brent Taylor <motobud@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have yet to reproduce the oops', but the two patches submitted by
Atrem look like them may correct the issue.  I'll apply the patches
and try to reproduce the issue again.

Thanks for your time,
Brent

On Mon, Jul 1, 2013 at 2:05 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2013-05-13 at 18:09 -0500, Brent Taylor wrote:
>> I'm working with an atmel at91sam9g20 evaluation board
>> (http://www.atmel.com/Images/doc6413.pdf) running the Linux kernel
>> version 3.6.9.  On two occasions I have had the following Oops
>> reported:
>
> Looks like some kind of memory corruption, or use after free. I do not
> have other ideas.
>
> Well, another comment I could give is that the LEB locking in UBI is
> over-engineered, and could be simplified.
>
>> I have found the ubifs-v3.6.git tree but since I'm using version
>> 3.6.9, how can I easily apply all the patches from 3.6 to the current
>> release since some of the patches seem to have already made it into
>> the 3.6.9 release.
>
> We discovered a bug recently which may cause memory corruptions. I do
> not know if it is accountable for this problem or not, but it is worth
> having it. See these patches in the l2-mtd.git tree:
>
> 605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
> 33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid bug
>
> --
> Best Regards,
> Artem Bityutskiy
>
