Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgrQw-0002sA-Pz
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 08:38:19 +0000
Received: by mail-pd0-f170.google.com with SMTP id z10so3117627pdj.1
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 01:37:57 -0700 (PDT)
Date: Wed, 22 Oct 2014 01:37:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 1/2] mtd: docg3: add device-tree support
Message-ID: <20141022083754.GG16128@brian-ubuntu>
References: <1411846470-30041-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411846470-30041-1-git-send-email-robert.jarzmik@free.fr>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 27, 2014 at 09:34:29PM +0200, Robert Jarzmik wrote:
> Add device-tree support. This is straightforward as docg3 only uses the
> standard IOMEM resources.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: devicetree@vger.kernel.org
> Cc: Mark Rutland <mark.rutland@arm.com>
> 
> ---
> Since v1: Mark's review: changed compatible string

Pushed both to l2-mtd.git. Thanks!

Brian
