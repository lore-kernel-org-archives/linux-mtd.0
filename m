Received: from mail-ve0-x229.google.com ([2607:f8b0:400c:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgIvh-0007PT-LP
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 18:43:14 +0000
Received: by mail-ve0-f169.google.com with SMTP id pa12so2196378veb.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 10:42:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1383822296.2722.186.camel@sauron.fi.intel.com>
References: <CAGZNvdqt=1K4cd4xLu+2k9KpUa5U_Hu0w1xi_aCwOn7pXiRVBg@mail.gmail.com>
 <1383822296.2722.186.camel@sauron.fi.intel.com>
From: Fernando Silveira <fsilveira@gmail.com>
Date: Tue, 12 Nov 2013 16:42:11 -0200
Message-ID: <CAGZNvdqLb50U9JHG8Voouug0Oqqb27-N0Lkvrbt-r-0xXgkm1g@mail.gmail.com>
Subject: Re: Bad blocks while attaching UBIFS
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 7, 2013 at 9:04 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>>   2. If yes, what might be wrong with my driver?
>
> Does it handle short reads properly? Please, run mtd tests to validate
> your driver.

There is a bug in the error detection algorithm within my driver/flash
controller and I'm debugging it to fix the problem.

In the mean time I'd like to know if a simple UBI attach procedure
(e.g. "ubi.mtd=root" at the Linux cmdline) writes anything to the
flash or not. And what about a read-only mount of a UBIFS partition?
Does it write anything?

I'm worried about it because my flash has a VERY low limit for
erasing/writing blocks and I'd like to avoid passing read-only
arguments to the "mtdparts" parameter (e.g.
"mtdparts=mynand:8m(boot),-(root)ro") and base only whether I write to
/dev/ubiX or mount the UBIFS partitions in read-write mode.

Regards.

-- 
Fernando Silveira
