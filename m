Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRX5K-000598-SC
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 02:57:11 +0000
Received: by pdbmi9 with SMTP id mi9so21969478pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 19:56:50 -0700 (PDT)
Date: Mon, 17 Aug 2015 19:56:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Michal Suchanek <hramrach@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Joachim Eastwood <manabian@gmail.com>,
 Rafa?? Mi??ecki <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Han Xu <han.xu@freescale.com>, Huang Shijie <shijie.huang@intel.com>
Subject: Re: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
Message-ID: <20150818025639.GB15907@localhost>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
 <201508140109.14149.marex@denx.de>
 <20150813232447.GJ60523@google.com>
 <CAOMqctS-CNu6By1b+s4yEPzgOy3gbtCYuwvET9sRrCnt8Azvhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMqctS-CNu6By1b+s4yEPzgOy3gbtCYuwvET9sRrCnt8Azvhw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 14, 2015 at 07:40:27AM +0200, Michal Suchanek wrote:
> On 14 August 2015 at 01:24, Brian Norris <computersforpeace@gmail.com> wrote:
> > Now, each flash connected to the controller has its own device_node. All
> > this patch is saying is that we don't need to know much about that node;
> > as long as it responds to the READ ID command properly, spi_nor_scan()
> > can autodetect it.
> >
> 
> And if there was suppor for a flash chip that does not respond to READ
> ID (or uses a different opcode for it) this patch would break it,
> right?

For the latter: this already doesn't support chips that use different
opcodes.

For the former: we're only talking about the "*-nonjedec" and similar,
right? I'm not confident those were supported well by this driver in the
first place. (And "*-nonjedec" should really die; if it's needed,
support should be added by design, not by accident.)

Perhaps Huang can comment.

Brian
