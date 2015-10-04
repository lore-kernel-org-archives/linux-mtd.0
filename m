Received: from mail-yk0-x235.google.com ([2607:f8b0:4002:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZimJU-00088p-O1
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2015 16:39:05 +0000
Received: by ykdg206 with SMTP id g206so150065901ykd.1
 for <linux-mtd@lists.infradead.org>; Sun, 04 Oct 2015 09:38:42 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sun, 4 Oct 2015 12:38:36 -0400
From: Tejun Heo <tj@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] signal: turn dequeue_signal_lock() into
 kernel_dequeue_signal()
Message-ID: <20151004163836.GA19652@htj.duckdns.org>
References: <20151003181319.GA1036@redhat.com>
 <20151003181336.GA1054@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151003181336.GA1054@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 03, 2015 at 08:13:36PM +0200, Oleg Nesterov wrote:
> 1. Rename dequeue_signal_lock() to kernel_dequeue_signal(). This
>    matches another "for kthreads only" kernel_sigaction() helper.
> 
> 2. Remove the "tsk" and "mask" arguments, they are always current
>    and current->blocked. And it is simply wrong if tsk != current.
> 
> 3. We could also remove the 3rd "siginfo_t *info" arg but it looks
>    potentially useful. However we can simplify the callers if we
>    change kernel_dequeue_signal() to accept info => NULL.
> 
> 4. Remove _irqsave, it is never called from atomic context.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

FWIW, looks good to me.

Reviewed-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
