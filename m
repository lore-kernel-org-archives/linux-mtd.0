Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUk8B-000895-5Y
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 21:20:21 +0000
Received: by mail-ie0-f178.google.com with SMTP id to1so9797126ieb.9
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2013 14:19:55 -0700 (PDT)
Date: Fri, 11 Oct 2013 14:19:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] mtg: docg3: use free_bch() instead of kfree()
Message-ID: <20131011211951.GP23337@ld-irv-0074.broadcom.com>
References: <CAPgLHd_vT4cJ1F1a6TDzYb2LFSb-me90K58K22Z=ae3VsOfbng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPgLHd_vT4cJ1F1a6TDzYb2LFSb-me90K58K22Z=ae3VsOfbng@mail.gmail.com>
Cc: artem.bityutskiy@linux.intel.com, jg1.han@samsung.com,
 linux-kernel@vger.kernel.org, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org, robert.jarzmik@free.fr, dwmw2@infradead.org,
 dan.carpenter@oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 11, 2013 at 12:40:21PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Use free_bch() instead of kfree() to free init_bch()
> allocated data.
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Pushed to l2-mtd.git. Thanks!

Brian
