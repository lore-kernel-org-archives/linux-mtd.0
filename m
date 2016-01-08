Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHTQC-0006XK-9s
 for linux-mtd@lists.infradead.org; Fri, 08 Jan 2016 09:33:24 +0000
Received: by mail-oi0-x22c.google.com with SMTP id k206so7599078oia.1
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jan 2016 01:33:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151117191801.GA864@dw-nb.local>
References: <20151117191448.GA5367@dw-nb.local>
 <20151117191801.GA864@dw-nb.local>
Date: Fri, 8 Jan 2016 10:33:03 +0100
Message-ID: <CAFLxGvxPHN0JcEZShS_QV869U_E+Rdk=DYTCTeUHQ-eiH4_BfA@mail.gmail.com>
Subject: Re: [RFC] [PATCH] mtd: add tracepoints for mtd_read and mtd_write
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 8:18 PM, Daniel Walter <dwalter@sigma-star.at> wrote:
> Add tracepoints to mtd subsystem for read and write
> operations. This should allow us to identify applications
> which are generating too much reads/writes on a flash-device.
>
> Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
> ---
>  drivers/mtd/mtdcore.c      |  6 +++++-
>  include/trace/events/mtd.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 include/trace/events/mtd.h
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 8bbbb75..8f85bfb 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -43,6 +43,9 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/partitions.h>
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/mtd.h>
> +
>  #include "mtdcore.h"
>
>  static struct backing_dev_info mtd_bdi = {
> @@ -882,7 +885,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
>                 return -EINVAL;
>         if (!len)
>                 return 0;
> -
> +       trace_mtd_read(current, len);
>         /*
>          * In the absence of an error, drivers return a non-negative integer
>          * representing the maximum number of bitflips that were corrected on
> @@ -907,6 +910,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>                 return -EROFS;
>         if (!len)
>                 return 0;
> +       trace_mtd_write(current, len);
>         return mtd->_write(mtd, to, len, retlen, buf);
>  }
>  EXPORT_SYMBOL_GPL(mtd_write);
> diff --git a/include/trace/events/mtd.h b/include/trace/events/mtd.h
> new file mode 100644
> index 0000000..7191b72
> --- /dev/null
> +++ b/include/trace/events/mtd.h
> @@ -0,0 +1,45 @@
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM mtd
> +
> +#if !defined(_TRACE_MTD_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_MTD_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(mtd_read,
> +       TP_PROTO(struct task_struct *task, size_t rlen),
> +       TP_ARGS(task, rlen),
> +       TP_STRUCT__entry(
> +               __field(pid_t, pid)
> +               __array(char, comm, TASK_COMM_LEN)
> +               __field(size_t, rlen)
> +       ),
> +       TP_fast_assign(
> +               __entry->pid = task->pid;
> +               memcpy(__entry->comm, task->comm, TASK_COMM_LEN);
> +               __entry->rlen = rlen;
> +       ),
> +       TP_printk("pid=%d comm=%s rlen=%zu",
> +               __entry->pid, __entry->comm, __entry->rlen)
> +);
> +
> +TRACE_EVENT(mtd_write,
> +       TP_PROTO(struct task_struct *task, size_t wlen),
> +       TP_ARGS(task, wlen),
> +       TP_STRUCT__entry(
> +               __field(pid_t, pid)
> +               __array(char, comm, TASK_COMM_LEN)
> +               __field(size_t, wlen)
> +       ),
> +       TP_fast_assign(
> +               __entry->pid = task->pid;
> +               memcpy(__entry->comm, task->comm, TASK_COMM_LEN);
> +               __entry->wlen = wlen;
> +       ),
> +       TP_printk("pid=%d comm=%s wlen=%zu",
> +               __entry->pid, __entry->comm, __entry->wlen)
> +);
> +#endif /* _TRACE_MTD_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>

Brian, any comments on this?

-- 
Thanks,
//richard
