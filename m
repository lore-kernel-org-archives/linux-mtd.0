Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVaxv-0007Ro-BR
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2015 07:22:03 +0000
Message-ID: <1426058499.1567.3.camel@sauron.fi.intel.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Andrea Scian <rnd4@dave-tech.it>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Date: Wed, 11 Mar 2015 09:21:39 +0200
In-Reply-To: <54FEDC42.2060407@dave-tech.it>
References: <54FEDC42.2060407@dave-tech.it>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-03-10 at 12:57 +0100, Andrea Scian wrote:
> Dear All,
> 
> for testing and research purpose, I'm working with an Embedded Linux
> product which mounts an MLC NAND.
> 
> I know that one of the trouble with MLC flash on Linux with UBI/UBIFS is
> the power cut management (ref.
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits)
> 
> IIUC the solution inside MTD/UBI/UBIFS is not so simple and thus not so
> quick to implement.
> 
> I'm wondering if anyone of you already think about managing power cut in
> a different way: many embedded/industrial products already have some
> big/huge bypass capacitor that are able to keep the system alive for
> hundreds of milliseconds (this is useful for power supply
> micro-interruptions), which are commonly enough to complete the latest
> NAND operation.
> Most of the has a GPIO/IRQ that tells whenever such a power cut happens,
> so the kernel can take some actions with it (e.g., in our case, complete
> the last NAND operation and prevent from starting newer operation, which
> may corrupt the NAND pages).
> 
> WDYT about this?
> If it sounds reasonable is there any suggestion where to place such a code?

Ccing Boris, he has been looking into this area lately.

Artem.
