Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175N6f-0005mI-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 09:47:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020508113056.A2123@kosh.hut.fi> 
References: <20020508113056.A2123@kosh.hut.fi> 
To: Jarkko Lavinen <jlavi@iki.fi>
Cc: jffs-dev@axis.com, MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 empty file overhead questions 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 May 2002 09:46:48 +0100
Message-ID: <5014.1020847608@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

jlavi@iki.fi said:
>  After creating 25531 the used space had grown to 3312 K. Initially it
> had been 320K. This would suggest the empty file size overhead on
> JFFS2 is (3312 - 320)*1024 / 25531 =  120.00 bytes.

Sounds about right. 

((sizeof(struct jffs2_raw_dirent) + strlen(name) + 3) & ~3)
	+ sizeof(struct jffs2_raw_inode)

Where sizeof(jffs2_raw_dirent) == 40, sizeof(jffs2_raw_inode) == 68.


>  I also tracked the file creation time. This showed linear first
> degree dependence on the number of files created. On that particular
> device empty file creation (file open) time can be presented as a
> function t_c over the number of created files so far: 

That one I can probably settle without seeing a profile -- we look through a
single (but sorted) linked list in jffs2_lookup(). We could consider
optimising that if it's a problem, but I suspect it's not in the real world.

>  After 25519 files I couldn't track space usage with "df" anymore
> because it started to give out of memory message. After 26647 my test
> program couldn't run anymore because of out of memory. Needles to say,
> but my test program doesn't allocate memory nor leave files open when
> it proceeds. 

cat /proc/slabinfo /proc/meminfo /proc/sys/fs/inode-nr

--
dwmw2
