Received: from dns01.mail.yahoo.co.jp ([211.14.15.204])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Mr2T-0004TV-2I
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 16:15:57 +0100
Message-ID: <002901c32919$ddc37000$570486da@w0a3t0>
From: "matsunaga" <matsunaga_kazuhisa@yahoo.co.jp>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	"David Woodhouse" <dwmw2@infradead.org>
References: <20030530144959.GA4736@wohnheim.fh-wedel.de>
Date: Tue, 3 Jun 2003 00:15:56 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] 1/2 central workspace for zlib
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The following creates a central workspace per cpu for the zlib.  The
> original idea was to save memory for embedded, but this should also
> improve performance for smp.

Hi

Thank you for the patch.
It definitely reduces resources and improve multiple CPU scalability. 

But I still would like to stick to performance.
(Though I haven't evaluated the performance yet...)
So far I think MTD is used mostly on Embedded device, 
in which single CPU which is not so powerful is used.

How is the following code (it is ugly though)?

static void default_workspace[WSIZE];

<snip>

    size = MAX(sizeof(struct inflate_workspace),
        sizeof(struct deflate_workspace));

    if(WSIZE < size)
        BUG();

    zlib_workspace[0] = default_workspace;

    for (i=1; i<smp_num_cpus; i++) {
        zlib_workspace[i] = vmalloc(size);
        if (!zlib_workspace[i]) {
            zlib_exit();
            return -ENOMEM;
        }
   }

P.S.
There is another vmalloc in mtdblock_open()...;-)
