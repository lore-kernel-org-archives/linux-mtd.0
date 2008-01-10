Received: from mail.semihalf.com ([83.15.139.206])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JCtbs-00039q-B9
	for linux-mtd@lists.infradead.org; Thu, 10 Jan 2008 09:22:06 +0000
Received: from localhost (unknown [127.0.0.1])
	by mail.semihalf.com (Postfix) with ESMTP id 801CA14576
	for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jan 2008 10:27:56 +0100 (CET)
Received: from mail.semihalf.com ([127.0.0.1])
	by localhost (mail.semihalf.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18549-04 for <linux-mtd@lists.infradead.org>;
	Thu, 10 Jan 2008 10:27:53 +0100 (CET)
Message-ID: <4785E372.9010409@semihalf.com>
Date: Thu, 10 Jan 2008 10:20:50 +0100
From: Bartlomiej Sieka <tur@semihalf.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][MTD] Fix incorrect interface code for x16/x32 chips
References: <20071126175517.GA1221@frozen.semihalf.com>
	<4755E020.4070702@semihalf.com>
In-Reply-To: <4755E020.4070702@semihalf.com>
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

Bartlomiej Sieka wrote:
> Bartlomiej Sieka wrote:
>> According to "Common Flash Memory Interface Publication 100" dated 
>> December 1, 2001, the interface code for x16/x32 chips is 0x0005, 
>> and not 0x0004 used so far.
>> 
>> Signed-off-by: Bartlomiej Sieka <tur@semihalf.com>
> 
> I'd appreciate some feedback on the status of this patch.

Hmm, it's been over a month now since the patch has been posted, and
there haven't been any comments, acceptance/rejection notices, etc. Is
this a wrong list to post this patch? Did I miss some formal requirement
or something? Are people just too busy?

Regards,
Bartlomiej
