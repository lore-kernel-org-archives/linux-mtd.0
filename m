Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRswJ-0002wG-LT
	for linux-mtd@lists.infradead.org; Wed, 10 Nov 2004 08:55:12 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 370B5229FF
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Nov 2004 16:54:31 +0300 (MSK)
Message-ID: <41921D97.7040300@oktetlabs.ru>
Date: Wed, 10 Nov 2004 16:54:31 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 & the write buffer patch
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear JFFS2 maintainers,

I was recently fixed the problem with the JFFS2 write buffer races and 
have posted it to the MTD list. Unfortunately, maintainers did not 
comment the patch (only Estelle Hammache kindly responded).

Could any one who has the cvs access rights please commit this patch? If 
the patch is bad, we may discuss how we can change it.

The another possibility is to grant me the CVS access rights and I will 
commit the patch myself.

Thanks in Advance

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
