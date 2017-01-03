Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOOum-0005UC-AL
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2017 13:14:09 +0000
Date: Tue, 3 Jan 2017 14:13:46 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sekhar Nori <nsekhar@ti.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Cooper Jr.,
 Franklin" <fcooper@ti.com>, Murali Karicheri <m-karicheri2@ti.com>
Subject: Re: [PATCH] mtd: davinci-nand: disable subpage write for davinci-nand
Message-ID: <20170103141346.5e652afe@bbrezillon>
In-Reply-To: <e51292a6-15a5-ce5b-da7b-dbd22ede38b6@ti.com>
References: <1457428095-2801-1-git-send-email-sushaanth.s@ti.com>
 <20170103095918.7da43be3@bbrezillon>
 <e51292a6-15a5-ce5b-da7b-dbd22ede38b6@ti.com>
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

Hi Sekhar,

On Tue, 3 Jan 2017 17:07:44 +0530
Sekhar Nori <nsekhar@ti.com> wrote:

> Hi Boris,
> 
> On Tuesday 03 January 2017 02:29 PM, Boris Brezillon wrote:
> > Hi Sushaanth,  
> 
> Sushaanth is not with TI anymore. You might have received a bounce.

Indeed.

> 
> > 
> > Sorry for the late reply, I'm dequeing old NAND related patches and
> > found this one.
> > 
> > Is this patch still needed?  
> 
> I dont think so. I suspect the real root cause was addressed by Karl in 
> commit f6d7c1b5598b ("mtd: nand: davinci: Reinitialize the HW ECC 
> engine in 4bit hwctl")

Okay, cool. I'll just mark the patch as 'Superseeded' in patchwork.

> 
> I just ran mtd_subpagetest on my da850 lcdk board and it passed[1]. If 
> there are more tests to run to determine if subpage write really works, 
> let me know too.

No, that should be good.

> 
> I suspect even the original workaround for keystone boards may not be 
> needed after Karl's patch. I will test and send a patch dropping the 
> workaround altogether if the tests succeed.

Sounds good.

Thanks,

Boris
