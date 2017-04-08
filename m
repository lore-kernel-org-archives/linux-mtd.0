Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwfD5-0007Ku-Qx
 for linux-mtd@lists.infradead.org; Sat, 08 Apr 2017 01:30:41 +0000
Date: Fri, 7 Apr 2017 21:30:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 tglx@linutronix.de, viro@zeniv.linux.org.uk, gregkh@linuxfoundation.org,
 andreas.dilger@intel.com, arnd@arndb.de, bfields@fieldses.org, clm@fb.com,
 davem@davemloft.net, dsterba@suse.com, dushistov@mail.ru,
 eparis@redhat.com, jaegeuk@kernel.org, jbacik@fb.com,
 jlayton@poochiereds.net, john.stultz@linaro.org, jsimmons@infradead.org,
 mingo@redhat.com, oleg.drokin@intel.com, paul@paul-moore.com,
 yuchao0@huawei.com, ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-audit@redhat.com, linux-btrfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-security-module@vger.kernel.org, lustre-devel@lists.lustre.org,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 y2038@lists.linaro.org
Subject: Re: [PATCH 02/12] trace: Make trace_hwlat timestamp y2038 safe
Message-ID: <20170407213011.36e29f42@gandalf.local.home>
In-Reply-To: <1491613030-11599-3-git-send-email-deepa.kernel@gmail.com>
References: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
 <1491613030-11599-3-git-send-email-deepa.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri,  7 Apr 2017 17:57:00 -0700
Deepa Dinamani <deepa.kernel@gmail.com> wrote:

> struct timespec is not y2038 safe on 32 bit machines
> and needs to be replaced by struct timespec64
> in order to represent times beyond year 2038 on such
> machines.
> 
> Fix all the timestamp representation in struct trace_hwlat
> and all the corresponding implementations.
> 

> diff --git a/kernel/trace/trace_output.c b/kernel/trace/trace_output.c
> index 02a4aeb..08f9bab 100644
> --- a/kernel/trace/trace_output.c
> +++ b/kernel/trace/trace_output.c
> @@ -4,7 +4,6 @@
>   * Copyright (C) 2008 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
>   *
>   */
> -
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/ftrace.h>
> @@ -1161,11 +1160,11 @@ trace_hwlat_print(struct trace_iterator *iter, int flags,
>  
>  	trace_assign_type(field, entry);
>  
> -	trace_seq_printf(s, "#%-5u inner/outer(us): %4llu/%-5llu ts:%ld.%09ld",
> +	trace_seq_printf(s, "#%-5u inner/outer(us): %4llu/%-5llu ts:%lld.%09ld",
>  			 field->seqnum,
>  			 field->duration,
>  			 field->outer_duration,
> -			 field->timestamp.tv_sec,
> +			 (long long)field->timestamp.tv_sec,

Refresh my memory. We need the cast because on 64 bit boxes
timestamp.tv_sec is just a long?

Other than that.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

>  			 field->timestamp.tv_nsec);
>  
>  	if (field->nmi_count) {
> @@ -1195,10 +1194,10 @@ trace_hwlat_raw(struct trace_iterator *iter, int flags,
>  
>  	trace_assign_type(field, iter->ent);
>  
> -	trace_seq_printf(s, "%llu %lld %ld %09ld %u\n",
> +	trace_seq_printf(s, "%llu %lld %lld %09ld %u\n",
>  			 field->duration,
>  			 field->outer_duration,
> -			 field->timestamp.tv_sec,
> +			 (long long)field->timestamp.tv_sec,
>  			 field->timestamp.tv_nsec,
>  			 field->seqnum);
>  
