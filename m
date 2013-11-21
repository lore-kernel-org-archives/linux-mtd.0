Received: from mail-ve0-x22c.google.com ([2607:f8b0:400c:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjY98-0001Ib-D5
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 17:34:30 +0000
Received: by mail-ve0-f172.google.com with SMTP id jw12so50224veb.3
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2013 09:34:08 -0800 (PST)
MIME-Version: 1.0
From: Fernando Silveira <fsilveira@gmail.com>
Date: Thu, 21 Nov 2013 15:33:28 -0200
Message-ID: <CAGZNvdpag-DDUwYKGYaLs17St6P_LRk7EKDtPzuLcsGT324YTw@mail.gmail.com>
Subject: UBI attach, UBIFS mount and blocks writing
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Does a simple UBI attach procedure (e.g. "ubi.mtd=root" at the Linux
cmdline or "ubiattach -m 1") writes something to the flash? What about
a simple read-write mount of a UBIFS partition?

I'm worried about it because my flash has a VERY low limit for
erasing/writing blocks and I'd like to avoid passing read-only
arguments to the "mtdparts" parameter (e.g.
"mtdparts=mynand:8m(boot),-(root)ro") and base only whether I write to
a UBI device or write files to UBIFS partitions in read-write mode.

Regards.

-- 
Fernando Silveira
