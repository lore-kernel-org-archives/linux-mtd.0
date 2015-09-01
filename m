Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWqVS-0002rL-0M
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 18:42:06 +0000
Received: by padhy1 with SMTP id hy1so4120645pad.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 11:41:44 -0700 (PDT)
Date: Tue, 1 Sep 2015 11:41:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@arm.com>
Cc: Han Xu <xhnjupt@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
 Marek Vasut <marex@denx.de>, Joachim Eastwood <manabian@gmail.com>,
 Rafa?? Mi??ecki <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie.huang@intel.com>, Han Xu <han.xu@freescale.com>
Subject: Re: [RFT PATCH 1/4] mtd: fsl-quadspi: use automatic spi-nor detection
Message-ID: <20150901184141.GI81844@google.com>
References: <1439505965-134748-1-git-send-email-computersforpeace@gmail.com>
 <1439505965-134748-2-git-send-email-computersforpeace@gmail.com>
 <201508140109.14149.marex@denx.de>
 <20150813232447.GJ60523@google.com>
 <CAOMqctS-CNu6By1b+s4yEPzgOy3gbtCYuwvET9sRrCnt8Azvhw@mail.gmail.com>
 <20150818025639.GB15907@localhost>
 <CA+EcR21P_6KefOi1yH5Qiuy8KmwipL8wz2WJ5iWLYGUj_yOqKA@mail.gmail.com>
 <20150818080927.GE10641@free64-pc.asiapac.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150818080927.GE10641@free64-pc.asiapac.arm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 04:09:27PM +0800, Huang Shijie wrote:
> On Mon, Aug 17, 2015 at 10:15:50PM -0500, Han Xu wrote:
> > Seems Huang has changed the e-mail address.

Thanks, noted.

> > On Mon, Aug 17, 2015 at 9:56 PM, Brian Norris
> > <computersforpeace@gmail.com> wrote:
> > > On Fri, Aug 14, 2015 at 07:40:27AM +0200, Michal Suchanek wrote:
> > >> On 14 August 2015 at 01:24, Brian Norris <computersforpeace@gmail.com> wrote:
> > >> > Now, each flash connected to the controller has its own device_node. All
> > >> > this patch is saying is that we don't need to know much about that node;
> > >> > as long as it responds to the READ ID command properly, spi_nor_scan()
> > >> > can autodetect it.
> > >> >
> > >>
> > >> And if there was suppor for a flash chip that does not respond to READ
> > >> ID (or uses a different opcode for it) this patch would break it,
> > >> right?
> 
> Do not worry about the quadspi controller :)
> 
> The controller only uses the best NOR flash (or maybe the best NOR flash), I remember
> that the NOR flash can support the QUAD DDR read which is not supported not.
> 
> So it will not break the driver. 
> 
> Btw: @Han Xu : I think you can test this patch.
> 
> > >
> > > For the latter: this already doesn't support chips that use different
> > > opcodes.
> > >
> > > For the former: we're only talking about the "*-nonjedec" and similar,
> > > right? I'm not confident those were supported well by this driver in the
> > > first place. (And "*-nonjedec" should really die; if it's needed,
> > > support should be added by design, not by accident.)
> > >
> > > Perhaps Huang can comment.
> 
> I think this patch is okay. But please wait for Han's test result.

OK. Pushed patches 2-4 to l2-mtd.git/next. Will wait on this one.
