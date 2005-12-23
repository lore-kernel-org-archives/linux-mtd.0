Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EpiRB-0005nf-43
	for linux-mtd@lists.infradead.org; Fri, 23 Dec 2005 03:38:11 -0500
Message-ID: <43ABB749.40709@yandex.ru>
Date: Fri, 23 Dec 2005 11:37:29 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
References: <20051223072659.11150.qmail@web26305.mail.ukl.yahoo.com>
In-Reply-To: <20051223072659.11150.qmail@web26305.mail.ukl.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 doesn't detect end of space on flash device instead breaks
 kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sreecharan Sivadevuni wrote:
 > Hello,
 >       The JFFS2 on my flash doesnot report back to me
 > end of space on my flash, instead I get a kernel oops
 > message and sometimes the kernel hangs. This is when I
 > am trying to copy a file which is of larger size than
 > there is space on device.
Hmm, looks like a bug.

Could you please enable JFFS2 debugging and send the output?
Which kernel? Which JFFS2? Try the latest please.

Thanks.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
