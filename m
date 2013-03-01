Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBQVX-0000vm-3u
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2013 14:00:19 +0000
Message-ID: <5130B46B.2030503@parrot.com>
Date: Fri, 1 Mar 2013 15:00:11 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd/nand: don't use {read,write}_buf for 8-bit transfers
References: <1361977852-18233-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <512EC54F.3090400@freescale.com> <513072F5.6010609@parrot.com>
 <20130301095914.GK22886@pengutronix.de>
In-Reply-To: <20130301095914.GK22886@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uwe Kleine-König a écrit :
> On Fri, Mar 01, 2013 at 10:20:53AM +0100, Matthieu CASTET wrote:
>> Huang Shijie a écrit :
>>> 于 2013年02月27日 23:10, Uwe Kleine-König 写道:
>>>> According to the Open NAND Flash Interface Specification (ONFI) Revision
>>>> 3.1 "Parameters are always transferred on the lower 8-bits of the data
>>>> bus." for the Get Features and Set Features commands.
>>>>
>>> yes. the set/get features should works in 8-bit.
>>>
>>> I have never met a 16-bit onfi nand yet. :)
>> Beagle board got one.
> Which part does it have? Would you volunteer to test access to its OTP
> area? (Provided you have a Micron chip of course.)
> 
It is a micron chip (MT29F2G16ABD), but I can't test on it ATM.


Matthieu
