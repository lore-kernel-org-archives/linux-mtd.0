Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zg1nT-0005Rc-44
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 02:34:39 +0000
Message-ID: <56075420.5080303@cn.fujitsu.com>
Date: Sun, 27 Sep 2015 10:27:44 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>, Andrew Tierney
 <cybergibbons@cybergibbons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David
 Gstir <david@sigma-star.at>
Subject: Re: UBIFS recovery/forensics tools
References: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
 <CAFLxGvwtq9WF3SL_ZaAYHMsvi4g3B29XwRddKvPyu2YDz2P-hA@mail.gmail.com>
In-Reply-To: <CAFLxGvwtq9WF3SL_ZaAYHMsvi4g3B29XwRddKvPyu2YDz2P-hA@mail.gmail.com>
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

On 09/25/2015 06:26 PM, Richard Weinberger wrote:
> On Fri, Sep 25, 2015 at 11:29 AM, Andrew Tierney
> <cybergibbons@cybergibbons.com> wrote:
>> Hello all,
>>
>> I am a reverse engineer, and I am finding that UBIFS is becoming
>> increasingly common on embedded devices. A common task is recovering
>> file systems from locked down or damaged devices, and I'm finding this
>> very challenging with UBIFS!
>>
>> I have seen talk on here of userspace tools to recover damaged UBIFS
>> systems. Did anything every come of this? I am currently using "ubi
>> reader" ( https://github.com/jrspruitt/ubi_reader ) with some success.
>
> We're currently working on such tools.
> Stay tuned.

Yes, there is already a RFC for ubifs_dump tool,
http://lists.infradead.org/pipermail/linux-mtd/2015-August/061201.html

fsck.ubifs is in developing. Andrew, do you want something like that?

Yang
>
