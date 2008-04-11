Received: from wx-out-0506.google.com ([66.249.82.236])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JkD3s-0001bn-F9
	for linux-mtd@lists.infradead.org; Fri, 11 Apr 2008 06:48:36 +0000
Received: by wx-out-0506.google.com with SMTP id s7so378378wxc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Apr 2008 23:48:33 -0700 (PDT)
Message-ID: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
Date: Fri, 11 Apr 2008 14:48:33 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Is there possible to integrate mtd ubi ubifs latest version in one
	git tree?
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

Hi,
    Is there possible to integrate mtd ubi ubifs latest version in one git tree?
    If the answer is no, will ubifs give patches for porting it to old
linux kernel? The patches only contain the ubifs needed file.
    I know little about kernel, just git clone the whole
ubifs-v2.6.24, I found there is a lot of differences between the
original linux-2.6.24.3 and ubifs-v2.6.24. I doulbt all the
linux/kernel ....or linux/mm files' change are all necessary for UBIFS
to run correctly, or just some of them.
     Will you give me some suggestion?


--
Best wishes,
Nancy
