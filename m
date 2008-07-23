Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLeYt-0004pn-LV
	for linux-mtd@lists.infradead.org; Wed, 23 Jul 2008 13:39:24 +0000
Message-ID: <48873492.1060106@nokia.com>
Date: Wed, 23 Jul 2008 16:39:30 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext halli manju <hallimanju@hotmail.com>
Subject: Re: fs-test tool
References: <BLU118-W120748AC13BBB9374BF7FFD2840@phx.gbl>
In-Reply-To: <BLU118-W120748AC13BBB9374BF7FFD2840@phx.gbl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

halli manju wrote:
> Hello All,
> I have to test the working of the NAND driver on a omap board, i came to know that their is a test tool "fs-test" to test the driver, can u please tell me from where can i get the tool and how to use the tool cos am very new to this.
> 
> Regards
> Manjunatha


There are file system tests in mtd-utils which is available here:

git://git.infradead.org/mtd-utils.git



There is also a popular file system stress program fsstress which is
part of Linux Test Project http://ltp.sourceforge.net/



There are also some simple kernel modules for testing NAND directly
here:

git://git.infradead.org/users/ahunter/nand-tests.git
