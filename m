Received: from ns1ca.ubisoft.qc.ca ([205.205.27.131])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WLqN-0001CT-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 18:49:39 +0100
Received: from srvmail-mtl.ubisoft.qc.ca (srvmail-mtl.ubisoft.qc.ca [205.205.27.194])
	by ns1ca.ubisoft.qc.ca (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA22986
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 14:55:15 -0400
Message-ID: <9A1957CB9FC45A4FA6F35961093ABB8403E3DF63@srvmail-mtl.ubisoft.qc.ca>
From: Patrick Allaire <pallaire@gameloft.com>
To: linux-mtd@lists.infradead.org
Subject: Applying MTD to 2.2.x kernel
Date: Mon, 13 Aug 2001 13:49:22 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi all,

I a Newbie to the world of Flash access drivers. I am having quite a hard
time to path the kernel to support MTD flash driver. I want to use 2.2.19
kernel, but 2.2.18 would also be fine.

I have tried to apply some snapshot of the MTD to kernels 2.2.17 2.2.18
without any success. If I only apply the mtd-2.2.17.patch, I dont have any
problems with patch, but then it wont compile. If I try to add the others
pach to the kernel, I get somes patchings errors. I am alwais using a fresh
downloaded kernel from www.kernel.org, there is not any other patch aplyed
to it.

I have been able to path and compile 2.4.0 kernel, but this is not a kernel
that I can use in my embedded system.

Is there a know snapshot that is suppose to wok on a 2.2.x kernel ?

Before I get tell to search the old message archive, is there a way to do a
search in the archive or I have to go through hte messages month bu month ?

Thank alot for your time.

Patrick Allaire
mailto:pallaire@gameloft.com
If you can see it, but it's not there, it's virtual. 
If you can't see it, but it is there, it's hidden. 
It you can't see it and it isn't there, it's gone.
