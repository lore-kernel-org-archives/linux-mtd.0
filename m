Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CcONG-0008L8-EO
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 08:30:31 -0500
Message-ID: <41B8534E.7090105@yandex.ru>
Date: Thu, 09 Dec 2004 16:29:50 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
References: <1102598324.21453.20.camel@squizzey.bult.co.uk>
In-Reply-To: <1102598324.21453.20.camel@squizzey.bult.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: problems with "JFFS2 write speed"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Did you try disable compression? Which compression mode do you use 
(size, priority) ?

Gareth Bult (Encryptec) wrote:
> Hi,
> 
> I'm using JFFS2 on a USB key. (using mtdblock)
> 
> Works well, read speed is blinding ..
> 
> If I use ext2, the write speed is measured in Mb/sec ..
> Using jffs2 it's 29k / sec ..
> 
> Running Linux 2.6.9 ..
> 
> Anyone got any ideas re; speedups ?
> 
> tia
> Gareth.
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
