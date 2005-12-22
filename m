Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EpTut-0005OK-Al
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2005 12:07:55 -0500
Message-ID: <43AADD42.8080708@yandex.ru>
Date: Thu, 22 Dec 2005 20:07:14 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <twig.1135265899.51714@cdac.in> <43AAD478.4050205@yandex.ru>
	<625fc13d0512220902t5031dcb8w5a0af9c6f75c90bf@mail.gmail.com>
In-Reply-To: <625fc13d0512220902t5031dcb8w5a0af9c6f75c90bf@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nikhil <nikhils@cdac.in>
Subject: Re: CLEANMARKER!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> It's an optimization of mkfs.jffs2.  If it didn't write those
> cleanmarkers in the image, JFFS2 would scan flash, find free
> eraseblocks, and go erase them again since the cleanmarker is missing.
>  With the cleanmarkers there, the erase of already erased blocks is
> omitted.
Well, this is for empty eraseblocks. Those with data could be devoid of 
cleanmarkers.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
