Received: from galois.linutronix.de ([2001:470:1f0b:1c35:abcd:42:0:1])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPVYd-0006V0-E7
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 08:04:40 +0000
Message-ID: <4DDE0991.8040900@linutronix.de>
Date: Thu, 26 May 2011 10:04:33 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC] mtd: nand: separate chip options / bbt_options
References: <1301903526.2760.38.camel@localhost>	<1303283589-14415-1-git-send-email-computersforpeace@gmail.com>	<1303459329.2757.40.camel@localhost>
	<BANLkTi=61rg=ZLrDpWSDrz1_gfuQAgCzRw@mail.gmail.com>
In-Reply-To: <BANLkTi=61rg=ZLrDpWSDrz1_gfuQAgCzRw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris wrote:
> Hi,
Hi Brian,

> On Fri, Apr 22, 2011 at 1:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Wed, 2011-04-20 at 00:13 -0700, Brian Norris wrote:
>>> Other things to consider (not yet implemented):
>>> * Is it safe to move NAND_CREATE_EMPTY_BBT to bbm.h and require it to be
>>>   put in bbt_options? It seems not to be used by any in-kernel drivers
>>>   so it's only likely to mess with independent drivers...
>> What exactly this option mean and how could it be used?
> 
> I'm not entirely sure how it would be used (perhaps ask Sebastian, the
> one who introduced it in commit 453281a9), but I have an idea what it
> means.
> 
> It seems that (when combined with NAND_BBT_CREATE) this flag causes
> nand_scan_bbt() / check_create() to skip the scanning portion of
> creating a bad block table, effectively leaving an empty bad block
> table. According to the commit message:
>     it will create an empty BBT table without considering vendor's BBT
>     information. Vendor's information may be unavailable if the NAND
>     controller has a different DATA & OOB layout or this information may be
>     allready purged.
> 
> I'm prepared to simply move this over to bbm.h (next to
> NAND_BBT_CREATE) if it's worth saving. Otherwise, it can just as
> easily be dumped.

It is kinda required here :) The long story:
The NAND-controller needs the complete OOB area for ECC. So we have no
room for BBT in OOB. Therefore we use BBT table on flash without the
recognition marking in the OOB area.
This option (NAND_CREATE_EMPTY_BBT) is used to have an empty BBT table on
the first scan. The reason is that the boards are in-some kind production
test before I got them and the format which is used there is unknown and
Vendor's (Nand-chip Vendor) BBT information in OOB is lost. On the second
scan we use the on-flash BBT information (which is created by mtd) so it
is not empty again.

> 
> Brian

Sebastian
