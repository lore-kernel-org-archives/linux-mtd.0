Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOSqF-0004xW-8e
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 17:58:01 +0000
Received: by mail-pg0-x242.google.com with SMTP id e187so6986758pgc.3
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 10:57:38 -0700 (PDT)
Date: Fri, 23 Jun 2017 10:57:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting
 all master's partitions
Message-ID: <20170623175735.GA55942@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
 <20170621062647.6072-3-zajec5@gmail.com>
 <20170622210533.GD14148@google.com>
 <CACna6rw3B5=48qbRK+vQ1gsxsZtCtJfNa=kORZY6FrCko5PJFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rw3B5=48qbRK+vQ1gsxsZtCtJfNa=kORZY6FrCko5PJFg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 22, 2017 at 11:40:47PM +0200, Rafał Miłecki wrote:
> On 22 June 2017 at 23:05, Brian Norris <computersforpeace@gmail.com> wrote:
> > Side note: this patch series sort of massages the definition of this
> > "offset" file. Now, IIUC, subpartitions will have an "offset" file
> > relative to their parent partition, not the master flash device. I'm not
> > sure which way is expected.
> 
> I didn't think about this. I should be able to easily get an absolute
> offset if needed (a simple recursion), but I'm not sure what behavior
> is actually expected. Since we use a tree struct in the sysfs now,
> maybe relative offsets are actually correct ones?

Yeah, that seems OK to me. The only holdup is that the current
description uses the term "master", where perhaps it should just mean
say "parent" now:

Documentation/ABI/testing/sysfs-class-mtd:

What:           /sys/class/mtd/mtdX/offset
Date:           March 2015
KernelVersion:  4.1
Contact:        linux-mtd@lists.infradead.org
Description:
                For a partition, the offset of that partition from the start
                of the master device in bytes. This attribute is absent on
                main devices, so it can be used to distinguish between
                partitions and devices that aren't partitions.

Brian
