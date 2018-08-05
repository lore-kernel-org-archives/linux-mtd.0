Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmKfR-0002Wr-Id
 for linux-mtd@lists.infradead.org; Sun, 05 Aug 2018 15:10:03 +0000
Date: Sun, 5 Aug 2018 17:09:49 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Raphael Pereira <raphaelpereira@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Suport for gf_len 14 in gpmi-nand for i.MX23 using Software BCH
 ECC
Message-ID: <20180805170949.099b190a@bbrezillon>
In-Reply-To: <20180804115555.667b3fb8@xps13>
References: <CAAN9NvdvscL1MOKTXuH=Esf0NjC__QVH745n-h3R_hFfeqT9jw@mail.gmail.com>
 <20180804115555.667b3fb8@xps13>
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

On Sat, 4 Aug 2018 11:55:55 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Raphael,
> 
> Raphael Pereira <raphaelpereira@gmail.com> wrote on Wed, 1 Aug 2018
> 18:29:32 -0300:
> 
> > Hi,
> > 
> > I would like to know if it is possible to use the Software BCH ECC
> > implementation to support a GF14 (ECC size == 1024) 40 bit ECC strengh
> > flash (MT29F32G08CBADA) on a GF13 (ECC size == 512) 20 bit ECC strengh
> > only i.MX23 processor.  
> 
> I am not sure to understand correctly your request. What do you mean
> by "GF13 only i.MX23 processor"? I suppose you refer to the raw NAND
> controller abilities? If yes, then why do you care if you use soft
> BCH?
> 
> And the ECC requirements is just an indication in terms of
> correctability, how is 40 bits per 1024 bytes different than 20 bits
> per 512?


Well, it is different. In 40b/1024B mode you can fix 40 bits no matter
where they are in the the 1k block (even if they all appear to be in
the first 512 bytes). In 20b/512B mode, you can only fix 20 bits on a
512B portion. So 20b/512B is weaker than 40b/1KB.
