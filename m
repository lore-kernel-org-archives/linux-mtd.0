Received: from msr21.hinet.net ([168.95.4.121] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YVFJ-0001TL-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 17:53:05 +0000
Received: from ms11.hinet.net (61-228-122-141.HINET-IP.hinet.net [61.228.122.141])
	by msr.hinet.net (8.9.3/8.9.3) with ESMTP id CAA10338
	for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2003 02:23:56 +0800 (CST)
Message-ID: <3E2455BE.1010301@ms11.hinet.net>
Date: Wed, 15 Jan 2003 02:23:58 +0800
From: Steve Tsai <startec@ms11.hinet.net>
MIME-Version: 1.0
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Display Unchecked space...
References: <000201c2bb7e$ff1e89a0$80d1a8c0@synso.com.tw> <14587.1042556118@passion.cambridge.redhat.com>
In-Reply-To: <14587.1042556118@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I will try it. Thanks.

Steve Tsai

David Woodhouse wrote:

>startec@ms11.hinet.net said:
>  
>
>>kernel BUG at gc.c:136! Checked all inodes but still 0x6a0 bytes of
>>unchecked space?
>>    
>>
>
>We think this is fixed. cvs up and try again.
>
>--
>dwmw2
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>  
>
