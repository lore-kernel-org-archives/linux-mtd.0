Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yckd8-0005tp-At
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 01:06:10 +0000
Received: by pdbni2 with SMTP id ni2so3011183pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 18:05:49 -0700 (PDT)
Date: Mon, 30 Mar 2015 18:05:44 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Print the error value
Message-ID: <20150331010544.GM32500@ld-irv-0074>
References: <1423483639-4305-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423483639-4305-1-git-send-email-fabio.estevam@freescale.com>
Cc: linux-mtd@lists.infradead.org, han.xu@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 09, 2015 at 10:07:19AM -0200, Fabio Estevam wrote:
> When displaying dev_err() messages it is useful to print the error value.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git, with an additionl language fixup ("can not" ->
"cannot").

Thanks,
Brian
