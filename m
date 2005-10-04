Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EMozm-0002bx-DC
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 11:46:33 -0400
Message-ID: <4342A3CD.1080006@mw-itcon.de>
Date: Tue, 04 Oct 2005 17:46:21 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <43429D54.5010103@mw-itcon.de> <4342A0FC.3060602@yandex.ru>
In-Reply-To: <4342A0FC.3060602@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Artem B. Bityutskiy wrote:
> Peter Menzebach wrote:
> 
>> The image before sumtool has a size of about 3.7Mb. After sumtool it 
>> has 5,9 Mb
>> Is this "normal"?
> 
> It is perfectly normal if the image becomes larger, but 60% looks too 
> much...
> May be this is the result of small eraseblocks?
> 

You are right. With 64K erasesize it gives about 3,7Mb -> 4.0Mb

Thanks
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
