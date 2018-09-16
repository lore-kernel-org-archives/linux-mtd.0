Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1dO2-0000hx-J5
 for linux-mtd@lists.infradead.org; Sun, 16 Sep 2018 20:11:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id k14-v6so11206303edr.13
 for <linux-mtd@lists.infradead.org>; Sun, 16 Sep 2018 13:11:08 -0700 (PDT)
Subject: Re: UBIFS issues within kernel 4.14.69?
To: Richard Weinberger <richard@nod.at>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>,
 linux-mtd@lists.infradead.org
References: <d3f55a2a-dd98-1bc6-272a-9a7b9a318b76@ncentric.com>
 <daa753bf-8572-f2d4-847a-e7a87e49333d@ncentric.com>
 <18519120.7jNkZpEG5c@blindfold> <1680286.R2LEE90rvs@blindfold>
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
Message-ID: <14d0c8dc-111d-57e1-e86b-ca28544933b3@ncentric.com>
Date: Sun, 16 Sep 2018 22:11:07 +0200
MIME-Version: 1.0
In-Reply-To: <1680286.R2LEE90rvs@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 16-09-18 21:39, Richard Weinberger wrote:
> Koen,
>
> Am Samstag, 15. September 2018, 09:13:09 CEST schrieb Richard Weinberger:
>> Koen,
>>
>> Am Dienstag, 11. September 2018, 16:26:34 CEST schrieb Koen Vandeputte:
>>> On 2018-09-11 15:46, Koen Vandeputte wrote:
>>>> Hi Richard,
>>> ...
>>>
>>>> I'm only seeing these issues on UBIFS enabled volumes.
>>>>
>>>> It seems it's related to one of your 5 commits, but I'm still in the
>>>> process of bisecting to find the actual culprit.
>>>> As soon as I've found it, I'll let you know, but maybe you already
>>>> have an idea here?
>>>>
>>> Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes the
>>> weird issues.
>> Thanks for finding that bad commit!
>> I fear by fixing one bug I've uncovered another one.
>>
>> So, I guess you are using overlayfs?
>> Which overlayfs features are you using?
> I guess I've figured myself.
> overlayfs is using temp files (O_TMPFILE), and a recent overlayfs
> feature uses xattrs to indicate directory redirects.
> So it can happen that a temp file, which has link count 0, gains
> xattrs.
>
> UBIFS models xattrs like regular files in directories. Since you cannot
> add new files to a unlinked directory, UBIFS kind of enforced that for
> xattrs too.
> I say "kind of" because technically it works but can trigger an assertion
> in UBIFS's journal code.
> Recently I saw this assertion but failed to conclude that xattr operations on
> unlinked files are perfectly fine and "fixed" the assert.
>
> The right solution is reverting "ubifs: xattr: Don't operate on deleted inodes"
> and removing the false positive asserts from UBIFS' journal code.
>
> Sadly xfstests does not test for that, I'll prepare a new test case.
> Maybe other file systems got this wrong too.
>
> Thanks,
> //richard
>
Hi Richard,

Apologies for the late reply.
It was a busy weekend with the kids ..

I'm very pleased to read you already have a good idea of what is going 
on here.

Can I conclude you will provide a patch upstream to revert this specific 
commit?
Please keep me in CC in case you do, so I can backport it properly into 
OpenWrt on the next kernel bump. (until it is present in a future stable)

Once again, I highly appreciate you fast response in trying to get this 
fixed.

Thank you Richard,

Koen



Reported-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
