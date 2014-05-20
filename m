Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wmf9Z-0003vD-QL
 for linux-mtd@lists.infradead.org; Tue, 20 May 2014 08:12:06 +0000
Received: by mail-pd0-f169.google.com with SMTP id w10so98168pde.28
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 01:11:40 -0700 (PDT)
Date: Tue, 20 May 2014 01:11:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/4] mtd: Add sysfs attr to expose ECC stats
Message-ID: <20140520081135.GF2413@norris-Latitude-E6410>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAB91D7@DBDE04.ent.ti.com>
 <20140401111359.GA3324@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EAC31AE@DBDE04.ent.ti.com>
 <20140513005053.GZ28907@ld-irv-0074>
 <20140513022614.GA1447@arch.cereza>
 <20140519034355.GB1062@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140519034355.GB1062@arch.cereza>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trimming CC list

On Mon, May 19, 2014 at 12:43:55AM -0300, Ezequiel Garcia wrote:
> How about the following?
> 
> * corrected_bits
> * uncorrectable_errors
> * badblocks
> * bbtblocks

How about we consistently separate words with underscores ('_')? So:

 * corrected_bits
 * uncorrectable_errors
 * bad_blocks
 * bbt_blocks

I'm not too stuck on the naming, so other ideas are welcome.

Brian
