Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMooo-0002Ik-Ut
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 11:35:15 -0400
Message-ID: <4342A0FC.3060602@yandex.ru>
Date: Tue, 04 Oct 2005 19:34:20 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <43429D54.5010103@mw-itcon.de>
In-Reply-To: <43429D54.5010103@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: size of ebs enabled image much bigger than original
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:
> The image before sumtool has a size of about 3.7Mb. After sumtool it has 
> 5,9 Mb
> Is this "normal"?
It is perfectly normal if the image becomes larger, but 60% looks too 
much...
May be this is the result of small eraseblocks?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
