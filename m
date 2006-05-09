Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FdRb0-0006cE-49
	for linux-mtd@lists.infradead.org; Tue, 09 May 2006 08:45:49 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 9C43D47287
	for <linux-mtd@lists.infradead.org>;
	Tue,  9 May 2006 16:45:06 +0400 (MSD)
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 09 May 2006 16:45:06 +0400
Message-Id: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH/RFC] reserved pool
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

long time I was asked to solve a problem when users eat all the file
system free space and the system cannot boot because different programs
can't write any longer (-ENOSPC). I made a straight-forward patch and it
solved the problem.

I've adapted the patch to the newest JFFS2 and it is available here:

http://git.infradead.org/?p=users/dedekind/dedekind-mtd-2.6.git;a=commit;h=848824f86e755a4fbcf2052085b0c1a8e3e8c583

Do you have any suggestions how to better solve this problem? Objections
to let this solution go mainstream (after clean-ups/changes)?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
