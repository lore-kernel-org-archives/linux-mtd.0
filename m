Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxP9K-0006yb-TW
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 09:07:47 -0400
Message-ID: <42E6355C.4010700@yandex.ru>
Date: Tue, 26 Jul 2005 17:06:36 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>
	<42E634D0.6090300@inf.u-szeged.hu>
In-Reply-To: <42E634D0.6090300@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> Martin, you may should try our Centralizes Summary (CS) patch. It stores
> every relevant memory representation at umount time, so at mount (if the
> previous unmount was a clean one) you need only to read it without any
> scanning and rebuilding.
> 
> It is downloadable from our web site
> (http://www.inf.u-szeged.hu/jffs2/mount.php). I recommend the variant
> which stores reference information on the first erase block.
> 
Err, isn't your patch about speeding up scanning, not checking?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
