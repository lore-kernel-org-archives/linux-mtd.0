Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GiXgC-0006PP-DY
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 09:48:33 -0500
Received: by ug-out-1314.google.com with SMTP id m2so537736uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Nov 2006 06:48:25 -0800 (PST)
Message-ID: <6d6a94c50611100648g87770a0qb723fad11fa65cd8@mail.gmail.com>
Date: Fri, 10 Nov 2006 22:48:25 +0800
From: Aubrey <aubreylee@gmail.com>
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
Subject: Re: mount costs too long
In-Reply-To: <1163159781.19697.24.camel@crusty.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
	<1163159781.19697.24.camel@crusty.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/10/06, Josh Boyer <jwboyer@linux.vnet.ibm.com> wrote:
> On Fri, 2006-11-10 at 15:05 +0800, Aubrey wrote:
> > Hi all,
> >
> > I wrote a mtd-nand driver and enabled it with YAFFS on 2.6.18.
> > When I mount the mtd partition of a large page nand chip, everything works fine.
> > But When I replace the large page nand chip with a small page nand
> > chip,everything works ok except mount costs about 8 seconds. It's too
> > long, I think.
>
> You might try asking on the YAFFS mailing list.  I'm not sure why
> changing to a smaller chip would vary the mount time.
>
I got a clue from YAFFS mailing list, this is a known issue on 2.6.18 kernels.
It is caused by the MTD layer rework and corresponding yaffs-mtd layer
modifications. Namely, an additional translation had to be implemented
for OOB area for 512b page chips.

But I'm not sure what should be changed to fix this issue. Now I'm
using the newest yaffs, should I upgrade mtd in the kernel to the
newest version? ( The kernel I'm using is 2.6.18).

Thanks,
-Aubrey
