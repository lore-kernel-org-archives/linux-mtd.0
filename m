Received: from mailhost.cs.tamu.edu
	([128.194.130.106] helo=cs.tamu.edu ident=0)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fmHx-0001Ts-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 19:29:54 +0000
Date: Mon, 3 Feb 2003 13:29:50 -0600 (CST)
From: Siddharth Choudhuri <choudhri@cs.tamu.edu>
To: Russ Dill <Russ.Dill@asu.edu>
cc: leeyang <leeyang@ycig.com>, <linux-mtd@lists.infradead.org>
In-Reply-To: <1044300428.15823.11.camel@timmy>
Message-ID: <Pine.GSO.4.44.0302031329001.12655-100000@unix.cs.tamu.edu>
MIME-Version: 1.0
Subject: Re: need suggestion about embedded FS plan
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> mount -t jffs2 /dev/mtd2 /etc

Shouldn't this be /dev/mtdblock2 since mtd2 is a char device ?

-siddharth
