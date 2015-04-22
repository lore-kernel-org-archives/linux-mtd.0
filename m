Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkykW-0002VF-QL
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 17:47:49 +0000
Received: by paboj16 with SMTP id oj16so279191803pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2015 10:47:27 -0700 (PDT)
Date: Wed, 22 Apr 2015 10:47:19 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 2/6] mtd: nand: Add JEDEC manufacturer ID for Gigadevice
Message-ID: <20150422174719.GV32500@ld-irv-0074>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-3-git-send-email-ezequiel.garcia@imgtec.com>
 <CAAK6Zt1ncdnibAYu25vOLF1uqycD+kgwXMtK8f0BOSCfoQvXWA@mail.gmail.com>
 <5536D77B.5040402@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5536D77B.5040402@imgtec.com>
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 Daniel Ehrenberg <dehrenberg@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 arnaud.mouiche@invoxia.com, James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 21, 2015 at 08:04:27PM -0300, Ezequiel Garcia wrote:
> On 12/12/2014 09:49 PM, Daniel Ehrenberg wrote:
> > On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
> > <ezequiel.garcia@imgtec.com> wrote:
> >> This commit adds Gigadevice to the list of manufacturer ID and name strings.
> >>
> >> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
> > 
> > Reviewed-by: Dan Ehrenberg <dehrenberg@chromium.org>
> > 
> 
> Hey Brian,
> 
> Do you think you can pick this one?

Why would I do that, when I thought we were considering having a
separate SPI NAND vs. parallel NAND driver (including separate ID
tables)? Or are you seeing parallel NAND by Gigadevice?

Brian
