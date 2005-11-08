Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZUhw-0004Th-9c
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 09:44:31 -0500
Message-ID: <4370B9A3.2000809@yandex.ru>
Date: Tue, 08 Nov 2005 17:43:47 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <4370AA55.6060703@gmail.com>
In-Reply-To: <4370AA55.6060703@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: How to produce dirty space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernhard Priewasser wrote:
> Hi all,
> 
> I want to generate some dirty space in a mounted JFFS2 for test 
> purposes. I tried to get the FS dirty for hours now... but I couldn't 
> compete against the erase_pending list. (BTW: how is kupdated set up?)
> Maybe... I'm not the first one who wants to do some tests on a dirty FS, 
> perhaps there is some existing code... :-)

Create a file and make a small change in it. It is unlikely that the 
corresponding eraseblock will be garbage collected soon, so you'll have 
dirty space.

For the information when things are flushed see "/proc/sys/vm - the 
virtual memory subsystem" at Documentation/filesystems/proc.txt.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
