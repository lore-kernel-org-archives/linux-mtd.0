Received: from fk-out-0910.google.com ([209.85.128.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KIK4p-00010d-RB
	for linux-mtd@lists.infradead.org; Mon, 14 Jul 2008 09:10:36 +0000
Received: by fk-out-0910.google.com with SMTP id 18so2658304fks.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jul 2008 02:10:34 -0700 (PDT)
Message-ID: <71413c850807132338q38849e5egd49631295f3105f3@mail.gmail.com>
Date: Mon, 14 Jul 2008 15:38:04 +0900
From: "Qiang Wang" <rurality.linux@gmail.com>
Sender: rurality.wq@gmail.com
To: linux-mtd@lists.infradead.org
Subject: About mkfs.jffs2
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

hello, everyone

I use mkfs,jffs2 tools to make my jffs2 filesystem.
I found that it apply some compress logic, result the data is compressed.
How can I remove the compressing function from the tools?

my command is as below:
./mkfs.jffs2 -r fs -o root.jffs2 -e 0x20000 -s 0x20000 -l -p

thanks very much

best regards,
wangqiang
