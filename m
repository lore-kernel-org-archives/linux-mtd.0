Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zgjw8-00083r-UG
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 01:42:34 +0000
Received: by padhy16 with SMTP id hy16so189879635pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Sep 2015 18:42:12 -0700 (PDT)
Date: Mon, 28 Sep 2015 18:42:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Fang <fangwei1@huawei.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH RESEND] jffs2: remove unneeded kfree
Message-ID: <20150929014209.GA31505@google.com>
References: <1436237666-27398-1-git-send-email-fangwei1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436237666-27398-1-git-send-email-fangwei1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 07, 2015 at 10:54:26AM +0800, Wei Fang wrote:
> c->oobbuf hasn't been kmalloced in jffs2_dataflash_setup, so
> there is no need to free it.
> 
> Signed-off-by: Wei Fang <fangwei1@huawei.com>

Applied to l2-mtd.git
