Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kTQ7-0002El-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 18:49:27 +0100
Message-ID: <3D6E5FE0.2020600@redswitch.com>
Date: Thu, 29 Aug 2002 10:54:40 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-rmk7 + CVS jffs2 ld error (zlib)
References: <3D6E2A8D.4000502@goepel.com> <24260.1030630287@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

> http://ftp.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib/linux-2.4.19-pre10-shared-zlib.gz 

Is this patch suitable for 2.4.4? The compilation errror is that 
linux/completion.h couldn't be found.

Thanks,

- Shawn.
