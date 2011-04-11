Received: from na3sys009aog111.obsmtp.com ([74.125.149.205])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9GPZ-0005La-Vf
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 12:40:10 +0000
Received: by mail-vx0-f174.google.com with SMTP id 39so5496562vxi.5
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 05:40:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
References: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
Date: Mon, 11 Apr 2011 08:40:07 -0400
Message-ID: <BANLkTim5z+PV4J8LpzN4xjK1j5UTzLqytg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Retry Large Buffer Allocations
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Grant Erickson <marathon96@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Grant, Artem,

Thanks for this fix (again) :)

On Fri, Apr 8, 2011 at 11:51 AM, Grant Erickson <marathon96@gmail.com> wrot=
e:
> When handling user space read or write requests via mtd_{read,write}
> or JFFS2 medium scan requests, the operations can fail because the
> code backing these operations frequently requests large (128 KiB),
> contiguous blocks of memory using kmalloc.
>
> Under low-memory or highly-fragmented situations, particularly on
> embedded systems with no swap store, these allocations will frequently
> fail with -ENOMEM.
>
> This patch series adds a common function to handle these allocation
> requests in both the MTD driver and JFFS2 file system by exponentially
> backing off on the size of the requested kernel transfer buffer until
> it succeeds or until the requested transfer buffer size falls below
> the page size.
>
> This helps ensure the operation can succeed under low-memory,
> highly-fragmented situations albeit somewhat more slowly.
>
> =A0v2: Incorporated coding style and comment feedback from Artem.
> =A0v3: Incorporated more feedback from Artem. Retargeted patch against
> =A0 =A0 =A0l2-mtd-2.6.
> =A0v4: Incorporated feedback from Artem about compilation on 64-bit
> =A0 =A0 =A0architectures.
> =A0v5: Split the patch into a series.
>
> Signed-off-by: Grant Erickson <marathon96@gmail.com>

I tested this on da850evm by cherry-picking commits:

8fa3c20 JFFS2: retry large buffer allocations
88ab142 mtd: mtdchar: retry large buffer allocations
99815a5 mtd: create function to perform large allocations

from
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

I have a memory hole @32M (bootargs: mem=3D32M@0xc0000000
mem=3D64M@0xc4000000) and I was also (like Bastian) getting "ubiformat:
page allocation failure" errors.  Cherry-picking these commits fixed the
problem for me; I was able to do 3x repeated ubiformats without error.

Tested-by: Ben Gardiner <bengardiner@nanometrics.ca>

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
