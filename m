Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTgfx-0007Nw-3Q
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 01:35:53 +0000
Message-ID: <55DA7379.3030009@cn.fujitsu.com>
Date: Mon, 24 Aug 2015 09:29:29 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <richard.weinberger@gmail.com>, Artem Bityutskiy
 <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 23/35] ubifs: set/clear MS_RDONLY properly in
 ubifs_remount
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-24-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C671F0.5050607@nod.at> <55C81090.1010802@cn.fujitsu.com>
In-Reply-To: <55C81090.1010802@cn.fujitsu.com>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/10/2015 10:46 AM, Dongsheng Yang wrote:
> On 08/09/2015 05:17 AM, Richard Weinberger wrote:
>> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>>> We need to set or clear MS_RDONLY in remounting.
>>
>> Care to explain why?
>> Does the quota subsystem need that information?
>> If so, where?
>
> Ha, yes, you are right.
>
> When we remount to rw from ro, we need to call dquot_resume.
> And dquot_resume will call vfs_load_quota_inode() which
> will check the MS_RDONLY. If it's ro mode, will return
> an -EROFS.
>
> And I know that we are using ->ro_mount in ubifs
> to store the mounted mode. So we don't care about
> the MS_RDONLY in ubifs. But why not to tell vfs we are in
> ro or rw? Does it cause any problem?

Hi Artem,
	I found there is a commit 2ef13294d to introduce
ro_mount to ubifs. Yes, I see the reason to use ro_mount
rather than MS_RDONLY in ubifs. But why we do not set
MS_RDONLY to tell vfs it's in rdonly or not? Current
quota depends on it. Does this patch cause some problem?

Yang
>
> Thanx
> YAng
>
>> Thanks,
>> //richard
>> .
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
>
