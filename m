Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DQQTa-0004mA-8m
	for linux-mtd@lists.infradead.org; Tue, 26 Apr 2005 09:51:49 -0400
Message-ID: <426E4745.5050606@oktetlabs.ru>
Date: Tue, 26 Apr 2005 17:51:01 +0400
From: "Artem B. Bityuckiy" <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Zoltan Sogor <weth@inf.u-szeged.hu>
References: <loom.20050413T142519-107@post.gmane.org>	<425E3174.4030308@inf.u-szeged.hu>	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>	<loom.20050420T165531-253@post.gmane.org>	<4267B8EF.6000803@inf.u-szeged.hu>
	<1114097490.21485.1.camel@sauron.oktetlabs.ru>
	<426E439A.2050301@inf.u-szeged.hu>
In-Reply-To: <426E439A.2050301@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Zoltan,

> Read:
> If you want to read an inode then the kernel calls jffs2_do_read_inode()
> to get the inode.
But if I don't want? There are thousands of inodes and I don't have to 
read them all. What then? Will GC move dirt along with valid data? Will 
I see fewer free space then there is actually present? I suppose yes and 
this is incorrect.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
