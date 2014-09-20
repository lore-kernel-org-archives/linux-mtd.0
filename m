Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVKC8-0006Zc-0g
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 12:55:20 +0000
Received: by mail-vc0-f178.google.com with SMTP id lf12so494873vcb.23
 for <linux-mtd@lists.infradead.org>; Sat, 20 Sep 2014 05:54:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411147451.23429.20.camel@sauron.fi.intel.com>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
 <1411140449.28850.152.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301A@dekaexchange07.deka.local>
 <1411146833.23429.11.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301C@dekaexchange07.deka.local>
 <1411147451.23429.20.camel@sauron.fi.intel.com>
Date: Sat, 20 Sep 2014 14:54:57 +0200
Message-ID: <CAFLxGvyqz5k98uTLCgLZfOYKBybLbddxN1K_f1ADmvpiPViF3A@mail.gmail.com>
Subject: Re: Does UBI LEB-level access interlock happily with UBIfs access?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 19, 2014 at 7:24 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2014-09-19 at 13:17 -0400, Atlant Schmidt wrote:
>> But as I pointed, this will not force re-read of the volume table LEBs.
>> To address this, you'd need to do some additional, not very difficult
>> work.
>
> Oh, and this won't make UBI re-read the EC and VID headers, so they may
> bit-rot too.
>
> So indeed it sounds like UBI needs a separate interface for this kind of
> "scrub all bit-flips" issues. I do not think it is hard to do - all the
> mechanisms are already implemented, so this would mostly be about
> inventing good API.

We could implement a trivial knob to trigger such a check in kernel.
I.e. you trigger the check via an ioctl() or whatever and UBI schedules
such a read-check for every PEB into the UBI background thread.

I'd volunteer to implement this.

-- 
Thanks,
//richard
