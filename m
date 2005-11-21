Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EeDpU-0007vG-FD
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 15:43:41 +0000
Message-ID: <4381EAE2.2010207@yandex.ru>
Date: Mon, 21 Nov 2005 18:42:26 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <435CB911.4060005@gmail.com> <435D0A05.5090508@yandex.ru>
	<4381E625.1060402@gmail.com>
In-Reply-To: <4381E625.1060402@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: malloc.c:100: error: dereferencing pointer to incomplete type
 /	dbg_memalloc()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernhard Priewasser wrote:
> It's there again... in MTD CVS 2005-11-21.
> If you can't reproduce it, perhaps we have screwed something. But it's 
> reproducible here.

Could you please double-check this? I've just compiled JFFS2 with 
DBGLVL=2 and saw only one warning, no errors.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
