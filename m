Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zEpA-0004m9-00
	for <linux-mtd@lists.infradead.org>; Mon, 14 May 2001 10:39:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <004901c0dc57$4b8d97d0$9bca8a89@pcl3af5> 
References: <004901c0dc57$4b8d97d0$9bca8a89@pcl3af5> 
To: "Shoudong Xu" <Shoudong.Xu@cern.ch>
Cc: "MTD" <linux-mtd@lists.infradead.org>
Subject: Re: Can not choose the " Specific CFI Flash geometry selection" opition 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 14 May 2001 10:43:09 +0100
Message-ID: <18477.989833389@redhat.com>
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

ShoudongXu@cern.ch said:
>     I use kernel 2.4.2 and the lastest code ,but can not choose the "
> Specific CFI Flash geometry selection" opition ,please give me some
> advice?

You appear to have enabled a buswidth of 1, but not enabled an interleave 
of 1. This doesn't seem very useful - it's difficult to interleave more 
than one chip into a bus which is a single byte wide.

We should probably do Config.in magic to prevent this. Either that or 
something like...

--- cfi_probe.c	2001/05/10 14:32:09	1.57
+++ cfi_probe.c	2001/05/14 09:42:37
@@ -246,6 +246,9 @@
 int index;
 	switch (map->buswidth) {
 #ifdef CFIDEV_BUSWIDTH_1		
+#ifndef CFIDEV_INTERLEAVE_1
+#error You have asked to support a buswidth of 1, but have not enabled support for having only one chip interleave. How could this possibly work?
+#endif
 	case CFIDEV_BUSWIDTH_1:
 		cfi->interleave = CFIDEV_INTERLEAVE_1;
 		cfi->device_type = CFI_DEVICETYPE_X8;

(PS. Please fix your From address)

--
dwmw2
