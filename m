Received: from msgbas1x.net.europe.agilent.com ([192.25.19.109])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3jYq-0002AF-G9
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 22:30:52 +0000
Message-ID: <4058D3A2.50500@agilent.com>
Date: Wed, 17 Mar 2004 14:39:30 -0800
From: Shawn Jin <xiaogeng_jin@agilent.com>
MIME-Version: 1.0
To: dkey <dk.dbox2@gmx.net>
References: <200403172051.22120.dk.dbox2@gmx.net>
In-Reply-To: <200403172051.22120.dk.dbox2@gmx.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Erasebug on AMD flashes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dkey wrote:

>> we are using jffs2 on the dbox2 and AMD flash chips, but since rev. 1.96 of
> cfi_cmdset_0002.c we can't erase the flashes. rev. 1.94 works without
> problems.
> here are some debug infos, tell me if you need more!
> 
> when we want to erase the flashes with MEMERASE ioctl, we get these errors:
> 
> 
> Erase at 0x00080000 failed immediately: errno -5
> MTD do_erase_oneblock(): flash internal timeout
FYI.
I guess you have chips interleaved, right? I have the same problem with 
erase and even worse since write doesn't work for me either. According 
to David Vrabel, it may be broken when chips are interleaved.

-Regards,
Shawn.
