Received: from mika.eatserver.nl ([2001:67c:28fc:195:20:9:75:0])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtFNM-0000D2-DS
 for linux-mtd@lists.infradead.org; Thu, 10 Jan 2013 10:28:48 +0000
Message-ID: <50EE97D5.5060906@aimvalley.nl>
Date: Thu, 10 Jan 2013 11:28:37 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Bosi Daniele <Daniele.Bosi@mta.it>
Subject: Re: UBI corruption on a NOR flash
References: <BE7AFD5DB9EB17418CAAAEEA76697290190E878AA7@mta-mail.MTA.INT>
In-Reply-To: <BE7AFD5DB9EB17418CAAAEEA76697290190E878AA7@mta-mail.MTA.INT>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/09/13 14:43, Bosi Daniele wrote:
> Hello List,
> we are working on an embedded device running on Linux 2.6.24.6.
> We had some devices returned from the field with corrupted UBI partitions on a NOR flash.
> The corruption was probably caused by a power cut, but we aren't sure about the root cause of the failure.
>
> We found a similar issue in an old thread from the mailing list where Artem said that UBI on NOR could have some bugs that can lead to such a failure (http://lists.infradead.org/pipermail/linux-mtd/2009-May/025737.html), but no final statements was given on that thread.
>
> Any help would be appreciated, thank you.
>


I believe the final statement of the referred thread was that one
of the problems was UBI/UBIFS assumes a (CFI) write buffer size of
8 bytes. This is often not the case with NOR flash. It did not lead
to kernel patches though.

Lateron this problem was found (again) by Anatolij Gustschin
(see the thread "UBIFS partition on NOR flash not mountable after power cut test"
from december 2010) and he fixed it properly. His patches ended up in the mainline.

Btw. it could be your problem is another or a related ubi/ubifs NOR flash power
cut problem. Some other problem have been found and solved as well (mostly by Artem
and Anatolij).

If you update to the ubi/ubifs backported linux-2.6.32 (this is the oldest one
still available) which can be found here:
http://git.infradead.org/users/dedekind/ubifs-v2.6.32.git
you'll probably be fine.

hth,
Norbert van Bolhuis
