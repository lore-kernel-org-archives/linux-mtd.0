Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXF3a-0001uk-RM
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:54:59 +0000
Received: by padhy1 with SMTP id hy1so22688962pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 13:54:37 -0700 (PDT)
Date: Wed, 2 Sep 2015 13:54:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jteki@openedev.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for Micron n25q064a serial flash
Message-ID: <20150902205435.GW81844@google.com>
References: <1440669139-84122-1-git-send-email-mika.westerberg@linux.intel.com>
 <CAD6G_RR0Vy4ZUtadEnvZ=U=kyZkKuW2dN+hKUezA_YMYJUo98w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD6G_RR0Vy4ZUtadEnvZ=U=kyZkKuW2dN+hKUezA_YMYJUo98w@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 28, 2015 at 09:45:38AM +0530, Jagan Teki wrote:
> On 27 August 2015 at 15:22, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Add Micron (n25q064a) 8MB flash to the list of supported chips.
> >
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> 
> I have not tested this, but I just verified the read_id other flash details.
> 
> Reviewed-by: Jagan Teki <jteki@openedev.com>

Applied to l2-mtd.git/next
