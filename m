Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DM0RU-0002o5-PG
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 05:15:21 -0400
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 4E2B82F016
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2005 11:15:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 414ED118D6
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2005 11:15:22 +0200 (CEST)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 741D7A125
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Apr 2005 11:15:21 +0200 (CEST)
Message-ID: <425E34A9.1090103@imc-berlin.de>
Date: Thu, 14 Apr 2005 11:15:21 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42232855.3020408@imc-berlin.de> <4226FBCB.5020007@inf.u-szeged.hu>
In-Reply-To: <4226FBCB.5020007@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: SUMMARY for JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:

> Steven Scholz wrote:
> 
>> IIUC then the SUMMARY stuff goes into JFFS3.
>> But are there any plans to officially include it into the JFFS2 code?
>>
>> It's quite cumbersome to update MTD CVS and then merge the patch 
>> http://www.inf.u-szeged.hu/jffs2/jffs2-summary-20050211.patch by hand.
>>
>> Since its a compile time option is there anything speaking against 
>> such inclusion?
> 
> 
> If David (dwmw2) says yes, we are ready to commit. Due to Steven's and 
> some other people testing I think now it is stable.

David?
Are you going to say yes?
Or will summary for JFFS2 stay a seperate patch forever?

-- 
Steven
