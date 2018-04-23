Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAW8o-0003vd-1E
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2018 07:44:04 +0000
Received: by mail-wr0-x22e.google.com with SMTP id f14-v6so38342628wre.4
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2018 00:43:51 -0700 (PDT)
Subject: Re: [PATCH 11/18] mtd: rawnand: gpmi: instantiate cmdfunc
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
 <20180420081946.16088-12-sam.lefebvre@essensium.com>
 <20180420223845.049b924f@bbrezillon>
From: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <5965e578-a6bf-74b2-6cda-9ada6dae6285@mind.be>
Date: Mon, 23 Apr 2018 09:43:48 +0200
MIME-Version: 1.0
In-Reply-To: <20180420223845.049b924f@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 20-04-18 22:38, Boris Brezillon wrote:
> Hi Sam, Arnout,
> 
> On Fri, 20 Apr 2018 10:19:39 +0200
> Sam Lefebvre <sam.lefebvre@essensium.com> wrote:
> 
>> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
>>
>> Later patches will optimize the command handling for gpmi. This
>> requires a gpmmi-specific implementation of cmdfunc. As a first step,
>> nand_command() is copied literally from nand_base.c (after merging
>> nand_command() and nand_command_lp()).
> 
> NACK. As said in my review of patch 10, we're trying to move a many
> drivers as possible to the ->exec_op() approach in order to ease
> maintenance of the NAND subsystem. What you're doing here is going in
> the wrong direction.
> 
> Please work on a solution based on ->exec_op().

 The problem is that exec_op() is a revolutionary change, because you need to
change *all* operations at the same time. I personally believe in a step-by-step
approach rather than rewriting everything from scratch. That's why patches 11,
12, 13, 14, 15 are all split out, to show for each step how and why it works.

 In a step-by-step approach, I think that going through cmdfunc is a step
towards exec_op. In terms of granularity, I think cmd_ctrl < cmdfunc < exec_op
right?

 It also doesn't help that there is not much documentation of exec_op. There's
Miquel's FOSDEM18 talk, there's the struct documentation, and there are just a
few drivers that can serve as an example. In particular, I don't understand what
happens when a pattern is not included in the nand_op_parser. It's also not
clear to me how ECC is supposed to be integrated with it. For example, looking
at the marvell driver, it seems the nand_base infra and exec_op are bypassed
entirely for hwecc accesses.

 Finally, we are working on a budget that gets extended on a day-by-day basis,
so we wanted to be able to push *something* within budget rather than not
upstreaming anything at all.

 That said, what should be the next steps? I guess continuing with patch 19, 20,
21 using the same approach doesn't make a lot of sense since you're not going to
merge it in this form. We can of course repost patches 1-8 with a fix in patch
7. We could start working on exec_op conversion, but there's a big chance that
nothing will be ready for submission when the budget dries up, and we probably
won't get to the . Any other ideas?

 If we do work on conversion to exec_op, what's the proper way to do this gradually?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
