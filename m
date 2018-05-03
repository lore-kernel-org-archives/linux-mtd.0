Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEAem-0000GV-V5
 for linux-mtd@lists.infradead.org; Thu, 03 May 2018 09:36:10 +0000
Date: Thu, 3 May 2018 11:35:57 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Aaron Sierra <asierra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 2/2] mtd: cfi: Add early fixup for S70GL02GS
Message-ID: <20180503113557.71c3963c@bbrezillon>
In-Reply-To: <1111011589.117630.1525106107675.JavaMail.zimbra@xes-inc.com>
References: <1111011589.117630.1525106107675.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Apr 2018 11:35:07 -0500 (CDT)
Aaron Sierra <asierra@xes-inc.com> wrote:

> S70GL02GS flash reports a single 256 MiB chip, but is really made up
> of two 128 MiB chips with 1024 sectors each.
> 
> Without early fixups (top half of device cannot be written or erased):
>   ff0000000.nor-boot: Found 1 x16 devices at 0x0 in 16-bit bank. <snip>
>   Amd/Fujitsu Extended Query Table at 0x0040
>     Amd/Fujitsu Extended Query version 1.5.
>   number of CFI chips: 1
> 
> With early fixups (entire device can be written and erased):
>   Bad S70GL02GS CFI data; adjust to detect 2 chips
>   ff0000000.nor-boot: Found 1 x16 devices at 0x0 in 16-bit bank. <snip>
>   ff0000000.nor-boot: Found 1 x16 devices at 0x8000000 in 16-bit bank
>   Amd/Fujitsu Extended Query Table at 0x0040
>     Amd/Fujitsu Extended Query version 1.5.
>   number of CFI chips: 2
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Just one comment for your future contributions: can you make sure you
send patch series as a thread (patch X should be 'In-Reply-To' the
cover letter or the first patch in the series if you don't have a cover
letter).

Usually, developers use git send-email which takes care of that for you.
