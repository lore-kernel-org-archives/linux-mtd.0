Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deI2D-0000Ax-Gr
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 09:39:47 +0000
Subject: Re: [PATCH 4/5] mtd: block2mtd: Add support for deleting block2mtd
 mapping
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-5-git-send-email-pali.rohar@gmail.com>
 <CAFLxGvwdcA1eHZnNcMNsGTqM4AAFyxyehZ1d==kEYBjCo8-_Rg@mail.gmail.com>
 <20170725142415.GK30901@pali>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5f9b3357-b2cd-7e88-3c84-536079fd4322@nod.at>
Date: Sun, 6 Aug 2017 11:39:20 +0200
MIME-Version: 1.0
In-Reply-To: <20170725142415.GK30901@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pali,

Am 25.07.2017 um 16:24 schrieb Pali Rohár:
> On Friday 21 July 2017 21:56:41 Richard Weinberger wrote:
>> Pali,
>>
>> On Fri, Jun 2, 2017 at 5:43 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
>>> This patch allows user to delete block2mtd mapping via parameters file
>>> /sys/module/block2mtd/parameters/block2mtd
>>>
>>> Syntax is "del=device", e.g.:
>>>
>>> $ echo -n del=/dev/loop0 > /sys/module/block2mtd/parameters/block2mtd
>>
>> As I wrote in an earlier mail, I hate this interface.
>> I suggest adding a decent ioctl based interface for dynamic block2mtd's.
> 
> ioctl interface has a problem that cannot be easily used from shell. It
> needs to have another tool which uses it. On the other hand sysfs
> interface can be used from bash script which is better.
> 
> Any idea for better interface without need for ioctl?

No, please use ioctl and add a proper tool to mtd-utils.
in MTD we use ioctl for all non-trivial interfaces. :-)

Thanks,
//richard
