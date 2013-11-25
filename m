Received: from mail.wi-flare.com ([203.86.34.34] helo=mail.innofidei.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VkuQn-0003tQ-L9
 for linux-mtd@lists.infradead.org; Mon, 25 Nov 2013 11:34:23 +0000
Received: from [172.19.232.47] by innofidei.com (Cipher TLSv1:-SHA:128)
 (MDaemon PRO v12.5.3) with ESMTP id md50000640250.msg
 for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2013 19:30:35 +0800
Message-ID: <529334D9.2030204@innofidei.com>
Date: Mon, 25 Nov 2013 19:30:33 +0800
From: Hans Zhang <zhanghonghui@innofidei.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
References: <1385024065-29965-1-git-send-email-zhanghonghui@innofidei.com>
 <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
 <528EB1E3.7030101@innofidei.com> <20131122015237.GB3509@localhost>
 <528EBD0B.5010006@innofidei.com> <20131122114509.GB2414@localhost>
 <5292A7E7.5060003@innofidei.com> <20131125101147.GA2408@localhost>
 <CACQ1gAi26WeiopptcZmBp6h0a5TacLo5mvVCOm6-H_1HtnwvXg@mail.gmail.com>
In-Reply-To: <CACQ1gAi26WeiopptcZmBp6h0a5TacLo5mvVCOm6-H_1HtnwvXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, zhouguangming@innofidei.com,
 linux-mtd <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2013/11/25 18:23, Richard Genoud wrote:
>
> Well, yes, write through the char device would be a solution.
>> But, *why* are you writing through mtdblock instead?
>>
>>> I think that maybe it's an optional approach through mtdblock in case we do not have
>>> the mtd-tools in our environments, we do provider a simpler way to write the NAND
>>> through mtdblock.
>>>
>> Uh? simpler? Writing through mtdchat is as simple as it gets:
>>
>>   $ cat some_file.img > /dev/mtd0
>>
>> Sorry, but I'm still confused at what are you trying to accomplish.
> I think that what Hans wants to do is:
>  $ cat some_file.img > /dev/mtd0
> And that doesn't fail on a bad block but jumps over it.
> ... Which is a bad idea.
> But, likeyou, I didn't figured out why mtdblock instead of mtdchar.
>
>

I'm sorry it's my mistake, I thought the NAND need to be erased explicitly in userspace
before written when through the mtdchar device. That's why I use the mtdblock instead of
mtdchar.

Please ignore this patch, and thank you all for so kindly.

“This E-mail and its attachments may contain legally privileged or confidential information from Innofidei Corporation. Any unauthorized copy, use, disclosure or distribution of this information is strictly prohibited. If you are not the intended recipient, please notify the sender immediately by E-mail or telephone and delete this E-mail and all its attachments immediately.
本邮件及其附件内容可能包含创毅公司享有专有法律权利的或者需要保密的信息。严禁任何人未经发件人许可以任何形式复制、使用、披露或者散发此项信息。如果您不是该收件人，请您立即通过邮件或者电话通知发件人并立即删除本邮件及其附件内容.”
