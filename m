Received: from ipmail02.adl6.internode.on.net ([203.16.214.140])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NG4oT-0007wD-IL
	for linux-mtd@lists.infradead.org; Thu, 03 Dec 2009 06:05:22 +0000
Received: from [192.168.14.33] ([192.168.14.33])
	(authenticated user iwo@call-direct.com.au)
	by mail.call-direct.com.au (Kerio MailServer 6.7.0)
	for linux-mtd@lists.infradead.org; Thu, 3 Dec 2009 16:58:55 +1100
Message-ID: <4B17550A.7010409@call-direct.com.au>
Date: Thu, 03 Dec 2009 17:04:58 +1100
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Looks like a UBIFS bug... - Solved
References: <4B173CEB.5050103@call-direct.com.au>
	<4B173FC4.5020901@call-direct.com.au>
In-Reply-To: <4B173FC4.5020901@call-direct.com.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iwo Mergler wrote:
> Iwo Mergler wrote:
>> Hi all,
>>
>> I've got some weird UBIFS-related behaviour. I'd welcome
>> any suggestions.
>>

Turns out that the same script that was erasing the partition,
creating ubifs, etc. was invoked a second time in the background.

I can't blame UBIFS for not surviving some random FLASH erasure
during operation. :-)

Sorry about the noise.

Iwo
