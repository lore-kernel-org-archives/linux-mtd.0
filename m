Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EpTKf-0004eN-WB
	for linux-mtd@lists.infradead.org; Thu, 22 Dec 2005 11:30:24 -0500
Message-ID: <43AAD478.4050205@yandex.ru>
Date: Thu, 22 Dec 2005 19:29:44 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Nikhil <nikhils@cdac.in>
References: <twig.1135265899.51714@cdac.in>
In-Reply-To: <twig.1135265899.51714@cdac.in>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CLEANMARKER!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nikhil wrote:
> hi all,
> 
> I am a bit confused regarding the cleanmarker stuff in JFFS2. I understand
> that cleanmarker is written to the eraseblock immediately after a
> successfull erase, which indicates that the block is empty and can be used
> for writes.
Right.

> Is there any other situation when the cleanmarker has to be added at the
> beginning of the eraseblock?
No, only after erase.

> jffs2dump of an image shows the presence of cleanmarker at the beginning
> of all the eraseblocks (even if the block contains some valid data). why
> is there a need to write cleanmarker in each erase block while creating
> image using mkfs.jffs2?
There is no real need. mkfs.jffs2 just implemented that way. It just 
tries to be the same as if the same image would be created by means of 
copying files t oa mounted JFFS2, then dumping /dev/mtdX...

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
