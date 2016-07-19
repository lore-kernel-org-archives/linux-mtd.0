Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPXnl-00052D-Je
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 16:23:22 +0000
Subject: Re: [PATCH 1/2] mtd: nand: BUG_ON in case of no select_chip and
 cmd_ctrl
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1468942904-26464-1-git-send-email-andrew.smirnov@gmail.com>
 <578E4AF0.7090507@nod.at> <20160719175912.11277116@bbrezillon>
 <578E4F13.1070100@nod.at> <20160719181248.2a71b5a7@bbrezillon>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <578E53DD.806@nod.at>
Date: Tue, 19 Jul 2016 18:22:53 +0200
MIME-Version: 1.0
In-Reply-To: <20160719181248.2a71b5a7@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 19.07.2016 um 18:12 schrieb Boris Brezillon:
>>> Not sure a BUG_ON() is worst than a NULL-pointer exception ;-).  
>>
>> When this really just triggers a NULL-pointer exception, we don't need a BUG_ON or WARN_ON at
>> all since the kernel can tell anyway what went wrong.
> 
> Hm, that's not entirely true, depending on your debug options you don't
> have all the information to guess which line triggered the NULL pointer
> exception, and this makes it harder to debug.
> And I agree with Andrey here, it's better to complain at registration
> time than letting the controller register all its NAND devices and
> generate exceptions when the NAND is really used.
> 
> BTW, I don't quite understand the rational behind BUG_ON() eradication.
> I agree that they should not be used when the driver can recover from a
> specific failure, but that's not really the case here (some NAND
> controller drivers don't check nand_scan_tail() or nand_scan() return
> code).

I've been told that new code (except core code) should not BUG()/_ON().

> The best solution would probably be to patch all those drivers and then
> return an error when one of the mandatory hooks is missing, but in the
> meantime I don't see any problem in adding BUG_ON() calls.

Yes, definitely.

Thanks,
//richard
