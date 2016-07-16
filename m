Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOPgv-0006eX-Rp
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 13:31:38 +0000
Received: by mail-oi0-x243.google.com with SMTP id d204so242866oig.3
 for <linux-mtd@lists.infradead.org>; Sat, 16 Jul 2016 06:31:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1468662521-17780-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1468662521-17780-1-git-send-email-thomas.petazzoni@free-electrons.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 16 Jul 2016 15:31:15 +0200
Message-ID: <CAFLxGvxp8QDpavrwTKCMXygQb6P1m64zz=JN=auez9gFP7Anng@mail.gmail.com>
Subject: Re: [PATCH mtd-utils] integck: only use execinfo.h when INTEGCK_DEBUG
 is enabled
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
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

On Sat, Jul 16, 2016 at 11:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Guard the usage of execinfo.h by INTEGCK_DEBUG so that by defaut,
> integck builds properly on systems without <execinfo.h> (uClibc and
> musl based systems). As stated in the code, the backtrace()
> functionality of <execinfo.h> will anyway only work properly when
> INTEGCK_DEBUG is defined (it makes all functions non-static, which is
> needed for backtrace to provide some useful information).

But this means in uClibc and musl systems INTEGCK_DEBUG is still not
usable, right?
Instead of papering over the issue we should bite the bullet and add a
libmissing to mtd-utils
to same functionality across all kind of libcs.
IOW when mtd-utils is built against non-glibc we add -lmissing to the
compiler command line.

-- 
Thanks,
//richard
