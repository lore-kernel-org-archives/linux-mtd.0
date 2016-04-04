Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an6T8-0001Ez-OR
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 15:31:12 +0000
Subject: Re: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon> <20160404172048.6a76b472@bbrezillon>
Cc: linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <570288A2.2010401@nod.at>
Date: Mon, 4 Apr 2016 17:30:42 +0200
MIME-Version: 1.0
In-Reply-To: <20160404172048.6a76b472@bbrezillon>
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

Am 04.04.2016 um 17:20 schrieb Boris Brezillon:
> On Sat, 2 Apr 2016 15:55:24 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> 
>> On Fri,  1 Apr 2016 18:29:24 -0300
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>>
>>> There's no reason to BUG() when parameters are being
>>> validated. Drivers can get things wrong, and it's much nicer
>>> to just throw a noisy warn and fail gracefully, than calling
>>> BUG() and throwing the whole system down the drain.
>>
>> I'm fine with this change as long as all callers are checking
>> nand_scan_tail() return value.
> 
> Actually, the s3c2410 driver is not checking nand_scan_tail() return
> value. Could you send a v2 addressing that?

And maybe add __must_check to nand_scan_tail() such that we catch issues like
these.

Thanks,
//richard
