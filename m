Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOWQz-0005k0-C7
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 03:49:14 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050420T165531-253@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<425E3174.4030308@inf.u-szeged.hu>
	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
	<loom.20050420T165531-253@post.gmane.org>
Content-Type: text/plain
Date: Thu, 21 Apr 2005 11:48:43 +0400
Message-Id: <1114069723.32582.34.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei Sharonov wrote:
> What exactly can I do after mount returns: ls is blocked, write is
blocked..

ls mustn't not blocked in theory.

Again shortly:

* ls needs iget() of the ls-ed directory inode and of all its parent
inodes.
* ls -l is ls + iget() of all L1 children inodes of the ls-ed directory.
* iget() is slow for large files like your 200MiB 
* iget() is slow for large directories (i.e., tere are a lot of L1
direntries)
* just after mount JFFS2 performs checking
* checking = fake iget() of all the filesystem inodes; fake means iget()
without actually going to the Linux Inode Cache;
* GC cant proceed while checking is in progress;
* reads may proceed;

If you have one 200MiB file then just after mount:
* jffs2 starts checking fs, you must see it typing 'top';
* ls must be quick;
* ls -l needs iget() and will do iget() of your large file.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
