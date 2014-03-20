Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQanO-0003au-Lo
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:05:59 +0000
Received: by mail-pb0-f45.google.com with SMTP id uo5so787157pbc.32
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:05:34 -0700 (PDT)
Date: Thu, 20 Mar 2014 04:05:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v7 0/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Message-ID: <20140320110531.GP31517@norris-Latitude-E6410>
References: <1395300118-32202-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395300118-32202-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 20, 2014 at 12:51:54PM +0530, Pekon Gupta wrote:
> *changes v6 -> v7*
> Incorporated feedbacks from Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>  - using dev_err() instead of pr_err()
>  - moved un-related addition of info->ecc_steps, info->ecc_step_bytes,
>    info->ecc_step_size from [PATCH v6 1/4] into subsequent patches
>  - dropped pr_fmt() change

I just realized I replied to the old patches (v5 or so?). But I think
all my comments apply to this series. If you can address the comments,
then you have my Ack.

Regards,
Brian
