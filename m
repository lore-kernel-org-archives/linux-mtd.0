Received: from nz-out-0506.google.com ([64.233.162.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HofuG-0001e4-8e
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 09:20:37 -0400
Received: by nz-out-0506.google.com with SMTP id i11so895899nzi
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 May 2007 06:20:35 -0700 (PDT)
Message-ID: <93840d070705170620x4a61007ap537ce877acfab488@mail.gmail.com>
Date: Thu, 17 May 2007 18:50:34 +0530
From: "Sekhar Nori" <nori.sekhar@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Priority inversion when using MTD
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

I have a high priority SCHED_FIFO task which runs out of a squashfs file system.
When this process needs to fetch a page from the flash (due to demand paging),
it is sometimes made to wait for another low priority SCHED_NORMAL
task which is doing an erase on some other mtd partition.

This helps other middle priority processes have a free run causing a
priority inversion issue.

The get_chip function in cfi_cmdset_0001.c uses a per chip wait queue
for all processes which need to wait for chip access.

Is there any way to avoid this scenario? Any help/pointers would be appreciated.

Thanks,
Sekhar Nori.
