Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEY4u-00059Y-EB
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 14:33:13 -0500
Date: Thu, 24 Mar 2005 19:32:51 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050324T182625-656@post.gmane.org>
Message-ID: <Pine.LNX.4.58.0503241932390.15561@phoenix.infradead.org>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com>
	<loom.20050323T212715-407@post.gmane.org> <4242925F.D29BC7CE@st.com>
	<42429C1C.8050600@yandex.ru> <loom.20050324T182625-656@post.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Artem, when figuring out if the write goes over the page boudary you did 
not say
> anything about CRC and other non-user data.. Should it be taken into 
account
> too or am I missing something?
>

Well, page boundaries aren't problem. We want a write operation which goes 
to flash a one node.

There are two points of splitting:
1. Linux page cache splits data on PAGE_SIZE chunks.
2. jffs2_write_inode_range may do further split. This is what I missed 
first time.

Yes, jffs2_write_inode_range will not split if the node to write is fewer 
then sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN.

So, sizeof(struct jffs2_raw_inode) includes all the "anything about CRC 
and other non-user data" and you may write JFFS2_MIN_DATA_LEN bytes 
atomically.

So, I'll write the rules again:
1. write only 0- JFFS2_MIN_DATA_LEN bytes;
2. do not overlap n*PAGE_SIZE borders (n is 1,2, ...)
3. do fsync after write

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
