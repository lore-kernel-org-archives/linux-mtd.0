Received: from bolna.monet.no ([195.139.82.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gMiy-00051t-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 09:47:25 +0100
Received: from starticon (ca88-76.monet.no [195.139.88.76])
	by bolna.monet.no (8.11.6/8.9.1) with SMTP id f8A7ppr25683
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 09:51:51 +0200
Message-ID: <002201c139d7$0c1948a0$c801a8c0@starticon>
Reply-To: "Yunus Shaikh" <yshaikh@start-icon.com>
From: "Yunus Shaikh" <yshaikh@start-icon.com>
To: <linux-mtd@lists.infradead.org>
Subject: Kernel 2.4.0 and Doc2000
Date: Mon, 10 Sep 2001 11:00:31 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hello all

I am a new member to this list. I am using kernel 2.4.0 with the latest
mtd-patch .
initially i mt nftla would not be mounted at all . Thanks to David for help
it finally
started mounting. after removing the erase mark check in nftlmount.c. now my
problem
when i write data in to the doc i get most of the time i get errors like
Error Programming Flash
and also most of the time
Unable to handle kernel NULL Pointer dereference at virtual adress 00000000
and code: Bad EIP value

but the chips work well with m-sys drivers . i cannot upgrade the kernel. as
some patches of
the video card dont work with older kernels PLEASE HELP

Thanks in advance
