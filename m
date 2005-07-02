Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DoguZ-0007Xw-G9
	for linux-mtd@lists.infradead.org; Sat, 02 Jul 2005 08:15:56 -0400
Message-ID: <42C68545.9060706@yandex.ru>
Date: Sat, 02 Jul 2005 16:15:01 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: rick@efn.org
References: <E1DoVv7-0004wL-00@amazonia.client.comcast.net>
In-Reply-To: <E1DoVv7-0004wL-00@amazonia.client.comcast.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: endless loop in wbuf.c?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rick Bronson wrote:
> Hi,
> 
>   I seem to encounter an endless loop in wbuf.c starting at:
> 
Hi,

you didn't write the version of Linux/MTD you're using. It's important 
because I fixed one endless GC thread loop problem recently. Please, try 
a fresh MTD snapshot (download it from CVS). If it won't help - come back.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
