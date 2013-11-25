Received: from mail.innofidei.com ([203.86.34.34])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vkl07-0002aH-Gc
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 01:30:13 +0000
Received: from [172.19.232.47] by innofidei.com (Cipher TLSv1:-SHA:128)
 (MDaemon PRO v12.5.3) with ESMTP id md50000637239.msg
 for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2013 09:29:19 +0800
Message-ID: <5292A7E7.5060003@innofidei.com>
Date: Mon, 25 Nov 2013 09:29:11 +0800
From: Hans Zhang <zhanghonghui@innofidei.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
References: <1385024065-29965-1-git-send-email-zhanghonghui@innofidei.com>
 <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
 <528EB1E3.7030101@innofidei.com> <20131122015237.GB3509@localhost>
 <528EBD0B.5010006@innofidei.com> <20131122114509.GB2414@localhost>
In-Reply-To: <20131122114509.GB2414@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 zhouguangming@innofidei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2013/11/22 19:45, Ezequiel Garcia wrote:
>> Thanks for your reply.
>> This is for my embed system upgrade, I reserved one nand partition for filesystem
>> environment which will load to DDR while uboot booting.
>> This filesystem.uboot file should be able to read both by uboot and kernel, and
>> maybe written by uboot and kernel. There will be no filesystems upon the nand in
>> case the loader may not support some filesystem types while uboot booting.
>>
>> Seems that the trimmed environment of OS has get rid of the mtd-tools, So the dd
>> command was the most convenience tools to use by hand.
>>
> I still don't understand why are you using mtdblock. Why can't you write
> through the char device?

Well, yes, write through the char device would be a solution.
I think that maybe it's an optional approach through mtdblock in case we do not have
the mtd-tools in our environments, we do provider a simpler way to write the NAND
through mtdblock.

“This E-mail and its attachments may contain legally privileged or confidential information from Innofidei Corporation. Any unauthorized copy, use, disclosure or distribution of this information is strictly prohibited. If you are not the intended recipient, please notify the sender immediately by E-mail or telephone and delete this E-mail and all its attachments immediately.
本邮件及其附件内容可能包含创毅公司享有专有法律权利的或者需要保密的信息。严禁任何人未经发件人许可以任何形式复制、使用、披露或者散发此项信息。如果您不是该收件人，请您立即通过邮件或者电话通知发件人并立即删除本邮件及其附件内容.”
