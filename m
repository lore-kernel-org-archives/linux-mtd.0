Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIPtJ-00041X-4y
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 08:09:41 -0400
Message-ID: <43329ED5.7070909@yandex.ru>
Date: Thu, 22 Sep 2005 16:08:53 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F11A5B6E921FA39088B715BE8970@phx.gbl>
In-Reply-To: <BAY17-F11A5B6E921FA39088B715BE8970@phx.gbl>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Adding eraseblock header support(revised version)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:
> Your comments for the revised patch are welcome :)

It is supposed that you eliminated cleanmarkers completely, right?
Why then I still see functions like jffs2_check_nand_cleanmarker()?
-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
