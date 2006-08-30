Received: from mail.imc-berlin.de ([217.110.46.186])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GIRcr-0004WY-Tu
	for linux-mtd@lists.infradead.org; Wed, 30 Aug 2006 16:05:12 +0100
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id BB2622F028
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Aug 2006 17:58:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id AAEA0AA9B
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Aug 2006 17:04:36 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id CA8D3AA6E
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Aug 2006 17:04:35 +0200 (CEST)
Message-ID: <44F5A903.1050104@imc-berlin.de>
Date: Wed, 30 Aug 2006 17:04:35 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Subject: Re: PM for physmap.c ?
References: <44EC6F2F.7070508@imc-berlin.de>
	<20060830140421.GK19179@xi.wantstofly.org>
In-Reply-To: <20060830140421.GK19179@xi.wantstofly.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Lennert,

>> for quite some time physmap.c uses platform_{device,driver}.
>>
>> I wonder why it does not contain any (generic) code for power management
>> yet, i.e. .suspend/.resume functions.
>>
>> Is it correct that all I would need to survive a suspend/resume cycle is
>> something like
>>
>> int physmap_flash_suspend(struct platform_device *dev, pm_message_t state)
>> {
>> 	struct sa_info *info = platform_get_drvdata(dev);
>> 	int ret = 0;
>> 	if (info)
>> 		ret = info->mtd->suspend(info->mtd);
>> 	return ret;
>> }
>>
>> int physmap_flash_resume(struct platform_device *dev)
>> {
>> 	struct sa_info *info = platform_get_drvdata(dev);
>> 	if (info)
>> 		info->mtd->resume(info->mtd);
>> 	return 0;
>> }
>>
>> as stolen from sa1100-flash.c?
> 
> Looks OK to me, but that doesn't say much.

;-) Thanks for your reply anyway. Thought I am getting ignored for asking
stupid things...

However could one of the MTD gurus please state on the following:
- Would the above be enough?
- Is it needed at all? For normal NOR flash (that's what physmap.c is for?).
- What could happen without proper PM handling?
- Is it worth it to provide a proper patch?

Thanks a million!

--
Steven
