Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMyPC-0005TW-Of
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 09:20:59 +0000
Received: by lagy4 with SMTP id y4so1423695lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 02:20:55 -0700 (PDT)
Date: Wed, 25 Apr 2012 12:20:43 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 5/7] mtd: nand: read_page() returns max_bitflips
Message-ID: <20120425122043.62326c03@pixies.home.jungo.com>
In-Reply-To: <1335295105-7981-6-git-send-email-mikedunn@newsguy.com>
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-6-git-send-email-mikedunn@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Jack Lan <jack.lan@freescale.com>, Nick Spence <nick.spence@freescale.com>,
 linux-mtd@lists.infradead.org, Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Scott Wood <scottwood@freescale.com>, Jamie Iles <jamie@jamieiles.com>,
 Axel Lin <axel.lin@gmail.com>, Roy Zang <tie-fei.zang@freescale.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Tue, 24 Apr 2012 12:18:23 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> The ecc.read_page() method for nand drivers is changed to return the maximum
> number of bitflips that were corrected on any one region covering an ecc step,
> This patch doesn't change what the nand code returns to mtd.
> 
> This patch wasn't necessary in the earlier attempt at this effort because when
> max_bitflips referred to the entire page, the number of corrected bitflips could
> be obtained from the ecc_stats by the nand infrastructure code.
> 
> This basically follows Schmulik's suggested approach [1].  It was tested only on
> the docg4, but all drivers were compile-tested with the appropriate
> cross-compiler.
> 
> [1] http://lists.infradead.org/pipermail/linux-mtd/2012-March/040343.html
> 
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

Reviewed nand_base.c, looks okay.

(though I wish we could avoid the max_bitflips calculation code
repetition)

Regards,
Shmulik
