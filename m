Received: from mail.wi-flare.com ([203.86.34.34] helo=mail.innofidei.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjfV7-0002vf-3S
 for linux-mtd@lists.infradead.org; Fri, 22 Nov 2013 01:25:43 +0000
Received: from [172.19.232.47] by innofidei.com (Cipher TLSv1:-SHA:128)
 (MDaemon PRO v12.5.3) with ESMTP id md50000630405.msg
 for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2013 09:22:39 +0800
Message-ID: <528EB1E3.7030101@innofidei.com>
Date: Fri, 22 Nov 2013 09:22:43 +0800
From: Hans Zhang <zhanghonghui@innofidei.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] Make the mtdblock read/write skip the bad nand sector
References: <1385024065-29965-1-git-send-email-zhanghonghui@innofidei.com>
 <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
In-Reply-To: <CACQ1gAiLesYEWmHkivAF=t8ekCFM=yDDyzkJTtduavNjp1g6wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 zhanghonghui <zhanghonghui@innofidei.com>,
 David Woodhouse <dwmw2@infradead.org>,
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

On 2013/11/21 18:59, Richard Genoud wrote:
> I don't think it's a good idea to skip bad blocks at mtd level.
> That will definitely break the userspace.
> The nanddump mtd-tool for instance has a bad block handling argument:
> --bb=METHOD, where METHOD can be `padbad', `dumpbad', or `skipbad':
>     padbad:  dump flash data, substituting 0xFF for any bad blocks
>     dumpbad: dump flash data, including any bad blocks
>     skipbad: dump good data, completely skipping any bad blocks (default)
>
> The bad block handling is done by the upper layer (UBI/jffs2...) not by mtd.

AFAIK the nanddump mtd-tool dump the nand through mtdchar driver. So this patch
will not break the userspace for this scenario.

>
> So, if you really need to read/write the mtd layer from userspace and
> jump bad block, you'll have to use the MEMGETBADBLOCK ioctl to check
> if the block is bad before reading/writing.
>
> But using UBI is usually a better option.

The ioctl handling is just for mtdchar device, not mtdblock. Definitely we can
get the badblock info before reading/writing. But if we just want to read/write
the mtdblock device, mtdchar device need to be checked first, that is not
convenience.

Here's my scenario, I want to write nand through mtdblock by dd command, it will
abort writing when there's a bad block, but will continually reading ingore(or
even don't know about) the bad block info. That break the consistency of the data.

To make the dd command work, I think we need this patch.

thanks.

>
> Richard.
>
>


“This E-mail and its attachments may contain legally privileged or confidential information from Innofidei Corporation. Any unauthorized copy, use, disclosure or distribution of this information is strictly prohibited. If you are not the intended recipient, please notify the sender immediately by E-mail or telephone and delete this E-mail and all its attachments immediately.
本邮件及其附件内容可能包含创毅公司享有专有法律权利的或者需要保密的信息。严禁任何人未经发件人许可以任何形式复制、使用、披露或者散发此项信息。如果您不是该收件人，请您立即通过邮件或者电话通知发件人并立即删除本邮件及其附件内容.”
