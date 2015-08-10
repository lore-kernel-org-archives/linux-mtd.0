Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOdCh-0000wF-OA
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 02:52:48 +0000
Message-ID: <55C81090.1010802@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 10:46:40 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 23/35] ubifs: set/clear MS_RDONLY properly in
 ubifs_remount
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-24-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C671F0.5050607@nod.at>
In-Reply-To: <55C671F0.5050607@nod.at>
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

On 08/09/2015 05:17 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> We need to set or clear MS_RDONLY in remounting.
>
> Care to explain why?
> Does the quota subsystem need that information?
> If so, where?

Ha, yes, you are right.

When we remount to rw from ro, we need to call dquot_resume.
And dquot_resume will call vfs_load_quota_inode() which
will check the MS_RDONLY. If it's ro mode, will return
an -EROFS.

And I know that we are using ->ro_mount in ubifs
to store the mounted mode. So we don't care about
the MS_RDONLY in ubifs. But why not to tell vfs we are in
ro or rw? Does it cause any problem?

Thanx
YAng

> Thanks,
> //richard
> .
>
