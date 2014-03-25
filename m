Received: from mail-wi0-f179.google.com ([209.85.212.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSR9H-0004Vr-3y
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 13:12:11 +0000
Received: by mail-wi0-f179.google.com with SMTP id f8so585281wiw.12
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 06:11:47 -0700 (PDT)
Date: Tue, 25 Mar 2014 13:11:39 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC 00/47] mtd: nand: Add new driver supporting ST's BCH h/w
Message-ID: <20140325131139.GB24823@lee--X1>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <20140325125050.GB665@arch.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140325125050.GB665@arch.cereza>
Cc: angus.clark@st.com, kernel@stlinux.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 25 Mar 2014, Ezequiel Garcia wrote:

> Hi Lee,
> 
> On Mar 25, Lee Jones wrote:
> > 
> > This patch-set was written against kernel version v3.4, but applies
> > cleanly to v3.13-rc7 which it is currently based. I understand that
> > the core has changed significantly since and that some of the
> > infrastructure this driver provides is now available either through
> > the framework or similar means. I'm looking for someone with inside
> > knowledge to draw attention to those areas so we can align with the
> > most recent API.
> > 
> 
> Please push a git branch. It will be nice to have a way of seeing the 'big
> picture' without applying the 47 patches.

Sure:

  git://git.linaro.org/people/lee.jones/linux-3.0-ux500.git tb-st-mtd-nand-bch

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
