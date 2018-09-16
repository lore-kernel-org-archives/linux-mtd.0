Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1d6L-0002kk-5C
 for linux-mtd@lists.infradead.org; Sun, 16 Sep 2018 19:53:03 +0000
Received: by mail-ed1-x541.google.com with SMTP id k14-v6so11185818edr.13
 for <linux-mtd@lists.infradead.org>; Sun, 16 Sep 2018 12:52:49 -0700 (PDT)
Subject: Re: ubifs: regression since "ubifs: xattr: Don't operate on deleted
 inodes"
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 stable <stable@vger.kernel.org>
References: <fd473abd-58d2-076f-675a-fb1ac06aa984@ncentric.com>
 <20180913094630.GB634@kroah.com>
 <CAFLxGvyz6oPbeS4KmG-O6vs26P4kB8rMwbukRVgbN-PKvcgcTA@mail.gmail.com>
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
Message-ID: <957f48b5-cc45-ce9b-0a48-cab8534ad570@ncentric.com>
Date: Sun, 16 Sep 2018 21:52:48 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyz6oPbeS4KmG-O6vs26P4kB8rMwbukRVgbN-PKvcgcTA@mail.gmail.com>
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



On 15-09-18 09:15, Richard Weinberger wrote:
> Koen,
>
> On Thu, Sep 13, 2018 at 12:09 PM gregkh@linuxfoundation.org
> <gregkh@linuxfoundation.org> wrote:
>> adding stable@ for stable kernel issues...
>>
>> On Thu, Sep 13, 2018 at 09:58:35AM +0200, Koen Vandeputte wrote:
>>> Hi all,
>>>
>>> I'm currently in the process of updating the kernel version within OpenWrt.
>>> (4.14.68 to 4.14.69)
>>>
>>> Testing shows some issues on devices using specifically UBIFS.
>>> Altering a perfect valid writable file shows weird errors:
>>>
>>>
>>> [ Node 2 | node-2 ] ls -l /root/custom/scripts/banner.sh
>>> -rwxr-xr-x    1 root     root           283 Sep 11 09:52
>>> /root/custom/scripts/banner.sh
>>>
>>> [ Node 2 | node-2 ] cat /root/custom/scripts/banner.sh
>>> #!/bin/sh
>>>
>>> if [ ! -f /root/.banner_ok ]
>>> then
>>>      RELEASE=$(cat /root/build_date)
>>>      VERSION=$(cat /root/version)
>>>
>>>      echo "Generating banner: $VERSION $RELEASE"
>>>      sed s/VERSION/$VERSION/g /root/custom/banner > /etc/banner
>>>      sed -i s/RELEASE/$RELEASE/g /etc/banner
>>>
>>>      touch /root/.banner_ok
>>> fi
>>>
>>> [ Node 2 | node-2 ] echo "test" > /root/custom/scripts/banner.sh
>>> -ash: can't create /root/custom/scripts/banner.sh: nonexistent directory
>>>
>>>
>>>
>>> I'm also noticing other apps fail because /etc doesn't exists yet after
>>> UBIFS boot loading.
>>> these 2 issues were not seen on 4.14.68.
>>>
>>> The bootlog doesn't show any error:
>>> https://pastebin.com/raw/dJx47uBp
>>>
>>>
>>> I'm only seeing these issues on UBIFS enabled volumes.
>>> Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes these
>>> weird issues.
> Please see my answer to the other thread.
> Always keep the patch author on CC and don't start multiple threads for the
> same issue on two mailing lists.
> Yes, I didn't answer for three days, I had no internet connection...
>
Richard,

I indeed posted here too as we passed the 3 days marker, and I noticed 
4.14.70 RC2 got staged.
Also, a lot of developers tend to ignore questions unless the initial 
question got posted to the official mailinglist.

Let's continue on the OpenWrt list as you propose, were the initial 
question was raised.

Apologies for the (double) noise.


Thank you,

Koen
