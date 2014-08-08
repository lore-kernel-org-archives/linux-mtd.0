Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqpo-0006pW-T6
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 20:32:21 +0000
Received: from eiche.ahsoftware (p57B22910.dip0.t-ipconnect.de [87.178.41.16])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id A97032C9C6BB
 for <linux-mtd@lists.infradead.org>; Fri,  8 Aug 2014 22:31:54 +0200 (CEST)
Message-ID: <53E533B1.4020306@ahsoftware.de>
Date: Fri, 08 Aug 2014 22:31:45 +0200
From: Alexander Holler <holler@ahsoftware.de>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 09/27] mtd: nand: pxa3xx: show device structure in sysfs
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-10-git-send-email-holler@ahsoftware.de>
 <1401160341.192042842@f271.i.mail.ru> <20140808170428.GA6094@arch.cereza>
 <20140808171650.GS3711@ld-irv-0074> <20140808181157.GA16575@arch.cereza>
In-Reply-To: <20140808181157.GA16575@arch.cereza>
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.08.2014 20:11, schrieb Ezequiel Garcia:
> On 08 Aug 10:16 AM, Brian Norris wrote:
>> On Fri, Aug 08, 2014 at 02:04:28PM -0300, Ezequiel Garcia wrote:
>
>>> If there's anything left to fix for this driver, please let me know.
>>
>> pxa3xx_nand is still missing a parent for its MTD's (mtd->dev.parent). I
>> have a follow-up patch queued up locally that I need to send out
>> sometime.
>>
>
> Maybe we can trade... you provide the reason for such parent, and I'll cook
> a patch in exchange :)

Just read the subject.and the introductory mail to the simple 20+ 
pathches I wasted my time with.

Regards,

Alexander Holler
