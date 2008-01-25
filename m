Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JIKZl-0000Ip-4W
	for linux-mtd@lists.infradead.org; Fri, 25 Jan 2008 09:10:23 +0000
Message-ID: <4799A5AF.9090800@nokia.com>
Date: Fri, 25 Jan 2008 11:02:39 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] [MTD] [OneNAND] Do not release chip twice
References: <47989DC8.5090201@nokia.com>
	<004b01c85ee2$6f78b2a0$1fa9580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <004b01c85ee2$6f78b2a0$1fa9580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: kmpark@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
>> From: Adrian Hunter <ext-adrian.hunter@nokia.com>
>> Date: Thu, 24 Jan 2008 12:48:37 +0200
>> Subject: [MTD] [OneNAND] Do not release chip twice
>>
>> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Ack-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> 

David please apply because the OneNAND driver is broken without this patch
