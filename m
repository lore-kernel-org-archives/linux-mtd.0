Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EoJeD-0002EX-U7
	for linux-mtd@lists.infradead.org; Mon, 19 Dec 2005 06:57:50 -0500
Message-ID: <43A6A014.40809@yandex.ru>
Date: Mon, 19 Dec 2005 14:57:08 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY113-F234AEF9342BB5E683064AE83A0@phx.gbl>
In-Reply-To: <BAY113-F234AEF9342BB5E683064AE83A0@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: A question about frag merge in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> What will happen for the following case in JFFS2?
> 1 A process write small frags to flash through JFFS2,
> for example the frag length is 15 bytes.
> 2 after some time, when GC is triggered, how merge operation
> proceed? Will GC merge as many frags as possible?

It will merge as many frags as it is needed to form a 4K (pristine)
frag. In case of 15 byte frags it is 4K/15 (+1) frags.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
