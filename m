Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVz5C-0000dF-Ro
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 08:34:56 +0000
Date: Mon, 22 Sep 2014 10:34:25 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Does UBI LEB-level access interlock happily with UBIfs access?
In-Reply-To: <CAFLxGvyqz5k98uTLCgLZfOYKBybLbddxN1K_f1ADmvpiPViF3A@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1409221027560.15431@lnxricardw1.se.axis.com>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
 <1411140449.28850.152.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301A@dekaexchange07.deka.local>
 <1411146833.23429.11.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301C@dekaexchange07.deka.local>
 <1411147451.23429.20.camel@sauron.fi.intel.com>
 <CAFLxGvyqz5k98uTLCgLZfOYKBybLbddxN1K_f1ADmvpiPViF3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Atlant Schmidt <aschmidt@dekaresearch.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 20 Sep 2014, Richard Weinberger wrote:

> On Fri, Sep 19, 2014 at 7:24 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Fri, 2014-09-19 at 13:17 -0400, Atlant Schmidt wrote:
>>> But as I pointed, this will not force re-read of the volume table LEBs.
>>> To address this, you'd need to do some additional, not very difficult
>>> work.
>>
>> Oh, and this won't make UBI re-read the EC and VID headers, so they may
>> bit-rot too.
>>
>> So indeed it sounds like UBI needs a separate interface for this kind of
>> "scrub all bit-flips" issues. I do not think it is hard to do - all the
>> mechanisms are already implemented, so this would mostly be about
>> inventing good API.
>
> We could implement a trivial knob to trigger such a check in kernel.
> I.e. you trigger the check via an ioctl() or whatever and UBI schedules
> such a read-check for every PEB into the UBI background thread.

During the scanning operation that takes place when a partition is 
attached, doesn't this also trigger a check of all headers, as all the 
data needs to be read as part of the ubiattach process?

Not that that would be a practical solution for many systems where it is 
not practical to detach and re-attach, for instance the partition where 
the root volume is located, as that would in practice require a reboot.

> I'd volunteer to implement this.

I think it would be good if such a forced re-read could be set to happen 
automatically at a specified interval, say by default once a day.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
