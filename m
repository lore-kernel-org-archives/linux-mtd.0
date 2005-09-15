Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFpB5-0001e4-RD
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 04:33:29 -0400
Message-ID: <432931C9.5090907@mw-itcon.de>
Date: Thu, 15 Sep 2005 10:33:13 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>	<4329251C.7050102@mw-itcon.de>	<43292A8B.4020707@yandex.ru>
	<43292E94.4020702@mw-itcon.de> <4329302A.4010300@yandex.ru>
In-Reply-To: <4329302A.4010300@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
> Peter Menzebach wrote:
> 
>> The chance is not too high  ;)  .
>>
>> I have done some further search...
>> Here one other patch for fix and the other is only for better look...
>>
>> Now I will do a little test again...
>>
> Oh, but you said JFFS2 worked with your dataflash for ages? How could it?
> 
Andrew Victor have had some patches for fix, and I worked with this old 
version since last week: http://maxim.org.za/AT91RM9200/

He committed his changes to the mtd cvs at the beginning of this year.
And I now have upgraded to 2.6.13, and found some problems in the recent 
version.

Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
