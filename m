Received: from mail-pd0-f180.google.com ([209.85.192.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL5XB-000663-Pp
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 07:47:02 +0000
Received: by pdbft15 with SMTP id ft15so37350362pdb.5
 for <linux-mtd@lists.infradead.org>; Mon, 09 Feb 2015 23:46:40 -0800 (PST)
Date: Tue, 10 Feb 2015 15:46:34 +0800
From: Lee Jones <lee.jones@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 02/10] mtd: st_spi_fsm: Fetch boot device locations
 from DT match tables
Message-ID: <20150210074634.GD8020@x1>
References: <1421853868-8262-1-git-send-email-lee.jones@linaro.org>
 <1421853868-8262-3-git-send-email-lee.jones@linaro.org>
 <20150206042744.GK18140@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150206042744.GK18140@ld-irv-0074>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 05 Feb 2015, Brian Norris wrote:

> On Wed, Jan 21, 2015 at 03:24:20PM +0000, Lee Jones wrote:
> > To trim down on the amount of properties used by this driver and to conform
> > to the newly agreed method of acquiring syscfg registers/offsets, we now
> > obtain this information using match tables.
> 
> Where did this agreement happen? Are you only referring to the previous
> patch?

I think your interpretation of the above text and my intentions are
not the same.  I have no idea why there is a different configuration
depending on if we booted from SPI NOR or not and hence can not answer
your query below.  The description above is pertaining to the
different/new way in which we obtain and request syscfg registers.

In previous incarnations of this patchset, we were defining new vendor
specific properties in order to request and register and the mask:

  st,boot-device-reg = <0x958>;
  st,boot-device-spi = <0x1a>;

... this is not optimal, as DT properties should only be created if
there are no other way to obtain platform specific information.  As
there are few supported platforms and this configuration does not
change through variants, we are now supplying it via static tables,
which can be obtained easily using the DT match framework.

> I think I asked this previously, and I didn't get an answer.

Not sure if you did or not to be honest.

> Also, I realized that all this boot device / syscfg gymnastics is just
> for one simple fact; your driver is trying to hide the fact that your
> system can't reliably handle 4-byte addressing for the boot device. Even
> if you try your best at toggling 4-byte addressing before/after each
> read/write/erase, you still are vulnerable to power cuts during the
> operation. This is a bad design, and we have consistently agreed that we
> aren't going to work around that in Linux.
> 
> Better solutions: hook up a reset line to your flash; improve your boot
> ROM / bootloader to handle 4-byte addressing for large flash.

You have reached the boundaries of my knowledge on this.  Perhaps
Angus (BCC'ed) would be kind enough to assist.

> What's the possibility of dropping all this 4-byte address toggling
> shenanigans? This will be a blocker to merging with spi-nor.c.
> 
> > In the process we are deprecating the old generic compatible string and
> > providing 3 shiny new ones for each of the support platforms.  The
> > deprecated compatible string will be removed in due course.
> 
> Aren't you already removing the compatible string? (You changed this in
> the latest revision.)

You're right.  I need to remove this line from the commit log.

> > Cc: devicetree@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> [snip]
> 
> Brian

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
