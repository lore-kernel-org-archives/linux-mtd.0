Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1tAl-0002tf-6b
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 09:16:47 +0000
Message-ID: <55755C48.4080802@cn.fujitsu.com>
Date: Mon, 8 Jun 2015 17:11:36 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <adrian.hunter@intel.com>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: Introduce a mount option of force_atime.
References: <1433752038-17276-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <557555F6.4030009@nod.at>
In-Reply-To: <557555F6.4030009@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/08/2015 04:44 PM, Richard Weinberger wrote:
> Am 08.06.2015 um 10:27 schrieb Dongsheng Yang:
>> Currently, ubifs does not support access time anyway. I understand
>> that there is a overhead to update inode in each access from user.
>>
>> But for the following two reasons, I think we can make it optional
>> to user.
>>
>> (1). More and more flash storage in server are trying to use ubifs,
>> it is not only for a device such as mobile phone any more, we want
>> to use it in more and more generic way. Then we need to compete
>> with some other main filesystems. From this point, access time is
>> necessary to us, at least as a choice to user currently.
>
> Do you have a reference? I know that modern servers use a lot of SSDs
> which use internally NAND (mostly MLC and TLC).
> But which systems use RAW NAND where they would care about the atime?

Hi Richard,

Thanx for your quick response here.

http://www.slideshare.net/FujitsuTS/bos-c113a-data-will-change-business-but-will-it-really-change-ict
I am not sure is that url available to you. But that's what my team is
focus on. It's about a server-using NAND device.
>
>> (2). The default mount option about atime is relatime currently,
>> it's much relaxy compared with strictatime. Then we don't update
>> the inode in any accessing. So the overhead is not too much.
>> It's really acceptable.
>
> Did you consider ext4's lazytime? I can think of something like that
> for UBIFS too.

Yes, lazytime is much better in our usecase, from what I know,
they are trying to implement a lazytime in vfs.

But what I am doing here is just making the atime possible to user. It
means the force_atime is not in the same level with relatime,
strictatime and lazytime. force_atime here is just making our ubifs
supporting access time in any mode as you chose. If you want to use
relatime or strictatime, even or lazytime in future, for ubifs, you
have to enable force_atime at first. otherwise we does not support 
access atime anyway.

Thanx
Yang
>
> Thanks,
> //richard
> .
>
