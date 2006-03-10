Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FHjmO-0007mi-PS
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 10:43:56 -0500
Message-ID: <44119E8F.1000504@yandex.ru>
Date: Fri, 10 Mar 2006 18:43:11 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>	<Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
	<625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
In-Reply-To: <625fc13d0603100735o37c96bcfl78b213eab41b5e54@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>,
	Adam Ward <adamward2005@yahoo.co.uk>
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> Also, does your JFFS2 filesystem have free space available?  If a
> minimum amount of free eraseblocks are not present, JFFS2 will mark
> itself as read-only no matter what you do.
> 
Hmm, is this sane behaviour?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
