Received: from web52701.mail.yahoo.com ([206.190.39.152])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCR3M-0002rE-OJ
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 19:06:38 -0400
Message-ID: <20040928230635.29472.qmail@web52701.mail.yahoo.com>
Date: Tue, 28 Sep 2004 16:06:35 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: beatit@hotmail.com, linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <4153D79C.8080606@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: Re: Data CRC failed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Wangfeng Ai <beatit@hotmail.com> wrote:

> hi, list
> 
> I have merged mtd-snapshot-20040919 with jffs2 into my
> kernel-2.4.20. I 
> use jffs2 as root filesystem, mounted read-write. But when I create
> and 
> remove some files(dirs), and then reboot, jffs2 complains something
> like 
> the following:
> jffs2_get_inode_nodes(): Data CRC failed on node at 0x01aa0b3c:
> Read 
> 0x14932849,
>   calculated 0xae8acdd4 
> 
...
> It seems that more files created and removed, more messages like
> that 
> come out.
> 
> Is that minor? Or something is going wrong? Any comments please?
> 

Hi.
I think a quick search will give you the answer you need.
(Basically, don't worry about it.)  I also get these all the time.

I think it's more connected to when you power off your machine.

Mike
