Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK4fZ-0005Kp-PS
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 09:58:10 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so786760bkw.36
 for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2012 02:58:06 -0700 (PDT)
Message-ID: <506EAF2C.7070604@monstr.eu>
Date: Fri, 05 Oct 2012 11:58:04 +0200
From: Michal Simek <monstr@monstr.eu>
MIME-Version: 1.0
To: =?UTF-8?B?SmFuIEzDvGJiZQ==?= <jlu@pengutronix.de>
Subject: Re: [PATCH] mtd: m25p80: Add support for Numonyx N25Q128
References: <1349372416-16925-1-git-send-email-monstr@monstr.eu>
 <1349423405.3427.3.camel@coredoba.hi.pengutronix.de>
In-Reply-To: <1349423405.3427.3.camel@coredoba.hi.pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Mike Frysinger <vapier@gentoo.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Wendy Liang <wendy.liang@petalogix.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: monstr@monstr.eu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/05/2012 09:50 AM, Jan Lübbe wrote:
> On Thu, 2012-10-04 at 19:40 +0200, Michal Simek wrote:
>> From: Wendy Liang <wendy.liang@petalogix.com>
>>
>> Add the id and sector mappings for SPI flash chips.
>
> An equivalent patch is already in David Woodhouse's l2-mtd tree:
> http://git.infradead.org/users/dedekind/l2-mtd.git/commitdiff/3105875f6b8902628caee2fd7821af43707c6bde

Great thanks.
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
