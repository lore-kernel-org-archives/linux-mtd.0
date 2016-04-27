Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avSOv-0007rx-8o
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 16:33:21 +0000
Received: by mail-pf0-x233.google.com with SMTP id n1so24632607pfn.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 09:33:00 -0700 (PDT)
Date: Wed, 27 Apr 2016 10:32:51 -0600
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at
Subject: Re: [RFC] Porting kernel MTD tests to user space
Message-ID: <20160427163251.GA6425@localhost>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <CAAEAJfDQvN46HdqWAHVY+xk+=Y-Cs_LapN1kBC14CH=WObEK8A@mail.gmail.com>
 <571F1206.9020506@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571F1206.9020506@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 26, 2016 at 09:00:22AM +0200, Richard Weinberger wrote:
> Am 26.04.2016 um 05:13 schrieb Ezequiel Garcia:
> > The autoconf patch looked also great, but for some reason it
> > stalled, so... what do we need to do to prevent this one from stalling as well?
> > 
> 
> Please give it testing/review. :-)
> Regarding my autoconf patch, IIRC nobody clearly stated whether the change
> is welcomed or not.

I reviewed it and noted a few missing pieces. But I was generally happy
with it, IIRC.

> But I can happily revive it.

Brian
