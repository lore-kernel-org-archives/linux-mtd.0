Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVzD9-00012H-OA
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 08:43:08 +0000
Message-ID: <541FE100.5040802@nod.at>
Date: Mon, 22 Sep 2014 10:42:40 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Does UBI LEB-level access interlock happily with UBIfs access?
References: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
 <1411140449.28850.152.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301A@dekaexchange07.deka.local>
 <1411146833.23429.11.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301C@dekaexchange07.deka.local>
 <1411147451.23429.20.camel@sauron.fi.intel.com>
 <CAFLxGvyqz5k98uTLCgLZfOYKBybLbddxN1K_f1ADmvpiPViF3A@mail.gmail.com>
 <alpine.DEB.2.02.1409221027560.15431@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1409221027560.15431@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
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

Am 22.09.2014 10:34, schrieb Ricard Wanderlof:
> 
> On Sat, 20 Sep 2014, Richard Weinberger wrote:
> 
>> On Fri, Sep 19, 2014 at 7:24 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>> On Fri, 2014-09-19 at 13:17 -0400, Atlant Schmidt wrote:
>>>> But as I pointed, this will not force re-read of the volume table LEBs.
>>>> To address this, you'd need to do some additional, not very difficult
>>>> work.
>>>
>>> Oh, and this won't make UBI re-read the EC and VID headers, so they may
>>> bit-rot too.
>>>
>>> So indeed it sounds like UBI needs a separate interface for this kind of
>>> "scrub all bit-flips" issues. I do not think it is hard to do - all the
>>> mechanisms are already implemented, so this would mostly be about
>>> inventing good API.
>>
>> We could implement a trivial knob to trigger such a check in kernel.
>> I.e. you trigger the check via an ioctl() or whatever and UBI schedules
>> such a read-check for every PEB into the UBI background thread.
> 
> During the scanning operation that takes place when a partition is attached, doesn't this also trigger a check of all headers, as all the data needs to be read as part of the
> ubiattach process?

Only headers will be read.
And with fastmap enabled only very few of these headers are read.

> Not that that would be a practical solution for many systems where it is not practical to detach and re-attach, for instance the partition where the root volume is located, as that
> would in practice require a reboot.
> 
>> I'd volunteer to implement this.
> 
> I think it would be good if such a forced re-read could be set to happen automatically at a specified interval, say by default once a day.

cron can trigger that easily.

Thanks,
//richard
