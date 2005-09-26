Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoaK-0004Fr-C7
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 04:43:58 -0400
Message-ID: <4337B49B.4000904@yandex.ru>
Date: Mon, 26 Sep 2005 12:43:07 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
References: <4337A604.6050204@cetrtapot.si> <4337AE41.3040807@yandex.ru>
	<4337B241.3090300@cetrtapot.si>
In-Reply-To: <4337B241.3090300@cetrtapot.si>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: fragtree method?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hinko.kocevar@cetrtapot.si wrote:
> Artem B. Bityutskiy wrote:
> Thank you for prompt answer. We were aware of the slow-mount-feature of 
> JFFS2 but your explaination cleared some stuff for us though.
Note, you should enable EBS (eraseblock summary) to mount faster. My 
patch speeds up the checker.

Well, to be more understandable, JFFS2 mount consists of 2 phases:
1. Scan
2. Checking

During the first phase JFFS2 FS is unaccessable. During the second 
phase, it may be read, but writers are blocked until the checking is 
done (checking works in context of the GC tread and only - once just 
after mount). The main "show-stopping" phase is the scanning. EBS 
improves scanning - enable it. My patch improves the second phase and it 
will work by itself as it is already committed.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
