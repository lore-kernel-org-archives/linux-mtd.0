Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Spjmx-0006Tm-AF
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:36:26 +0000
Received: by ghbf11 with SMTP id f11so4177666ghb.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 10:36:20 -0700 (PDT)
Message-ID: <50005C38.7070203@gmail.com>
Date: Fri, 13 Jul 2012 14:34:48 -0300
From: "William F." <william76.sh@gmail.com>
MIME-Version: 1.0
To: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver (REPORT SPAM)
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
 <201207131912.42495.marex@denx.de> <5000589B.3010808@freescale.com>
In-Reply-To: <5000589B.3010808@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Artem Bityutskiy <dedekind1@gmail.com>,
 Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em 13-07-2012 14:19, Scott Wood escreveu:
> On 07/13/2012 12:12 PM, Marek Vasut wrote:
>> Dear Brian Norris,
>>
>>> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
>>> silently masks off at least one flag that might be set by the driver
>>> (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
>>> others.
>>>
>>> Really, as long as driver writers exercise a small amount of care with
>>> NAND_* options, this mask is not necessary at all; it was only here to
>>> prevent certain options from accidentally being set by the driver. But the
>>> original thought turns out to be a bad idea occasionally. Thus, kill it.
>>>
>>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
>>> Cc: Huang Shijie<shijie8@gmail.com>
>>> Cc: Marek Vasut<marex@denx.de>
>> [...]
>>
>> Maybe we should simply split it into two sets of flags to make it clear -- chip
>> ones and controller ones ?
> Isn't that what we're trying to get rid of?
>
> -Scott
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
