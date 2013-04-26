Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVh5J-00016S-99
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 11:45:02 +0000
Date: Fri, 26 Apr 2013 08:45:13 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Maarten Blomme <maartenblomme@gmail.com>
Subject: Re: Question about mtdblock.c
Message-ID: <20130426114512.GA10835@localhost>
References: <CABLyGt_OCcOya7TFYhxWypj6x8s_pp7bjzdyMonHe8ZcgY36Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABLyGt_OCcOya7TFYhxWypj6x8s_pp7bjzdyMonHe8ZcgY36Bw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 26, 2013 at 09:52:37AM +0200, Maarten Blomme wrote:
> Hello,
> 
> I have a question about mtdblock.c, is this the right place to ask it?
> 
> My question is about the usage of the return value of
> write_cached_data in mtdblock_flush and mtdblock_release. The return
> value is not used in those functions. What could be the reason for
> that?
> 
> I have a problem in my code where I flush the data, but the flush does
> not fail if the flush did not work (because of a bad NAND flash
> sector). As far as I understand the mtdblock.c code, this could be
> fixed by using the return value of write_cached_data.
> 

Mmm... that seem to be the case. And adding the checks makes your use
case work (i.e. detect the failure)?

In that case you might try to send a patch fixing mtdblock to check
for write_cached_data failure.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
