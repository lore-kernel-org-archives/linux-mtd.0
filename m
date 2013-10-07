Received: from mail-oa0-x22a.google.com ([2607:f8b0:4003:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTFeB-0005f0-Ar
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 18:35:12 +0000
Received: by mail-oa0-f42.google.com with SMTP id g12so6509604oah.15
 for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2013 11:34:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
References: <002d01ceb7fc$6a5bdd50$3f1397f0$%han@samsung.com>
Date: Mon, 7 Oct 2013 11:34:50 -0700
Message-ID: <CAN8TOE9cQ7xRPrzkqOeqwO-Eo4xJmziCpus_26V0BqpL6a3twA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mtd: intel_vr_nor: remove unnecessary
 pci_set_drvdata()
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 22, 2013 at 6:29 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure. Thus, it is not needed to manually clear the
> device driver data to NULL.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Pushed all 4 to l2-mtd.git. Thanks!

Brian
