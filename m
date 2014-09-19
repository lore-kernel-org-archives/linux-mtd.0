Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUum8-00042M-Oa
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 09:46:49 +0000
Message-ID: <541BFB6D.3040903@nod.at>
Date: Fri, 19 Sep 2014 11:46:21 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Fix possible deadlock in erase_worker()
References: <1410853702-11616-1-git-send-email-richard@nod.at>
 <1410946526.28850.120.camel@sauron.fi.intel.com>
In-Reply-To: <1410946526.28850.120.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.09.2014 11:35, schrieb Artem Bityutskiy:
> On Tue, 2014-09-16 at 09:48 +0200, Richard Weinberger wrote:
>> If sync_erase() failes with EINTR, ENOMEM, EAGAIN or
>> EBUSY erase_worker() re-schedules the failed work.
>> This will lead to a deadlock because erase_worker() is called
>> with work_sem held in read mode. And schedule_erase() will take
>> this lock again.
> 
> There is this code snippet:
> 
>         ubi_err("failed to erase PEB %d, error %d", pnum, err);
>         kfree(wl_wrk);
> 
>         if (err == -EINTR || err == -ENOMEM || err == -EAGAIN ||
>             err == -EBUSY) {
>                 int err1;
> 
>                 /* Re-schedule the LEB for erasure */
>                 err1 = schedule_erase(ubi, e, vol_id, lnum, 0);
>                 if (err1) {
>                         err = err1;
>                         goto out_ro;
>                 }
>                 return err;
>         }
> 
> How about move 'kfree(wl_wrk)' down, and execute
> 
>         __schedule_ubi_work(ubi, wl_wrk)
> 
> inside the 'if' clause instead? The fix would seem to be more elegant
> then.
> 
> Hmm?

Yes, that would work too.
Or we apply "[PATCH 1/2] UBI: Call worker functions without work_sem held". :)

Thanks,
//richard
