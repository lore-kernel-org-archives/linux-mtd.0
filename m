Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUAms-0004QD-S0
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 08:40:31 +0000
Message-ID: <541948E3.3080602@nod.at>
Date: Wed, 17 Sep 2014 10:40:03 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] UBI: Fix possible deadlock in erase_worker()
References: <1410853702-11616-1-git-send-email-richard@nod.at>
 <1410942507.28850.78.camel@sauron.fi.intel.com>
In-Reply-To: <1410942507.28850.78.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Am 17.09.2014 10:28, schrieb Artem Bityutskiy:
> On Tue, 2014-09-16 at 09:48 +0200, Richard Weinberger wrote:
>> If sync_erase() failes with EINTR, ENOMEM, EAGAIN or
>> EBUSY erase_worker() re-schedules the failed work.
>> This will lead to a deadlock because erase_worker() is called
>> with work_sem held in read mode. And schedule_erase() will take
>> this lock again.
> 
> IIRC, the assumption was that the R/W semaphore may be taken in read
> mode many times, so it wouldn't hurt to do:
> 
> down_read()
> down_read()
> up_read()
> up_read()

Hmm, are you sure that this is legal?

Quoting rwsem.h:
/*
 * nested locking. NOTE: rwsems are not allowed to recurse
 * (which occurs if the same task tries to acquire the same
 * lock instance multiple times), but multiple locks of the
 * same lock class might be taken, if the order of the locks
 * is always the same. This ordering rule can be expressed
 * to lockdep via the _nested() APIs, but enumerating the
 * subclasses that are used. (If the nesting relationship is
 * static then another method for expressing nested locking is
 * the explicit definition of lock class keys and the use of
 * lockdep_set_class() at lock initialization time.
 * See Documentation/lockdep-design.txt for more details.)
 */

In this case the same task is taking the same lock multiple times,
which is not allowed according to rwsem.h.

Thanks,
//richard
