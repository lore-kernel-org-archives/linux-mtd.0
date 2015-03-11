Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVbcf-0005qm-CK
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 08:04:10 +0000
Received: by wghl2 with SMTP id l2so7261418wgh.8
 for <linux-mtd@lists.infradead.org>; Wed, 11 Mar 2015 01:03:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150310173948.GB4124@norris-Latitude-E6410>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
 <20150309230250.GA13266@ld-irv-0074>
 <CAH6sp9P0mfhK3kq-uD-J2f_uCinKzuircAh7gOs354g98B6qAg@mail.gmail.com>
 <20150310173948.GB4124@norris-Latitude-E6410>
Date: Wed, 11 Mar 2015 09:03:46 +0100
Message-ID: <CAH6sp9M9wMOmRhfN3=vQORkooeN9m8f25_1EuVZ2V6MnA_4Uqw@mail.gmail.com>
Subject: Re: [PATCH 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 10, 2015 at 6:39 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Mar 10, 2015 at 08:47:46AM +0100, Frans Klaver wrote:
>> On Tue, Mar 10, 2015 at 12:14 AM, Brian Norris
>> <computersforpeace@gmail.com> wrote:
>> > On Tue, Mar 03, 2015 at 10:39:45PM +0100, Frans Klaver wrote:
>> >> add_mtd_device() has a comment suggesting that the caller should have
>> >> set dev.parent. This is required to have the device show up in sysfs,
>> >
>> > What do you mean "have the device show up in sysfs"? AFAICT, this only
>> > has bearing on whether the *parent* device shows up as a sysfs symlink
>> > within the MTD device directory. i.e.:
>> >
>> >    /sys/class/mtd/mtd*/device
>> >
>> > For instance, this sort of symlink:
>> >
>> >    /sys/class/mtd/mtd0/device -> ../../../f03e2800.nand
>> >
>> > It might be good to clarify this in the commit message, since you make
>> > the problem sound worse than (I think) it is.
>>
>> I do? That was definitely not my intention. I'll look into it.
>
> Maybe it's just my bias when reading, since some people have complained
> loudly about this, seemingly without understanding that the problem
> really isn't that significant.
>
> So my question was really just to confirm my own understanding, that
> this only affects the 'device' symlink.

Ah right. I'll double check and reword where necessary. I already had
the feeling that this wasn't very significant, as there weren't any
real issues related to this using these drivers.

> BTW, it'd be nice if you don't respam with another 60 patches, if you're
> only changing a few of them. I can probably take most of them as-is,
> after you confirm there are no more compile failures.

Sure thing, I thought as much.

Thanks,
Frans
