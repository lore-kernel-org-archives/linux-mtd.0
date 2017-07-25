Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1da0lO-0000ag-HG
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 14:24:44 +0000
Received: by mail-wm0-x242.google.com with SMTP id r77so3340835wmd.2
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2017 07:24:19 -0700 (PDT)
Date: Tue, 25 Jul 2017 16:24:15 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] mtd: block2mtd: Add support for deleting block2mtd
 mapping
Message-ID: <20170725142415.GK30901@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-5-git-send-email-pali.rohar@gmail.com>
 <CAFLxGvwdcA1eHZnNcMNsGTqM4AAFyxyehZ1d==kEYBjCo8-_Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvwdcA1eHZnNcMNsGTqM4AAFyxyehZ1d==kEYBjCo8-_Rg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 21 July 2017 21:56:41 Richard Weinberger wrote:
> Pali,
> 
> On Fri, Jun 2, 2017 at 5:43 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > This patch allows user to delete block2mtd mapping via parameters file
> > /sys/module/block2mtd/parameters/block2mtd
> >
> > Syntax is "del=device", e.g.:
> >
> > $ echo -n del=/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd
> 
> As I wrote in an earlier mail, I hate this interface.
> I suggest adding a decent ioctl based interface for dynamic block2mtd's.

ioctl interface has a problem that cannot be easily used from shell. It
needs to have another tool which uses it. On the other hand sysfs
interface can be used from bash script which is better.

Any idea for better interface without need for ioctl?

-- 
Pali Rohár
pali.rohar@gmail.com
