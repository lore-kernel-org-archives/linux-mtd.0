Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VU4TX-0006Mz-Vl
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 00:51:36 +0000
Received: by mail-oa0-f54.google.com with SMTP id n5so914673oag.41
 for <linux-mtd@lists.infradead.org>; Wed, 09 Oct 2013 17:51:14 -0700 (PDT)
Date: Wed, 9 Oct 2013 17:51:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/2] mtd: socrates_nand: Remove redundant dev_set_drvdata
Message-ID: <20131010005111.GH23337@ld-irv-0074.broadcom.com>
References: <1381226506-23030-1-git-send-email-sachin.kamat@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381226506-23030-1-git-send-email-sachin.kamat@linaro.org>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 08, 2013 at 03:31:45PM +0530, Sachin Kamat wrote:
> Driver core will set the driver data to NULL upon detach or
> probe failure.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Pushed both to l2-mtd.git. Thanks!

Brian
