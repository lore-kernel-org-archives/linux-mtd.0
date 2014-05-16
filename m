Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlBlk-0007SK-Ne
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 06:37:25 +0000
Date: Fri, 16 May 2014 15:36:54 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: denali: fix write_oob_data() function
In-Reply-To: <20140510021226.GI28907@ld-irv-0074>
References: <1397730174-4763-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140510021226.GI28907@ld-irv-0074>
Message-Id: <20140516153654.E1A1.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,


On Fri, 9 May 2014 19:12:26 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Apr 17, 2014 at 07:22:54PM +0900, Masahiro Yamada wrote:
> > Since write_oob_data is calling denali_send_pipeline_cmd()
> > with access_type=SPARE_ACCESS, this might has no impact.
> 
> "Might"? Are you sure? Do you have any test results? I don't want to
> change this code based on a whim...

Sorry, I could not make myself understood because of my bad English..

What I wanted to say:
I know this patch has no impact,
but calling denali_send_pipeline_cmd() with transfer_spare=false looks weird.
So I want to fix it just in case.


I referred Denali(Cadence) NAND Flash Memory Controller User's Guide
and actually I am sure this patch has no impact.

The 3rd argument (transfer_spare) of denali_send_pipeline_cmd()
is don't care  if  its 4th argument to  is access_type=SPARE_ACCESS.

read_oob_data() function calls 
  denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS, DENALI_READ)

So, write_oob_data() function should call
  denali_send_pipeline_cmd(denali, false, true, SPARE_ACCESS, DENALI_WRITE)
for consistency.


Best Regards
Masahiro Yamada
