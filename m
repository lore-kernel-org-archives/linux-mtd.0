Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWnDp-0006VP-Rv
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 09:16:46 +0000
Subject: Re: Performance effect of mounting jffs2 via mtdblock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wuertele <dave+gmane@wuertele.com>
In-Reply-To: <loom.20100623T212106-800@post.gmane.org>
References: <loom.20100623T212106-800@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Jul 2010 12:11:52 +0300
Message-ID: <1278580312.12733.75.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-23 at 19:26 +0000, David Wuertele wrote:
> Reading http://www.linux-mtd.infradead.org/faq/jffs2.html, it says that jffs2
> can be mounted with or without the mtdblock driver.  Eg:
> 
>   mount -t jffs2 mtd2 /foo 
> vs
>   mount -t jffs2 /dev/mtdblock2 /foo
> 
> I'm wondering what is the difference between these two methods with respect to
> performance?

There is no difference.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
