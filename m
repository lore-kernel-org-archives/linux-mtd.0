Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOPkI-0006sk-SK
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 13:35:08 +0000
Date: Sat, 16 Jul 2016 15:34:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH mtd-utils] integck: only use execinfo.h when
 INTEGCK_DEBUG is enabled
Message-ID: <20160716153444.211c4620@free-electrons.com>
In-Reply-To: <CAFLxGvxp8QDpavrwTKCMXygQb6P1m64zz=JN=auez9gFP7Anng@mail.gmail.com>
References: <1468662521-17780-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAFLxGvxp8QDpavrwTKCMXygQb6P1m64zz=JN=auez9gFP7Anng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Sat, 16 Jul 2016 15:31:15 +0200, Richard Weinberger wrote:

> But this means in uClibc and musl systems INTEGCK_DEBUG is still not
> usable, right?

Correct.

> Instead of papering over the issue we should bite the bullet and add a
> libmissing to mtd-utils to same functionality across all kind of libcs.

I'm not sure you really want a copy in libmissing of the backtrace
functionality.

It would be so much better if mtd-utils were using autoconf to
automatically detect the availability of execinfo.h, and adjust the
functionality accordingly. Indeed, having the backtrace is useful, but
is also not mandatory to use integck.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
