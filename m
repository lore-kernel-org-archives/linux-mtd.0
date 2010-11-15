Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PI4a3-0003ej-IY
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2010 19:19:22 +0000
Received: by eyd9 with SMTP id 9so3052958eyd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2010 11:18:56 -0800 (PST)
Sender: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 15 Nov 2010 22:18:51 +0300
From: Vasiliy Kulikov <segoon@openwall.com>
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-ID: <20101115191851.GA6450@albatros>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
	<20101114202905.GA21614@bicker> <20101115143735.GA4548@albatros>
	<20101115184531.GA24643@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20101115184531.GA24643@bicker>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 15, 2010 at 21:45 +0300, Dan Carpenter wrote:
> On Mon, Nov 15, 2010 at 05:37:37PM +0300, Vasiliy Kulikov wrote:
> > 
> > x86_64, linux-next:
> > 
> > make -C /home/vasya/linux fs/jffs2/xattr.o
> > make: Вход в каталог `/home/vasya/dev/linux-next'
>         ^^^^^^^^^^^^^^
> 
> This means "Entering directory" right?  So /home/vasya/linux is a
> symlink to /home/vasya/dev/linux-next.  It still compiles for me
> when I create a symlink and use the -C option...

Correct, but the same with cd ~linux/ && make fs/jffs2/xattr.o.

I've just updated to next-2010111 and it became compilable ;)
linux next is just very nonstable...

Thanks,

-- 
Vasiliy
