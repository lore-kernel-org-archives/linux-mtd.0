Received: from canuck.infradead.org ([2001:8b0:10b:4::1])
	by pentafluge.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ3qW-0000Wd-Bn
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 10:31:10 +0100
Received: from mailbox.radixs.com ([203.81.41.217])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DZ3qS-0006Lp-OG
	for linux-mtd@lists.infradead.org; Fri, 20 May 2005 05:31:06 -0400
From: Munira Ahmed <munira.ahmed@radixs.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Fri, 20 May 2005 17:31:00 +0800
Message-Id: <1116581460.18096.142.camel@server11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: mtd drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Can anybody give me a good reference on how exactly kernel implements
mtd drivers?

I want to know more practical issues rather than theoretical ones. I
can't really find answers to my questions easily on the net. All I find
is some basics on the mtd

What I would like to know is

1) Which module in the kernel decides whether to call jedec_probe or
cfi_probe

2)which module exactly calls cfi probe 

3) how exactly is control transferred to an appropraite driver?

4) What if a driver supports a particular chip only partially?

5) Is there a flowchart that will help me understand where and when
kernel makes all this decisions.

6) how do I get a list of all the chips supported in a  given version of
the kernel?

Munira
