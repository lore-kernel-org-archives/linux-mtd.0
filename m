Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avKpG-0008EN-40
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 08:28:03 +0000
Subject: Re: [PATCH] flash_eraseall: Remove warning
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461701022-21023-1-git-send-email-richard@nod.at>
 <20160427102101.13c6d017@bbrezillon>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <572077F5.9080004@nod.at>
Date: Wed, 27 Apr 2016 10:27:33 +0200
MIME-Version: 1.0
In-Reply-To: <20160427102101.13c6d017@bbrezillon>
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

Am 27.04.2016 um 10:21 schrieb Boris Brezillon:
>> Well, flash_erase <mtddev> 0 0 is the same as flash_eraseall <mtddev>.
>> But flash_eraseall is still more handy to use.
>> Let's keep flash_eraseall as short cut and don't force users to
>> use a less handy user interface.
> 
> Hm, I'm not convinced by this change. Aren't we trying to make people
> switch to flash_erase instead of using flash_eraseall.
> If you want to make flash_erase more easy to use, you can always erase
> the whole partition if only <mtddev> is passed in arguments, which IMO
> would be clearer than having to pass 0 0.

So, you suggest fixing flash_erase such that a "flash_erase /dev/mtd0"
works and acts like "flash_erase /dev/mtd0 0 0"?

Would work too. :-)

Thanks,
//richard
