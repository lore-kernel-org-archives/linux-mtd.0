Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2Wa3-0003ML-SJ
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 03:21:32 +0000
Message-ID: <5577AC03.9060909@cn.fujitsu.com>
Date: Wed, 10 Jun 2015 11:16:19 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1433831809.28854.17.camel@sauron.fi.intel.com> <55769D97.3010602@nod.at>
In-Reply-To: <55769D97.3010602@nod.at>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/09/2015 04:02 PM, Richard Weinberger wrote:
> Am 09.06.2015 um 08:36 schrieb Artem Bityutskiy:
>> On Mon, 2015-06-08 at 18:07 +0800, Dongsheng Yang wrote:
>>> Currently, ubifs does not support access time anyway. I understand
>>> that there is a overhead to update inode in each access from user.
>>>
>>> But for the following two reasons, I think we can make it optional
>>> to user.
>>>
>>> (1). More and more flash storage in server are trying to use ubifs,
>>> it is not only for a device such as mobile phone any more, we want
>>> to use it in more and more generic way. Then we need to compete
>>> with some other main filesystems. From this point, access time is
>>> necessary to us, at least as a choice to user currently.
>>>
>>> (2). The default mount option about atime is relatime currently,
>>> it's much relaxy compared with strictatime. Then we don't update
>>> the inode in any accessing. So the overhead is not too much.
>>> It's really acceptable.
>>>
>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>> ---
>>> 	It's a RESEND patch to cc to fsdevel as Artem suggested.
>>> I would rename force_atime to enable_atime in next version.
>>
>> Why do you need to introduce a custom "force_atime" option if there are
>> already standard "atime" and "noatime" mount option? I am fine with
>> adding atime support to UBIFS in general, and I'd expect this behavior
>> then.
>
> I think the rationale behind force_atime was "I know atime can hurt my NAND and I know what
> I'm doing". :-)
> Such that possible users think of the consequences.

Thanx Richard, Yes, that's my point. :-)

In addition, the atime and noatime are non-fs dependent options.
Then these options would be parsed in userspace and vfs will
get a flags about them. vfs are treating default as atime enabled,
then vfs will set MNT_RELATIME in flags:

2592         /* Default to relatime unless overriden */
2593         if (!(flags & MS_NOATIME))
2594                 mnt_flags |= MNT_RELATIME;

But ubifs is working differently. ubifs disables atime by default.
The problem is, we can not distinguish the following two case
in ubifs.

1. mount -t ubifs ... - MNT_RELATIME in flags
2. mount -t ubifs -o atime - MNT_RELATIME in flags too

In vfs, they are equal. In ubifs, we want different behaviours but we
can not distinguish them.

Therefore, I introduced a new option named as force_atime in ubifs.
That's a ubifs-dependent opiton and it works as a main switch, in
a higher level compared with atime and noatime. If force_atime, we
support the atime-related flags. Otherwise, we don't care about all of
them in flags and don't support atime anyway.

Thanx
Yang

>
> Thanks,
> //richard
> .
>
