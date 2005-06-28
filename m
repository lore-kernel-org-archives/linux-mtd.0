Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dn9rf-0006MB-KM
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 02:46:36 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: zhao <forrest.zhao@intel.com>
In-Reply-To: <42C0EBC6.6090106@intel.com>
References: <42C0EBC6.6090106@intel.com>
Content-Type: text/plain
Date: Tue, 28 Jun 2005 10:45:59 +0400
Message-Id: <1119941159.16978.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: Question about JFFS2 testing
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-06-28 at 14:18 +0800, zhao wrote:
> Hi, David
> 
> We are going to do some test for JFF2 in kernel 2.4.31.
> But the problem we met is that we can't find an ARM board
> to run the latest 2.4 kernel. We can only find a board, which
> can run 2.4.18. Do you have any experience to run 2.4.31 on
> an ARM board? Or how did you test the JFFS2?
> 
> We noticed the RAM and block device emulation ways, but
> it's better if we could do the test based on the real flash memory.
> 
If you've got have no board, you may run your tests on a PC host on top
of a Flash simulator, either mtdram (NOR) or nandsim(NAND).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
