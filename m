Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DD4HO-0005id-CF
	for linux-mtd@lists.infradead.org; Sun, 20 Mar 2005 12:31:59 -0500
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id C994A22B01
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Mar 2005 20:31:26 +0300 (MSK)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1111339103.21772.3.camel@sauron.oktetlabs.ru>
References: <1111339103.21772.3.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Sun, 20 Mar 2005 20:31:26 +0300
Message-Id: <1111339886.21905.1.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] delete root inode's ino_cache
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry,

On Sun, 2005-03-20 at 20:18 +0300, Artem B. Bityuckiy wrote:
> here is the test which doen't let JFFS2 to delete the root inode's
s/test which doen't/patch which doesn't/

> is removed, its nlink shouldn't be zero. For the root inode it isn't
s/shouldn't/should/

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
