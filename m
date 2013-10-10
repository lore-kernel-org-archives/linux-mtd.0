Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU4Ss-0006LG-NX
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 00:50:55 +0000
Received: by mail-oa0-f53.google.com with SMTP id i7so920084oag.12
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 17:50:33 -0700 (PDT)
Date: Wed, 9 Oct 2013 17:50:29 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] mtd: fsl_ifc_nand: Remove redundant dev_set_drvdata
Message-ID: <20131010005029.GG23337@ld-irv-0074.broadcom.com>
References: <1381225100-19693-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381225100-19693-1-git-send-email-sachin.kamat@linaro.org>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 08, 2013 at 03:08:19PM +0530, Sachin Kamat wrote:
> Driver core will set the driver data to NULL upon detach or
> probe failure.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed both to l2-mtd.git. Thanks!

Brian
