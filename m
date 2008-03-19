Received: from wx-out-0506.google.com ([66.249.82.234])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JbpFQ-0007ln-Vk
	for linux-mtd@lists.infradead.org; Wed, 19 Mar 2008 03:45:53 +0000
Received: by wx-out-0506.google.com with SMTP id s7so224193wxc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Mar 2008 20:45:51 -0700 (PDT)
Message-ID: <79ac09b60803182045i376f78deh289c6ee5d49d06ec@mail.gmail.com>
Date: Tue, 18 Mar 2008 21:45:51 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: JFFS2 filesystem integrity issue
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,
I have a system that uses a touchscreen I use tslib to handle events.
The tslib calibration sits on a mtd block that is a JFFS2 file system.
For quite a while the systems would be operational and would be so for
months. However, at times it would appear to lose the calibration and
I was baffled by this since the file could not be changed. Rerunning
the calibration solved the calibration issue but I struggled to
determine what the problem is. After a while it seems not to do with
anything file related but the filesystem it sits on. For some reason
it either seem to read the file incorrectly or the file is corrupt
some how. When this happens I don't loose the calibration altogether
but it is intermittent and sporadic at times.
Has anyone seen something similar? Does the cause seem realistic? Has
anyone had a possible corruption like this?
Any thoughts would be much appreciated.

Thank you.
D.
