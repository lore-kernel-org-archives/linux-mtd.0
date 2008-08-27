Date: Wed, 27 Aug 2008 08:49:32 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: RE: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
In-Reply-To: <1219818923.7107.106.camel@pmac.infradead.org>
Message-ID: <Pine.LNX.4.64.0808270847350.17432@lnxricardw.se.axis.com>
References: <000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<1219818923.7107.106.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd-bounces@lists.infradead.org"
	<linux-mtd-bounces@lists.infradead.org>,
	'Bruce Leonard' <brucle@earthlink.net>,
	"Bruce_Leonard@selinc.com" <Bruce_Leonard@selinc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Tim Anderson <tanderson@mvista.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 27 Aug 2008, David Woodhouse wrote:

> On Tue, 2008-08-26 at 23:20 -0700, Tim Anderson wrote:
>> I see your point. Ioctls are going away after all.
>>
>> So we should have something like:
>> /sys/class/mtd/mtd0/
>>
>> Or just under device or platform?
>
> Tim, please stop top-posting.
>
> I'm not sure I'd say I _vetoed_ new ioctls, but I certainly expressed a
> desire to do all the information stuff through sysfs. We would need a
> new MEMERASE64 ioctl though.

If the (lack of) sysfs stuff is standing between us and a nice >4GiB mtd I=
=20
for one would think that a set of 64-bit ioctls would be a reasonable=20
halfway house.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
