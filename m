Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV06d-0008Gi-Ah
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 15:28:19 +0000
Message-ID: <1411140449.28850.152.camel@sauron.fi.intel.com>
Subject: Re: Does UBI LEB-level access interlock happily with UBIfs access?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 19 Sep 2014 18:27:29 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-16 at 10:04 -0400, Atlant Schmidt wrote:
> Folks:
> 
>   We use the ordinary MTD/UBI/UBIfs stack on our
>   Embedded Linux system.
> 
>   For the purposes of scrubbing-out single bit errors,
>   I'd like to read through all of the LEBs stored in the
>   UBI device and whenever the ECC information indicates
>   that any correctable errors occurred, I'd like to
>   *RE-WRITE* that LEB (thereby forcing it to be scrubbed).
>   (Note: I might do this page-by-page rather than LEB-
>   by-LEB.)

Well, you may do something like

dd if=/dev/ubiX_Y of=/dev/null

For all volumes, and this will make UBI real all pages from all volumes
and whenever there was a bit-flip, schedule the LEB for scrubbing.

The volume table LEBs wont'd be read, though. To cover even that, you
one could introduce a special ioctl.

In case of fastmap, this ioctl would cover all the fatmap special LEBs
too.

>   But I would expect that because I'd have a hard
>   (impossible?) time doing an atomic read/re-write of a
>   LEB (or page), the UBIfs and my scrubber would interact
>   badly with my scrubber eventually corrupting the UBIfs
>   file system. Is there any easy way to interlock these
>   accesses (from the UBIfs and from my UBI-level scrubber)?
>   A way to temporarily suspend activity from the UBIfs?
> 
>   One kludge that might work is that I'm operating in a
>   real-time environment. If I made my scrubbing requests
>   from a very high priority (higher than the "System"
>   tasks that run around Priority 50), could I be sure
>   my read + rewrite scrubbing requests would at least
>   enter the UBI's work queue immediately adjacent to
>   each other (and without UBIfs requests intermingled)?
> 
>   Alternatively, I could probably dismount the UBIfs
>   before doing scrubbing, but I'd rather not have to
>   do that.

You do not need to do unmount anything with the above technique. If,
say, UBI scheduled an LEB 0:1 (volume 0, LEB 1) for scrubbing, and UBIFS
(which has volume 0 mounted) writes to LEB 1, UBI will block the writer
until the scrubbing finishes, so you do not have to worry.

HTH.

-- 
Best Regards,
Artem Bityutskiy
