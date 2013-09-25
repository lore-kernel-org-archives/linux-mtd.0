Received: from mail-ye0-x22e.google.com ([2607:f8b0:4002:c04::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOuqF-00046v-CR
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 19:33:44 +0000
Received: by mail-ye0-f174.google.com with SMTP id q4so59378yen.5
 for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2013 12:33:22 -0700 (PDT)
Date: Wed, 25 Sep 2013 12:33:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: correct extemded param page error handling
Message-ID: <20130925193318.GG23337@ld-irv-0074.broadcom.com>
References: <1379706242-20548-1-git-send-email-computersforpeace@gmail.com>
 <523E5D57.6040008@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <523E5D57.6040008@freescale.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 22, 2013 at 11:00:39AM +0800, Huang Shijie wrote:
> 于 2013年09月21日 03:44, Brian Norris 写道:
> > If the ONFI extended parameter page gives codeword_size == 0, the
> > extended ECC information is corrupt and should not be used. Currently,
> > we (correctly) avoid using the information, but we don't report the
> > error to the caller, so the caller doesn't know that we didn't
> > initialize ecc_strength_ds and ecc_step_ds. Now the caller can warn the
> > user that it does not have sufficient information.
> >
> > This also removes the false and useless "ONFI extended param page
> > detected" debug message (it was printed even on the aforementioned
> > corruption, and for the success case, we don't really want a print).
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Huang Shijie <b32955@freescale.com>
...
> Acked-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git.

Brian
