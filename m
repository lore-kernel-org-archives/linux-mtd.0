Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHq6t-0001jr-07
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 11:23:48 +0000
Subject: Re: [PATCH 2/5] mtd: block2mtd: Add support for specifying MTD write
 size and subpage shift
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-3-git-send-email-pali.rohar@gmail.com>
 <fa265d04-07b4-0ed3-9b51-c2026f7015db@nod.at> <20170605112145.GE14675@pali>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <ad488af9-a6c5-7795-87a2-87e610dd2121@nod.at>
Date: Mon, 5 Jun 2017 13:23:22 +0200
MIME-Version: 1.0
In-Reply-To: <20170605112145.GE14675@pali>
Content-Type: text/plain; charset=utf-8
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

Am 05.06.2017 um 13:21 schrieb Pali Rohár:
> On Friday 02 June 2017 18:13:02 Richard Weinberger wrote:
>> Pali,
>>
>> Am 02.06.2017 um 17:43 schrieb Pali Rohár:
>>> It is needed for creating emulated devices suitable for using in UBI layer
>>> and with UBIFS.
>>
>> Why?
> 
> ubifs depends on write size of nand. And without those parameters as
> specified in cover letter I'm unable to mount N900 rootfs image exported
> via block2mtd. ubifs reject such image.

Hmm, so you render block2mtd into a semi-NAND chip? :)

Thanks,
//richard
