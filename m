Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RtLJX-0003kY-65
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 15:44:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 5/8] mtd: docg3: initialize writebufsize
References: <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
 <4fe90e9a0ba750bbdb34d04ca3437b493a19277f.1328257053.git.artem.bityutskiy@linux.intel.com>
 <31119f54134de4f631ae48a6941d773450000e98.1328257053.git.artem.bityutskiy@linux.intel.com>
Date: Fri, 03 Feb 2012 16:44:25 +0100
In-Reply-To: <31119f54134de4f631ae48a6941d773450000e98.1328257053.git.artem.bityutskiy@linux.intel.com>
 (Artem Bityutskiy's message of "Fri, 3 Feb 2012 10:43:11 +0200")
Message-ID: <87ipjn53c6.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> The writebufsize concept was introduce by commit
> "0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
> the maximum amount of data the device writes to the media at a time. This is
> an important parameter for UBIFS which is used during recovery and which
> basically defines how big a corruption caused by a power cut can be.
>
> Set it to be equivalent to mtd->writesize because this is the maximum amount
> of data the driver writes at a time.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

-- 
Robert
