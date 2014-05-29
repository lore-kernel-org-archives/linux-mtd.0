Received: from h1446028.stratoserver.net ([85.214.92.142]
 helo=mail.ahsoftware.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WprQD-0007Ie-S8
 for linux-mtd@lists.infradead.org; Thu, 29 May 2014 03:54:30 +0000
Received: from eiche.ahsoftware (p57B20DC1.dip0.t-ipconnect.de [87.178.13.193])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.ahsoftware.de (Postfix) with ESMTPSA id 3B144423C29B
 for <linux-mtd@lists.infradead.org>; Thu, 29 May 2014 05:54:06 +0200 (CEST)
Message-ID: <5386AF53.4070403@ahsoftware.de>
Date: Thu, 29 May 2014 05:53:55 +0200
From: Alexander Holler <holler@ahsoftware.de>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 01/27] mtd: nand: introduce function to fix a common bug
 in most nand-drivers not showing a device in sysfs
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-2-git-send-email-holler@ahsoftware.de>
 <20140528084344.GB4285@norris-Latitude-E6410>
 <53863056.2070405@ahsoftware.de> <20140528201018.GA3599@ld-irv-0074>
 <53865071.5060501@ahsoftware.de> <20140528214921.GC3599@ld-irv-0074>
In-Reply-To: <20140528214921.GC3599@ld-irv-0074>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.05.2014 23:49, schrieb Brian Norris:
> On Wed, May 28, 2014 at 11:09:05PM +0200, Alexander Holler wrote:
>> I'm very sorry, but I find such discussions extremly tiresome.
>>
>> If you just would have suggested that one if to prevent that someone who
>> doesn't c&p existing code would end up with a clobbered name (which he
>> obviously can't miss if he ever would test his new or changed driver),
>> than I maybe would have send a v2 with that if. But all the other noise
>> just made me to want I never had send (again) a patch to LKML. It is
>> almost impossible to avoid such answers and it turns every patch posting
>> into a endless story where people do want to discuss every line or even
>> character of totally silly things.
>
> It would help if you brought a more open attitude to the table.

Your doesn't accept that other people do write code different than you 
and you want to tell me I have to bring a more open attitude to the table?
