Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1flllJ-0006Mt-J5
 for linux-mtd@lists.infradead.org; Sat, 04 Aug 2018 01:53:47 +0000
Received: by mail-pf1-x443.google.com with SMTP id l9-v6so4116328pff.9
 for <linux-mtd@lists.infradead.org>; Fri, 03 Aug 2018 18:53:34 -0700 (PDT)
Date: Fri, 03 Aug 2018 18:53:33 -0700 (PDT)
Subject: Re: upstreaming spi-nor: add support for is25wp{32,64,128,256}
In-Reply-To: <1955523.Qt66yi4IIu@blindfold>
CC: Wesley Terpstra <wesley@sifive.com>, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: richard@nod.at
Message-ID: <mhng-eed7b1ed-ba6c-4f95-9728-f236c77e4601@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 01 Aug 2018 07:11:31 PDT (-0700), richard@nod.at wrote:
> Hi guys,
>
> can you please upstream this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git/commit/?h=riscv-all&id=c6e4a154bd008655dd69a850275d5cb082a7304b
>
> From Marek's and my POV it is ready for mainline.
> Expect for the prints in issi_unlock().

Thanks.  I was waiting until I could properly vet it before send it upstream, 
but I guess maybe it's best to just send out the patch.  It should be on the 
mailing list now.
