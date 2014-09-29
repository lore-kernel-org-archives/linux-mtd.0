Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYjLj-0003Vu-MS
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 22:23:20 +0000
Message-ID: <5429DBC0.1010801@nod.at>
Date: Tue, 30 Sep 2014 00:22:56 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/3] UBI: Fix possible deadlock in erase_worker()
References: <1411375536-20067-1-git-send-email-richard@nod.at>	
 <1411375536-20067-3-git-send-email-richard@nod.at>
 <1411728032.23429.63.camel@sauron.fi.intel.com>
In-Reply-To: <1411728032.23429.63.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.09.2014 12:40, schrieb Artem Bityutskiy:
> On Mon, 2014-09-22 at 10:45 +0200, Richard Weinberger wrote:
>> If sync_erase() fails with EINTR, ENOMEM, EAGAIN or
>> EBUSY erase_worker() re-schedules the failed work.
>> This will lead to a deadlock because erase_worker() is called
>> with work_sem held in read mode. And schedule_erase() will take
>> this lock again.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Did you manage to test it?
> 
> Why no -stable this time? Not that important, or just something
> theoretical and you never actually hit this bug?

It is something theoretical, I was only able to trigger it by injecting
ENOMEM by hand.

Thanks,
//richard
