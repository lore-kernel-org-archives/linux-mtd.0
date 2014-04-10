Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKCP-0007vt-1I
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 18:59:45 +0000
Received: by mail-ie0-f177.google.com with SMTP id rl12so4397842iec.36
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 11:59:22 -0700 (PDT)
Date: Thu, 10 Apr 2014 11:59:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/9] mtd: st_spi_fsm: kill duplicate CMD definitions
Message-ID: <20140410185919.GJ32070@ld-irv-0074>
References: <1397064774-31784-1-git-send-email-computersforpeace@gmail.com>
 <1397064774-31784-7-git-send-email-computersforpeace@gmail.com>
 <CAMuHMdWu7YVO_RD-SUfaTw1Jp97i5bm8iX5TzKeqgWAk_iN5qQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWu7YVO_RD-SUfaTw1Jp97i5bm8iX5TzKeqgWAk_iN5qQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 10, 2014 at 08:01:55PM +0200, Geert Uytterhoeven wrote:
> On Wed, Apr 9, 2014 at 7:32 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > These are also in serial_flash_cmds.h. (FWIW, I didn't know the C
> > preprocessor allowed redefinitions without warning like this.)
> 
> Cpp only complains when the redefinitions are different.

Good to know. Thanks.

Brian
