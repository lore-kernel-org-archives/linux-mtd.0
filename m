Received: from mail-pb0-x22a.google.com ([2607:f8b0:400e:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQZKS-0000Ki-NR
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 09:32:03 +0000
Received: by mail-pb0-f42.google.com with SMTP id rr13so676984pbb.29
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 02:31:38 -0700 (PDT)
Date: Thu, 20 Mar 2014 02:31:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 0/5] mtd: nand: omap: optimized chip->ecc.correct()
 for H/W ECC schemes
Message-ID: <20140320093100.GI31517@norris-Latitude-E6410>
References: <1395149206-23713-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395149206-23713-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 18, 2014 at 06:56:41PM +0530, Pekon Gupta wrote:
> *changes v8 -> v9*
> [PATCH v9 1/5] <no change>
> [PATCH v9 2/5] <no change>
> [PATCH v9 3/5]
>  - dropped earlier versions [PATCH v8 3/6] and PATCH v8 4/6], as per feedbacks from
>    MTD maintainer 'Brian Norris <computersforpeace@gmail.com>'
>    http://lists.infradead.org/pipermail/linux-mtd/2014-March/052472.html
>  - Current patch uses existing method of comparing calc_ecc[] with pre-known ECC(all 0xff data + OOB)
>    to identify erased-pages. Thereby removing dependency on 'reserved-marker'.
> [PATCH v9 4/5] <same as [PATCH v8 5/6]>
> [PATCH v9 5/5] <same as [PATCH v8 6/6]>

Pushed all 5 to l2-mtd.git. Thanks!

Brian
