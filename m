Received: from py-out-1112.google.com ([64.233.166.183])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fzlqf-0006Xn-GL
	for linux-mtd@lists.infradead.org; Sun, 09 Jul 2006 22:50:27 -0400
Received: by py-out-1112.google.com with SMTP id c31so3813336pyd
	for <linux-mtd@lists.infradead.org>;
	Sun, 09 Jul 2006 19:50:11 -0700 (PDT)
Message-ID: <91b24a870607091950q59a8d316gb3d561fd1bbe88e@mail.gmail.com>
Date: Mon, 10 Jul 2006 10:50:11 +0800
From: "Marteo Tim" <tim.marteo@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: how to use jff2 on UBI layer?
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

I'm interesting in UBI, which is the new flash management layer. I
have also get the newest UBI sources from git.
My question is: how can i use jff2 on UBI layer? In UBI's source, i
can not find block device relating codes. After load UBI module, i
found /dev/ubi0, but it is a char device.
Thanks.

marteo
