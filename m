Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYsTM-0003b5-M5
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 08:07:49 +0000
Message-ID: <542A64BB.7060904@nod.at>
Date: Tue, 30 Sep 2014 10:07:23 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
Subject: Re: [PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
 shutdown
References: <1412029248-22454-1-git-send-email-richard@nod.at>		
 <1412029248-22454-2-git-send-email-richard@nod.at>	
 <1412058366.23429.77.camel@sauron.fi.intel.com> <542A548A.7040308@nod.at>
 <1412063620.2379.12.camel@sauron.fi.intel.com>
In-Reply-To: <1412063620.2379.12.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.09.2014 09:53, schrieb Bityutskiy, Artem:
> On Tue, 2014-09-30 at 08:58 +0200, Richard Weinberger wrote:
>> Am 30.09.2014 08:26, schrieb Artem Bityutskiy:
>>> On Tue, 2014-09-30 at 00:20 +0200, Richard Weinberger wrote:
>>>> ...otherwise the deferred work might run after datastructures
>>>> got freed and corrupt memory.
>>>
>>> How can this happend? The background thread is stopped by this time
>>> already, so what are the other possibilities? And why is this
>>> fastmap-only?
>>
>> This has nothing do to with the background thread.
>> Fastmap has a work queue. If one fastmap work has been
>> scheuled we have to wait for it.
> 
> I expected a bit more explanation. But OK, here is what I think.
> 
> UBI consists of subsystems. Subsystems try to be more or less
> independent, whenever possible. They expose interface functions for
> other subsystems. Of course the split is not ideal, but we do our best.
> 
> * wl.c does wear-levelling.
> * wl.c does not do fastmap.
> * fastmap.c does fastmap.
> * I am unhappy seeing yet another ifdef to wl.c

I can warp it.

> * I am unhappy seeing wl.c calling 'flush_work(&ubi->fm_work)', because
> fastmap.c should deal with 'fm_work'. Or said differently, wl.c is not a
> fastmap queue baby-sitter. fastmap.c is.

But wl.c has to trigger the deferred fastmap work as only wl.c detects when it is
needed. I you want I can implement a ubi_fastmap_shutdown() in fastmap.c which
calls flush_work().
But I did it in wl.c to have it balanced. wl.c triggers and stops the fastmap work.

> Most UB subsystems have the init and close function. May be adding one
> for fastmap would help? Then you could flush whatever from
> 'ubi_wl_close()' ?
> 
> Historically the work queue was implemented in wl.c because wl.c was the
> only user of it.

What work queue are you talking about?
The fastmap work queue was added by me and has nothing to do with the UBI background
worker thread.

> If this layout is not good enough, we should probably extend it, may be
> separate work queue management out of wl.c.

One thing I can think of is getting completely rid of the UBI background thread
and convert it to a work queue. But I'm not sure if this would make things easier
for fastmap.

> But populating wl.c with macros and little "take care of this fatmap
> bit" stuff is a not going to lead to better code structure.

s/fatmap/fastmap. A Freudian slip? ;)

I spent already a full week on refactoring that code. My goal was
making ubi_update_fastmap() callable from within the wear_leveling_worker() to get
rid of the fastmap work queue completely.
After one week the new code was more complicated and ugly than the current one. :-\

Some background info:
Fastmap needs to create a snapshot of the UBI state.
This is why you cannot call it within an UBI work. As UBI works can run in parallel.
The fastmap creation does many things which can sleep. Most stuff in the wear_leveling_worker()
happens in atmoic context.

Thanks,
//richard
