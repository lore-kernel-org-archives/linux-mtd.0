Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iwcxj-0001zD-Qu
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 12:21:28 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	lAQBnVio002635
	for <linux-mtd@lists.infradead.org>; Mon, 26 Nov 2007 13:49:59 +0200
Message-ID: <474AB1F0.7020109@nokia.com>
Date: Mon, 26 Nov 2007 13:45:52 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
CC: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
References: <47301505.60006@nokia.com>	<002001c8204e$c71577f0$e1ac580a@swcenter.sec.samsung.co.kr>	<47346CE1.5020209@nokia.com>
	<473BFC92.9090504@nokia.com>
In-Reply-To: <473BFC92.9090504@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Adrian Hunter wrote:
> ext Adrian Hunter wrote:
>> ext Kyungmin Park wrote:
>>>> Subject: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
>>>>
>>>> When an ECC error occurs, the read should be completed
>>>> anyway before returning -EBADMSG.  Returning -EBADMSG
>>>> straight away is incorrect.
>>>>
>>>> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>>
>> Please apply :-)
> 
> ...
Please apply
