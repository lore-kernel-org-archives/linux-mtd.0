Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EjCGh-0000CQ-BE
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2005 04:04:29 -0500
Message-ID: <4394026C.4010207@yandex.ru>
Date: Mon, 05 Dec 2005 12:03:40 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: alfred hitch <alfred.hitch@gmail.com>
References: <29f916510512012309y59af9f3au455c5323f8ca230e@mail.gmail.com>	<4392F471.3060704@yandex.ru>
	<29f916510512041858j5939e0b2te9d10664c3029dd8@mail.gmail.com>
In-Reply-To: <29f916510512041858j5939e0b2te9d10664c3029dd8@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: file corruption with mtd / jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

alfred hitch wrote:
> Hi,
> 
> we are using snapgear linux distro .. arm linux port kernel 2.4.25-x
> jffs2 version I dont know where to look ?
Look to $Id$ versions in header of wbuf.c, nodelist.c and readinode.c 
please.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
