Received: from mail-yk0-x22e.google.com ([2607:f8b0:4002:c07::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zin5M-0006Pj-IU
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2015 17:28:33 +0000
Received: by ykdz138 with SMTP id z138so151892421ykd.2
 for <linux-mtd@lists.infradead.org>; Sun, 04 Oct 2015 10:28:10 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 4 Oct 2015 13:28:07 -0400
From: Tejun Heo <tj@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] signal: introduce kernel_signal_stop() to fix
 jffs2_garbage_collect_thread()
Message-ID: <20151004172807.GB19652@htj.duckdns.org>
References: <20151003181319.GA1036@redhat.com>
 <20151003181338.GA1057@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151003181338.GA1057@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 03, 2015 at 08:13:38PM +0200, Oleg Nesterov wrote:
> jffs2_garbage_collect_thread() can race with SIGCONT and sleep in
> TASK_STOPPED state after it was already sent. Add the new helper,
> kernel_signal_stop(), which does this correctly.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
