Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxWUU-0005u7-BF
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 08:15:07 +0000
Received: by pdea3 with SMTP id a3so4332312pde.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 01:14:42 -0700 (PDT)
Date: Wed, 27 May 2015 01:14:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: Reg status of mtd: nand: Allow NAND chip ids to be included
 standalone
Message-ID: <20150527081439.GF23718@brian-ubuntu>
References: <CAO_48GHtTadJN0j25G0MpdjZdtNvsTcevrgT9-zx3UWy9UnOfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO_48GHtTadJN0j25G0MpdjZdtNvsTcevrgT9-zx3UWy9UnOfw@mail.gmail.com>
Cc: mnalajal@codeaurora.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sumit,

On Wed, May 27, 2015 at 01:28:16PM +0530, Sumit Semwal wrote:
> Hello,
> 
> As part of Linaro's Android Upstreaming effort, we were revisiting
> outstanding patches, and realised that this patch [1] isn't yet
> upstream.
> 
> I asked Artem for his advice (in a personal email), and he kindly
> pointed me to ask on the mailing list as well - so could anyone please
> let me know if there was something pending with this patch, or did it
> just get missed?
> 
> If it just got missed, I could help with re-submitting it if required,
> so it can get queued up.
> 
> Thanks very much!
> 
> [1] : http://patchwork.ozlabs.org/patch/85874/

I fully agree with Artem's comment from 4 years ago:

"No, I think you should "sell" your driver better than that."

Your msm_nand driver should be rewritten to use nand_base properly, at
which point your linked patch would be unnecessary.

IOW, the linked patch is now officially "Rejected".

Brian
