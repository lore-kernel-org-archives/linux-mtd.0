Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bf37-0003FD-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 11:25:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01c201c23c69$7995faa0$1b0448c0@gv.com.tw> 
References: <01c201c23c69$7995faa0$1b0448c0@gv.com.tw>  <00bc01c239cf$4ef3a8c0$1b0448c0@gv.com.tw> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> <0H04006C5M7GUI@smtp-out.bhp.t-online.de> <00f801c2390a$d956dd40$1b0448c0@gv.com.tw> <0H05001Y6RM950@smtp-out.bhp.t-online.de> <001001c23957$3a290520$1b0448c0@gv.com.tw> <28541.1028541296@redhat.com> 
To: "??" <kevin@gv.com.tw>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org,
    "? ??" <djh@gv.com.tw>, cms@gv.com.tw
Subject: Re: error when writing to jffs2 (scan.c v1.79 20020725) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 11:25:13 +0100
Message-ID: <31970.1028543113@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

kevin@gv.com.tw said:
> scan.c v 1.79 20020725

OK, then I don't know -- could you get full logs with 
CONFIG_JFFS2_FS_DEBUG=1 from mounting the file system to the oops? Make 
sure you are logging over a serial console so you catch _all_ the messages, 
and remember they're at level KERN_DEBUG so echo 9 > /proc/sys/kernel/printk



--
dwmw2
