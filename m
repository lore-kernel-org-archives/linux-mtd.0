Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSh4g-0004Dy-IF
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 06:12:31 +0000
Received: by mail-pb0-f45.google.com with SMTP id uo5so1486960pbc.32
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 23:12:06 -0700 (PDT)
Date: Tue, 25 Mar 2014 23:12:01 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v8 0/4] mtd: devices: elm: add checks ELM H/W constrains,
 driver code cleanup
Message-ID: <20140326061201.GX31517@norris-Latitude-E6410>
References: <1395321517-4490-1-git-send-email-pekon@ti.com>
 <20140320134828.GA1585@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140320134828.GA1585@arch.cereza>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 20, 2014 at 10:48:28AM -0300, Ezequiel Garcia wrote:
> On Mar 20, Pekon Gupta wrote:
> > *changes v7 -> v8*
> > Incorporated feedbacks from Brian Norris <computersforpeace@gmail.com>
> >  - renamed ecc_step_bytes -> ecc_syndrome_size
> > 
[...]
> > Pekon Gupta (4):
> >   mtd: devices: elm: check for hardware engine's design constraints
> >   mtd: devices: elm: clean elm_load_syndrome
> >   mtd: devices: elm: configure parallel channels based on ecc_steps
> >   mtd: devices: elm: update DRIVER_NAME as "omap-elm"
> > 
> 
> For the whole series:
> 
> Reviewed-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed to l2-mtd.git. Thanks!

Brian
