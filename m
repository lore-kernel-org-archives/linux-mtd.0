Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUnOs-0002fh-DT
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2015 02:58:51 +0000
Message-ID: <55DE7B6B.1010200@cn.fujitsu.com>
Date: Thu, 27 Aug 2015 10:52:27 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <richard.weinberger@gmail.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 23/35] ubifs: set/clear MS_RDONLY properly in
 ubifs_remount
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>		
 <1438235311-23788-24-git-send-email-yangds.fnst@cn.fujitsu.com>		
 <55C671F0.5050607@nod.at> <55C81090.1010802@cn.fujitsu.com>		
 <55DA7379.3030009@cn.fujitsu.com> <1440399770.15510.20.camel@gmail.com>	
 <55DAC3C3.9050906@cn.fujitsu.com> <1440401215.15510.35.camel@gmail.com>
In-Reply-To: <1440401215.15510.35.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/24/2015 03:26 PM, Artem Bityutskiy wrote:
> On Mon, 2015-08-24 at 15:12 +0800, Dongsheng Yang wrote:
>> On 08/24/2015 03:02 PM, Artem Bityutskiy wrote:
[...]
>
> Well, sounds like a bug. Either we missed that, or VFS used to set it,
Hi Artem,

Yes, VFS is setting flags after sb->s_op->remount_fs(). But someone
would use it in remount_fs() such as quota. That's the reason for this
patch. What I want here is to make our ubifs working similarly with
other filesystems setting or clearing MS_RDONLY in remount_fs(). Because
someone in vfs needs this information.

Although that's another topic, we set MS_RDONLY twice, one in ubifs, two
in VFS. But they are different. in ubifs, we only set the MS_RDONLY in
remount_ro() specially for MS_RDONLY. But in VFS, we are
setting all flags for s_flags in remounting. So, I think it's okey in 
design.

> and now does not. In either case, IIUC, the MS_RDONLY flag should be
> set on remount and reflect the mount state. Please, verify /proc/mounts
> after RO<->RW remounts - we must make sure mount options are correct
> there. You can cook a patch and send it. Do not forget to add the
> stable tag then.

Before adding quota for ubifs, there is no user to use MS_RDONLY
before do_remount() returning. So there is no problem before
adding quota in ubifs and no need for stable then.

Thanx
Yang
>
> Artem.
> .
>
