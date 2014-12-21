Received: from mail-qg0-f45.google.com ([209.85.192.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2Vdi-0007Az-1T
 for linux-mtd@lists.infradead.org; Sun, 21 Dec 2014 01:48:58 +0000
Received: by mail-qg0-f45.google.com with SMTP id f51so2138112qge.4
 for <linux-mtd@lists.infradead.org>; Sat, 20 Dec 2014 17:48:34 -0800 (PST)
Message-ID: <54962684.9040003@vanguardiasur.com.ar>
Date: Sat, 20 Dec 2014 22:46:44 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Oleksij Rempel <linux@rempel-privat.de>, linux-mtd@lists.infradead.org,
 "boris.brezillon@free-electrons.com >> Boris Brezillon"
 <boris.brezillon@free-electrons.com>, computersforpeace@gmail.com
Subject: Re: should nand driver create ECC for a page after ERASE cmd?
References: <54953675.1020102@rempel-privat.de>
In-Reply-To: <54953675.1020102@rempel-privat.de>
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

On 12/20/2014 05:42 AM, Oleksij Rempel wrote:
> Hello all,
> 
> i'm trying to pass mtd/tests for my driver.. on pagetest i fail on this
> place:
> http://lxr.free-electrons.com/source/drivers/mtd/tests/pagetest.c#L311
> 
> after ERASE cmd this test trying to read same page. Driver will report
> ECC error on read, because erased page has no ECC data in OOB.
> 
> What is correct way to handle it?
> 
[..]

This might help, although I'm not sure it's the best solution.

$ git grep is_buf_blank drivers/mtd/nand/pxa3xx_nand.c


-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
