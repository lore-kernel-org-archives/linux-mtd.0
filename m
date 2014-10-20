Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgF62-0001fX-85
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 15:42:10 +0000
Message-ID: <1413819635.7906.369.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 20 Oct 2014 18:40:35 +0300
In-Reply-To: <544527A3.7030508@nod.at>
References: <1412029248-22454-1-git-send-email-richard@nod.at>
 <1412029248-22454-4-git-send-email-richard@nod.at>
 <1412346676.3795.62.camel@sauron.fi.intel.com>
 <542EF3BF.1070401@nod.at>			 <1413206263.7906.18.camel@sauron.fi.intel.com>
 <543BE21F.5020504@nod.at>		 <1413213803.7906.45.camel@sauron.fi.intel.com>
 <543C3E60.4080507@nod.at>	 <1413282203.7906.72.camel@sauron.fi.intel.com>
 <543F9895.7010502@nod.at> <1413816389.7906.336.camel@sauron.fi.intel.com>
 <544527A3.7030508@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Mon, 2014-10-20 at 17:17 +0200, Richard Weinberger wrote:
> > That's just fastmap code not doing the right thing. We should not touch
> > the work queue directly at all. What we _should_ do instead is to make
> > it empty by asking the subsystem which manages it to flush it.
> > 
> > 1. Lock the work queue to prevent anyone from submitting new jobs while
> > we are in process of writing the fastmap.
> > 2. Flush all works
> > 3. do all the fastmap write stuff
> > 4. Unlock
> 
> Are you sure? Flushing all works before every fastmap write will slow UBI down.
> The fastmap write is not cheap. The goal should be to make it faster.

Yes, you are right. So instead, we wanna "freeze" it, and save all PEBs
the jobs in fastmap too.

Why 'ubi_write_fastmap()' only cares about the erase jobs, and saves the
PEBs from the job as "must be erased".

What about the "move" jobs?

Also, say, PEB X is in the work queue waiting for erasure. Fastmap comes
along and saves it as "must be erased" in the fastmap. Fastmap finishes
its job, PEB X gets erased, and I write my data there, so PEB X is
referred to by LEB Y. Now I have power cut. Then I attach the flash
again. Surely it is not that fastmap just erases PEB X and I lose the
contents of LEB Y?
