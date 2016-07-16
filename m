Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOR8Y-0006hp-QA
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 15:04:15 +0000
Received: by mail-oi0-x241.google.com with SMTP id w143so11866365oiw.2
 for <linux-mtd@lists.infradead.org>; Sat, 16 Jul 2016 08:03:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160716153444.211c4620@free-electrons.com>
References: <1468662521-17780-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAFLxGvxp8QDpavrwTKCMXygQb6P1m64zz=JN=auez9gFP7Anng@mail.gmail.com>
 <20160716153444.211c4620@free-electrons.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 16 Jul 2016 17:03:50 +0200
Message-ID: <CAFLxGvznhhcYB9GDKd0SmBxssYKZrQDeXB9WU=4kJgDcicG+QA@mail.gmail.com>
Subject: Re: [PATCH mtd-utils] integck: only use execinfo.h when INTEGCK_DEBUG
 is enabled
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Oberhollenzer <goliath@sigma-star.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

On Sat, Jul 16, 2016 at 3:34 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 16 Jul 2016 15:31:15 +0200, Richard Weinberger wrote:
>
>> But this means in uClibc and musl systems INTEGCK_DEBUG is still not
>> usable, right?
>
> Correct.
>
>> Instead of papering over the issue we should bite the bullet and add a
>> libmissing to mtd-utils to same functionality across all kind of libcs.
>
> I'm not sure you really want a copy in libmissing of the backtrace
> functionality.

It is not only backtraceing, there are more features we gave up in
favor to non-glibc.
Using a libmissing we could better deal with that.
This is patch is by far not the first one to make mtd-utils work/build
on non-glibc systems.

> It would be so much better if mtd-utils were using autoconf to
> automatically detect the availability of execinfo.h, and adjust the
> functionality accordingly. Indeed, having the backtrace is useful, but
> is also not mandatory to use integck.

David is currently reviving my autoconf patch. That's why we're
currently thinking of
mechanisms to make mtd-utils better.

-- 
Thanks,
//richard
