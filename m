Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CN2X4-0006vw-2G
	for linux-mtd@lists.infradead.org; Thu, 28 Oct 2004 01:09:07 -0400
Received: by wproxy.gmail.com with SMTP id 50so712573wri
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2004 22:09:04 -0700 (PDT)
Message-ID: <b4618e0f04102722097014430f@mail.gmail.com>
Date: Thu, 28 Oct 2004 10:39:03 +0530
From: bandwidthcrunch <bandwidthcrunch@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <b4618e0f041027220032c8a576@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <b4618e0f041027220032c8a576@mail.gmail.com>
Subject: Re: jffs2 and 2.4.19
Reply-To: bandwidthcrunch <bandwidthcrunch@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gotcha , copying the mtd/include/linux/jffs2 and jffs2_fs_sb.h to
linux/include/linux solved it :)


On Thu, 28 Oct 2004 10:30:28 +0530, bandwidthcrunch
<bandwidthcrunch@gmail.com> wrote:
> Hi all,
>        I have been trying to integrate a Jul 31  2002 snapshot of mtd
> into the 2.4.19 kernel but end up having
> file.c: In function `jffs2_fsync':
> file.c:33: structure has no member named `wbuf'
> file.c:33: structure has no member named `wbuf_len'
> 
> Now i have in the earlier
> http://mhonarc.axis.se/jffs-dev/msg01282.html mail which says this
> happens due to CONFIG_JFFS2_FS being enabled in the kernel .
> But removing this is like disabling jffs2 support in the kernel ( yeah
> it builds the/fs/jffs2 modules ) . Isnt there a solution to this ?Any
> comments welcome
> 
> regards,
> Band
>
