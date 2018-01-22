Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1edXsQ-0001Mh-6P
 for linux-mtd@lists.infradead.org; Mon, 22 Jan 2018 08:54:52 +0000
Date: Mon, 22 Jan 2018 09:54:38 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
Message-ID: <20180122095438.750d84ef@bbrezillon>
In-Reply-To: <87shb8aghi.fsf@belgarion.home>
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon>
 <87efmwb8bj.fsf@belgarion.home> <20180111232417.4aa86075@xps13>
 <87a7xjbis2.fsf@belgarion.home>
 <20180112094501.27706bfc@bbrezillon>
 <876087beui.fsf@belgarion.home>
 <20180112112108.2e20dc14@bbrezillon>
 <871sivauyf.fsf@belgarion.home>
 <20180113093855.49231a43@bbrezillon>
 <87shb8aghi.fsf@belgarion.home>
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

On Sun, 14 Jan 2018 11:20:57 +0100
Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
> 
> > On Fri, 12 Jan 2018 17:43:52 +0100
> > Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> >  
> >> Boris Brezillon <boris.brezillon@free-electrons.com> writes:
> >>   
> >> > I think I'm still missing something. If I look at the branch you just
> >> > pushed, I see that ->flash_bbt was not set to 1 before this commit [1],
> >> > which means the pxa3xx driver was no setting the NAND_BBT_USE_FLASH
> >> > flag, which in turn means you were not using the on-flash-bbt.
> >> > When you test the old (pxa3xx) driver, are you sure you're testing
> >> > things with a mainline kernel? If you have extra commits on top of
> >> > mainline, can you push them somewhere?    
> >> 
> >> Here is the branch I'm using with my pxa3xx driver :
> >> git fetch https://github.com/rjarzmik/linux pxa3xx-test  
> >
> > May I ask why this is not in mainline?  
> Sure.
> 
> The pxa3xx comes into 3 flavors of SoCs :
>  - pxa300
>  - pxa310
>  - pxa320
> 
> In these 3, only pxa310 has an internal PoP NAND, and requires the keep_config =
> 1 setting (where timings are set by the internal ROM code).
> 
> Yet zylonite_init_nand() is shared across all 3 platforms. In order to not break
> other existing pxa3xx devices, I don't want to change this setting. Instead, my
> plan is slowly convert pxaXXX to devicetree, and have this parameter set in
> devicetree in a per board basis.
> 
> As to the .flash_bbt = 1 parameter, it's even worse. That's the decision made in
> the initial flash formatting that counts. With the zylonite310 I have, the BBT
> is at the end of the NAND. There might be other parts where it's only in the OOB
> area. So it's difficult to change it without taking a risk of breaking others.

Ok. It's clearer now. I wish we had this discussion earlier :-/.

Anyway, thanks for the clarification.

Boris
