Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVVy1-0004qm-AF
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 22:15:57 +0000
Received: by lagu2 with SMTP id u2so1451142lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2011 14:15:55 -0800 (PST)
Subject: Re: [UBI] Missing scrub when there is a bit-flip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bhavesh Parekh <bparekh@nvidia.com>
Date: Wed, 30 Nov 2011 00:15:46 +0200
In-Reply-To: <6F5E0EB93579CE4A99BFB2D6A9D015057D9CA89078@BGMAIL01.nvidia.com>
References: <6F5E0EB93579CE4A99BFB2D6A9D015057D9CA89078@BGMAIL01.nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322604953.2150.24.camel@koala>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, good catch!

On Wed, 2011-11-23 at 18:58 +0530, Bhavesh Parekh wrote:
... snip ...
> When we used leb_write_lock instead of leb_write_trylock() then we are
> seeing matching erase-call for the bit-flips.
> 
> So, we are currently thinking 2 possible approaches to fix this:
> 1. Use leb_write_lock instead of leb_write_trylock(), but
> leb_write_trylock was used to avoid contention. Will adding back will
> have side-effect ?

Yeah, there is a big comment which explains that this can cause a
dead-lock, so you cannot use leb_write_lock().

> 2. Add the leb again in the scrubbing list for scrubbing. There is
> already code for the same in the implementation, (in out_not_moved
> case where scrubbed=1 if condition),  but since we have set protect=1
> we won't go in this condition.   We are thinking to return two
> different error code from the eba_copy_leb base for two different
> cases in the function (one where volume is removed and another is
> contention).  And only in case of contention set scrubbing=1 and call
> goto out_not_moved which will add this LEB for scrubbing again.

Yes, this sounds reasonable, introduce a separate return code, like
MOVE_RETRY. Please go ahead and send a patch.

Thanks!
