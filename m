Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qlby5-0001rH-UT
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2011 07:22:18 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
Date: Tue, 26 Jul 2011 09:21:44 +0200
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
In-Reply-To: <CAN8TOE8Uk09DPJ_OYXh4RjnKkXugEFLpZQ+hrA4Gw4oK2cQYOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201107260921.44512.brian.foster@maxim-ic.com>
Cc: Mike Frysinger <vapier@gentoo.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 25 July 2011 19:10:46 Brian Norris wrote:
> On Mon, Jul 25, 2011 at 2:48 AM, Brian Foster <brian.foster@maxim-ic.com> wrote:
>[...]
> This is exactly the right place! Sorry it was difficult to find.

 The list was easy to find; what I could not find was
 any indication of how/where bugs should be reported.

> > MTD-utils 1.4.5, when `mtdinfo -a' tries to print the
> > eraseblock regions of NOR-Flash, it open(2)s the nil
> > pointer (NULL).  [...]
> 
> I don't have a test case that can reproduce the bug, as I don't have
> devices with "region info", but I can see the problem fairly clearly.
> It seems that the basic issue we need to solve is how to find the
> correct file devfs/udev path  [...]

 As an FYI, in our current embedded systems (plural),
 a static /dev is used (no udev, mdev, &tc).  Hence,
 udev (and I assume also, devfs) path may not work
 in such an environment?

> Also, is "region_info" a potential candidate for exporting via sysfs?
> That would make this support easier to include in libmtd.

 I don't know if it is exportable or not, but I concur
 this seems like a possible/plausible solution.

cheers!
	-blf-
-- 
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
