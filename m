Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.61 #1 (Red Hat Linux))
	id 1FVokm-0007lN-AG
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 07:52:39 -0400
Message-ID: <4444D2D3.9020606@yandex.ru>
Date: Tue, 18 Apr 2006 15:51:47 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <4444C8FD.1070406@inf.u-szeged.hu> <4444D18E.80104@yandex.ru>
In-Reply-To: <4444D18E.80104@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> if ((inode->i_size >> PAGE_CACHE_SHIFT) >= pg->index) {
>     /*
>      * This is the last page, so unconditionally re-write it fully.
>      */
>     start = 0;
> }
> 
Oh, actually

if ((inode->i_size >> PAGE_CACHE_SHIFT) == pg->index)

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
