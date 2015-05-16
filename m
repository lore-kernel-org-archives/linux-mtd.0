Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ytj6B-0003Et-Mm
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 20:54:20 +0000
Received: by pdfh10 with SMTP id h10so79408060pdf.3
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 13:53:57 -0700 (PDT)
Date: Sat, 16 May 2015 13:53:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>
Subject: Re: Tracking flash IO activity?
Message-ID: <20150516205354.GK6055@norris-Latitude-E6410>
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
 <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 16, 2015 at 10:41:53PM +0200, valent.turkovic@gmail.com wrote:
> I have used iostat but it is not showing any changes on /dev/mtdblock5
> which is mounted as /overlay jffs2 partition on this device I'm using.
> I have also checked stats in /proc/diskstat, and they also only change
> for /dev/mmcblk0p1 which is usb device, but not for any of
> /dev/mtdblockX partitions.

JFFS2 doesn't actually use mtdblock. At most, it uses it as a
placeholder, which tells it to actually use the corresponding /dev/mtdX
device:

http://www.linux-mtd.infradead.org/faq/jffs2.html#L_mtdblock

> > through fio and iostats , just starts an io through dd gets status through
> > iostats, i have not used but i know.

Those are all for monitoring block devices. MTDs are not block devices:

http://www.linux-mtd.infradead.org/faq/general.html#L_mtd_what

I don't know of any similar IO stats for MTDs, sorry.

Brian

> > On Sun, May 17, 2015 at 1:51 AM, valent.turkovic@gmail.com
> > <valent.turkovic@gmail.com> wrote:
> >>
> >> Hi,
> >> I'm using low cost devices like home wifi routers for few diy projects
> >> using OpenWrt.
> >>
> >> These devices use mtd partitions, but I don't have enough knowledge on
> >> how to track IO activity, especially number of writes.
> >>
> >> Can you please point me in the right direction? Thanks.
> >>
> >> ______________________________________________________
> >> Linux MTD discussion mailing list
> >> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> >
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
