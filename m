Date: Mon, 13 Oct 2008 16:13:53 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] Bug on atmel_nand HW ECC : OOB info not correctly written
Message-ID: <20081013161353.38b8ff51@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <1223906461.6770.604.camel@macbook.infradead.org>
References: <1223793748.7110.13.camel@ubuntu>
	<1223906461.6770.604.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote:
> On Sun, 2008-10-12 at 08:42 +0200, Richard Genoud wrote:
> > The functions that write the OOB info (on hardware ECC only) use the
> > HW_SYNDROME method.
> > This is not correct : the start position is "pos = eccsize + chunk"
> > and should be eccsize.
> > So, the standard (nand_write_oob_std) function should be used.
> > This patch corrects this by using NAND_ECC_HW instead of
> > NAND_ECC_HW_SYNDROME.
> > 
> > This has only been tested on small pages nand flash.
> > (if anyone can test it on large pages that would be great).
> > 
> > kernel version : 2.6.27-rc2 (current git mtd-2.6)
> > 
> > Signed-off-by: Richard Genoud <richard.genoud@gmail.com>  
> 
> Håvard?

I have no clue, I'm afraid. What's the difference between NAND_ECC_HW
and NAND_ECC_HW_SYNDROME?

I do think I have a large page NAND flash available for testing though,
so I can do that. Will any potential problems be easy to spot?

In other words: What are the consequences of this bug?

Haavard
