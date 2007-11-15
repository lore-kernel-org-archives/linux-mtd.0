Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IsZiH-0002K0-DU
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 03:04:43 -0500
Message-ID: <473BFC92.9090504@nokia.com>
Date: Thu, 15 Nov 2007 10:00:18 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
References: <47301505.60006@nokia.com>	<002001c8204e$c71577f0$e1ac580a@swcenter.sec.samsung.co.kr>
	<47346CE1.5020209@nokia.com>
In-Reply-To: <47346CE1.5020209@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Adrian Hunter wrote:
> ext Kyungmin Park wrote:
>>> Subject: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
>>>
>>> When an ECC error occurs, the read should be completed
>>> anyway before returning -EBADMSG.  Returning -EBADMSG
>>> straight away is incorrect.
>>>
>>> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>
> 
> Please apply :-)

...
