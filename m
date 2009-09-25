Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mr584-0000SK-0v
	for linux-mtd@lists.infradead.org; Fri, 25 Sep 2009 07:22:12 +0000
Subject: Re: [PATCH 1/3] blkid: add UBI volume support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00909241457p3b9247a1q661ea63bde584f26@mail.gmail.com>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<1251112316-18971-2-git-send-email-corentincj@iksaif.net>
	<20090924141433.GC27905@nb.net.home>
	<71cd59b00909241457p3b9247a1q661ea63bde584f26@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Sep 2009 10:19:19 +0300
Message-Id: <1253863159.3778.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: util-linux-ng@vger.kernel.org, Karel Zak <kzak@redhat.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-24 at 23:57 +0200, Corentin Chary wrote:
> >> +                     if (!(st.st_rdev & 0xFF)) { // It's an UBI Device
> >> +                             free(device);
> >> +                             continue ;
> >> +                     }
> >
> > Wouldn't be better to
> >
> >  #define is_ubi_device(s)    (S_ISCHR(s->st_mode) && (s->st_rdev & 0xFF))
> >
> > (or major() instead magic 0xFF constant?) and use it everywhere in
> > code? I guess UBI is always a char device.
> 
> Maybe something like that:
> #define is_ubi_device(s)    (S_ISCHR(s->st_mode) && !minor(s->st_rdev))

Well, if you want to be really nice, you may implement this as a
function which scans sysfs or looks at /proc/devices and makes sure the
device really belongs to UBI. See below.

> 
> >> +++ b/shlibs/blkid/src/probe.c
> >> @@ -284,6 +284,8 @@ int blkid_probe_set_device(blkid_probe pr, int fd,
> >>
> >>               if (S_ISBLK(sb.st_mode))
> >>                       blkdev_get_size(fd, (unsigned long long *) &pr->size);
> >> +             else if (S_ISCHR(sb.st_mode))
> >> +                     pr->size = 1;
> >>               else
> >>                       pr->size = sb.st_size;
> >>       }
> >
> > this is the same situation, this code will for all char devices, but we
> > want to support UBI only.
> 
> I don't know if there is a "good" way to detect an ubi device using
> only struct stat.
> 
> Artem, any idea ?

UBI char devices' major:minor numbers are allocated dynamically, so they
cannot be used.

To check whether this char. device node is an UBI volume and not
something else, you should scan all /sys/class/ubi/ubiX/Y/dev files, and
see if there is a device with the same major:minor.

The other possibility would be to look at /proc/devices, and make sure
there is an ubiX device with the same major number as your /dev/ubiX_Y
device.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
