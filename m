Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1IqUnw-0004wS-Uy
	for linux-mtd@lists.infradead.org; Fri, 09 Nov 2007 09:25:59 -0500
Message-ID: <47346CE1.5020209@nokia.com>
Date: Fri, 09 Nov 2007 16:21:21 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
References: <47301505.60006@nokia.com>
	<002001c8204e$c71577f0$e1ac580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <002001c8204e$c71577f0$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
>> Subject: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
>>
>> When an ECC error occurs, the read should be completed
>> anyway before returning -EBADMSG.  Returning -EBADMSG
>> straight away is incorrect.
>>
>> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> 

Please apply :-)
