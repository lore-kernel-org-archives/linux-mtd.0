Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgQaN-0001HI-6X
 for linux-mtd@lists.infradead.org; Fri, 10 Apr 2015 04:30:33 +0000
Received: by pabsx10 with SMTP id sx10so9562978pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Apr 2015 21:30:08 -0700 (PDT)
Date: Thu, 9 Apr 2015 21:30:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
Message-ID: <20150410043000.GQ2677@norris-Latitude-E6410>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
 <20150309230250.GA13266@ld-irv-0074>
 <CAH6sp9P0mfhK3kq-uD-J2f_uCinKzuircAh7gOs354g98B6qAg@mail.gmail.com>
 <20150310173948.GB4124@norris-Latitude-E6410>
 <CAH6sp9M9wMOmRhfN3=vQORkooeN9m8f25_1EuVZ2V6MnA_4Uqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH6sp9M9wMOmRhfN3=vQORkooeN9m8f25_1EuVZ2V6MnA_4Uqw@mail.gmail.com>
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

On Wed, Mar 11, 2015 at 09:03:46AM +0100, Frans Klaver wrote:
> On Tue, Mar 10, 2015 at 6:39 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Tue, Mar 10, 2015 at 08:47:46AM +0100, Frans Klaver wrote:
> >> On Tue, Mar 10, 2015 at 12:14 AM, Brian Norris
> >> <computersforpeace@gmail.com> wrote:
> >> > On Tue, Mar 03, 2015 at 10:39:45PM +0100, Frans Klaver wrote:
> >> >> add_mtd_device() has a comment suggesting that the caller should have
> >> >> set dev.parent. This is required to have the device show up in sysfs,
> >> >
> >> > What do you mean "have the device show up in sysfs"? AFAICT, this only
> >> > has bearing on whether the *parent* device shows up as a sysfs symlink
> >> > within the MTD device directory. i.e.:
> >> >
> >> >    /sys/class/mtd/mtd*/device
> >> >
> >> > For instance, this sort of symlink:
> >> >
> >> >    /sys/class/mtd/mtd0/device -> ../../../f03e2800.nand
> >> >
> >> > It might be good to clarify this in the commit message, since you make
> >> > the problem sound worse than (I think) it is.
> >>
> >> I do? That was definitely not my intention. I'll look into it.
> >
> > Maybe it's just my bias when reading, since some people have complained
> > loudly about this, seemingly without understanding that the problem
> > really isn't that significant.
> >
> > So my question was really just to confirm my own understanding, that
> > this only affects the 'device' symlink.
> 
> Ah right. I'll double check and reword where necessary. I already had
> the feeling that this wasn't very significant, as there weren't any
> real issues related to this using these drivers.

OK, I just made some small edits to the language to clarify that this
patch is only fixing the 'parent device symlink' rather than the 'device
is missing in sysfs'. I also tweaked the language on all the other
patches to reflect this.

> > BTW, it'd be nice if you don't respam with another 60 patches, if you're
> > only changing a few of them. I can probably take most of them as-is,
> > after you confirm there are no more compile failures.
> 
> Sure thing, I thought as much.

I ran the other 59 patches through a pretty wide range of compile tests
and saw no issues, so I've pushed patches 1-29 and 31-60 to l2-mtd.git,
with small tweaks to the commit descriptions. If you get a chance to
rework patch 30, feel free.

Thanks for the patches!

Brian
