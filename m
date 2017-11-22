Received: from mail-it0-x233.google.com ([2607:f8b0:4001:c0b::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eHWhz-0000Fl-TV
 for linux-mtd@lists.infradead.org; Wed, 22 Nov 2017 15:13:06 +0000
Received: by mail-it0-x233.google.com with SMTP id b5so6620192itc.3
 for <linux-mtd@lists.infradead.org>; Wed, 22 Nov 2017 07:12:43 -0800 (PST)
MIME-Version: 1.0
From: Frank Mori Hess <fmh6jj@gmail.com>
Date: Wed, 22 Nov 2017 10:12:41 -0500
Message-ID: <CAJz5OpfXTXzvVZxmCC1+R1AU6qqHaGoH-KJKWd_Fixt2EgAJSw@mail.gmail.com>
Subject: Jffs2: systemd-journald fails to open log files on jffs2
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I have systemd-journald spewing EINVAL errors on a 4.1.33 kernel
when it tries to
open persistent journal files on jffs2, for example:

systemd-journald[766]: Failed to open system journal: Invalid argument

I traced this back to a failing mmap call which was attempting to do a
writable mmap with MAP_SHARED.  Are there any plans for jffs2 to
support such mappings, or is the answer just to dump jffs2 and move on
to ubifs?

-- 
Frank
