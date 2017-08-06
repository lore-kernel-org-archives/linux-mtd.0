Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1deI69-0002iT-6r
 for linux-mtd@lists.infradead.org; Sun, 06 Aug 2017 09:43:50 +0000
Subject: Re: [PATCH 5/5] ubi: Allow to use read-only UBI volume with not
 enough PEBs
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-6-git-send-email-pali.rohar@gmail.com>
 <CAFLxGvzg2+wv91HuJCK6Z0U865NvqY2q=e7mmJKOe3_MrQskhA@mail.gmail.com>
 <20170725142729.GL30901@pali>
From: Richard Weinberger <richard@nod.at>
Message-ID: <0527d020-95aa-80e5-978c-fa9b6761a273@nod.at>
Date: Sun, 6 Aug 2017 11:43:25 +0200
MIME-Version: 1.0
In-Reply-To: <20170725142729.GL30901@pali>
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

Am 25.07.2017 um 16:27 schrieb Pali Rohár:
>> I fear this is not correct, it will disable a legit self-check of UBI volumes.
>> If the read-only volume is corrupted/truncated and you miss PEBs, this
>> check will no longer
>> trigger.
>>
>> Especially when dealing with nanddumps, truncation is a common problem.
> 
> Any idea how to fix it? Or how to handle read-only images which are
> marked for auto-resize?

I'd vote for rejecting images that have auto-resize set when the MTD is read-only.
In fact, using UBI on top of a read-only MTD is very uncommon and not recommended (for NAND).
The auto-resize flag should be also only set when you just have created it using mkfs.ubifs.
Why would you inspect such an image with the kernel UBIFS unless you're hunting down a bug
in mkfs.ubifs?

Thanks,
//richard
