Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DzBHK-0006kr-06
	for linux-mtd@lists.infradead.org; Sun, 31 Jul 2005 06:42:56 -0400
Received: from sauron.oktetlabs.ru (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 5BB75228CB
	for <linux-mtd@lists.infradead.org>;
	Sun, 31 Jul 2005 14:42:11 +0400 (MSD)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <9185a3fa050729193514dd5f8@mail.gmail.com>
References: <9185a3fa050729193514dd5f8@mail.gmail.com>
Content-Type: text/plain
Date: Sun, 31 Jul 2005 14:42:10 +0400
Message-Id: <1122806531.16052.19.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: mkfs issue
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-07-30 at 11:35 +0900, Amit Sharma wrote:
> 1. what is the purpose of block size option -e
Obviously, the size of the eraseblock of your flash.

> 2. This problem based on my two host PC 
> if i use option -d /home/jffs2stuff  i found my file size is zero on
> my one Host PC
> but on other setup i found file size 13310 always ,what is this problem .
No idea ...

> 3. If i create file of more than 1.3MB Jffs2 response degraded during
> ls-la and using of benchmarking.
That's the property of JFFS2. Take a quick glimpse at http://www.linux-
mtd.infradead.org/tech/JFFS3design/node2.html.

> I am using linux 2.4 kernel .do you think i should upgrade my jffs2
> for 2.4 kernel from cvs.
If you want some support from the MTD folks, use 2.6 or 2.4.27+ kernels.

Glance at http://www.linux-mtd.infradead.org/source.html#kernelversions

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
