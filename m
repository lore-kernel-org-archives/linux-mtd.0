Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVO8h-0007wd-Je
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2015 17:40:20 +0000
Received: by pdev10 with SMTP id v10so3845878pde.13
 for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2015 10:39:57 -0700 (PDT)
Date: Tue, 10 Mar 2015 10:39:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
Message-ID: <20150310173948.GB4124@norris-Latitude-E6410>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
 <20150309230250.GA13266@ld-irv-0074>
 <CAH6sp9P0mfhK3kq-uD-J2f_uCinKzuircAh7gOs354g98B6qAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH6sp9P0mfhK3kq-uD-J2f_uCinKzuircAh7gOs354g98B6qAg@mail.gmail.com>
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

On Tue, Mar 10, 2015 at 08:47:46AM +0100, Frans Klaver wrote:
> On Tue, Mar 10, 2015 at 12:14 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Tue, Mar 03, 2015 at 10:39:45PM +0100, Frans Klaver wrote:
> >> add_mtd_device() has a comment suggesting that the caller should have
> >> set dev.parent. This is required to have the device show up in sysfs,
> >
> > What do you mean "have the device show up in sysfs"? AFAICT, this only
> > has bearing on whether the *parent* device shows up as a sysfs symlink
> > within the MTD device directory. i.e.:
> >
> >    /sys/class/mtd/mtd*/device
> >
> > For instance, this sort of symlink:
> >
> >    /sys/class/mtd/mtd0/device -> ../../../f03e2800.nand
> >
> > It might be good to clarify this in the commit message, since you make
> > the problem sound worse than (I think) it is.
> 
> I do? That was definitely not my intention. I'll look into it.

Maybe it's just my bias when reading, since some people have complained
loudly about this, seemingly without understanding that the problem
really isn't that significant.

So my question was really just to confirm my own understanding, that
this only affects the 'device' symlink.

BTW, it'd be nice if you don't respam with another 60 patches, if you're
only changing a few of them. I can probably take most of them as-is,
after you confirm there are no more compile failures.

Thanks,
Brian
