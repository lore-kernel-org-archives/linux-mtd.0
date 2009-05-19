Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M6NaM-0004xa-Q2
	for linux-mtd@lists.infradead.org; Tue, 19 May 2009 11:34:25 +0000
Received: by yw-out-1718.google.com with SMTP id 9so2394684ywk.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 19 May 2009 04:34:17 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 19 May 2009 20:34:17 +0900
Message-ID: <2014bcab0905190434r687de23ued2af901636cd16c@mail.gmail.com>
Subject: a suspected data race in /driver/mtd/ubi/build.c
From: =?EUC-KR?B?yKu9xSBzaGluIGhvbmc=?= <hongshin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi. I am reporting a susptected data race bug at
ubi_attach_mtd_dev() in /driver/mtd/ubi/build.c .

This function creates a kernel thread by calling
kthread_create(ubi_thread, ubi .. ). and then
it assigns ubi->thread_enabled = 1.

However, ubi_thread() also reads ubi->thread_enabled.
This may cause data race since the execution results
would be differ depending on the scheduling.

I think, ubi_attach_mtd_dev() should be modified to protect
the writing aceess to ubi->thread_enabled
by spin_lock(&ubi->wl_lock).

But I do not have much background on the code.
So please check this code and let me know your opinions.
Thanks.

Sincerely
Shin Hong
