Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9co5-0004mg-3h
 for linux-mtd@lists.infradead.org; Fri, 20 Apr 2018 20:38:58 +0000
Date: Fri, 20 Apr 2018 22:38:45 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Sam Lefebvre <sam.lefebvre@essensium.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>, "Arnout
 Vandecappelle \(Essensium/Mind\)" <arnout@mind.be>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 11/18] mtd: rawnand: gpmi: instantiate cmdfunc
Message-ID: <20180420223845.049b924f@bbrezillon>
In-Reply-To: <20180420081946.16088-12-sam.lefebvre@essensium.com>
References: <20180420081946.16088-1-sam.lefebvre@essensium.com>
 <20180420081946.16088-12-sam.lefebvre@essensium.com>
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

Hi Sam, Arnout,

On Fri, 20 Apr 2018 10:19:39 +0200
Sam Lefebvre <sam.lefebvre@essensium.com> wrote:

> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
> 
> Later patches will optimize the command handling for gpmi. This
> requires a gpmmi-specific implementation of cmdfunc. As a first step,
> nand_command() is copied literally from nand_base.c (after merging
> nand_command() and nand_command_lp()).

NACK. As said in my review of patch 10, we're trying to move a many
drivers as possible to the ->exec_op() approach in order to ease
maintenance of the NAND subsystem. What you're doing here is going in
the wrong direction.

Please work on a solution based on ->exec_op().

Regards,

Boris
