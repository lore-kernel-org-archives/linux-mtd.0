Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XcoU3-0006jz-2t
 for linux-mtd@lists.infradead.org; Sat, 11 Oct 2014 04:40:48 +0000
Received: by mail-pa0-f49.google.com with SMTP id hz1so2847355pad.22
 for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2014 21:40:25 -0700 (PDT)
In-Reply-To: <54382870.1020607@nod.at>
References: <d4a8ef19-1bb5-4d81-9b04-ca9886e7f209@email.android.com>
 <CAFLxGvzbpjgt4EzUiWW3eqZLb8Eyz8vMJYrcdLvs2sS-kiFEBg@mail.gmail.com>
 <1197b309-a9e9-4976-8845-165a4e634bd0@email.android.com>
 <54382870.1020607@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: How do I know my UBI/UBIFS code version?
From: Woody Wu <narkewoody@gmail.com>
Date: Sat, 11 Oct 2014 12:39:18 +0800
To: Richard Weinberger <richard@nod.at>
Message-ID: <85b7a3b9-54ca-444b-b85b-398249bfa904@email.android.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On October 11, 2014 2:41:52 AM GMT+08:00, Richard Weinberger <richard@nod.at> wrote:
>Am 10.10.2014 um 20:38 schrieb Woody Wu:
>> 
>> 
>> On October 10, 2014 11:28:26 PM GMT+08:00, Richard Weinberger
><richard.weinberger@gmail.com> wrote:
>>> On Fri, Oct 10, 2014 at 4:57 PM, Woody Wu <narkewoody@gmail.com>
>wrote:
>>>> I am running ubi/ubifs on a ported ARM linux 3.1.x.  How do I get
>>> know my ubi/ubifs version? In additional, if I found the version are
>>> too old, could I simply copy a newer version source files to my 3.1
>ARM
>>> linux tree?
>>>
>>> Ported in terms of utterly broken by a SoC vendor? ;-)
>>> If your kernel version is v3.1 then also UBI and UBIFS is v3.1
>unless
>>> someone messed with it.
>>> To find out you need to consult the changelog.
>>>
>>> And no, you cannot simply copy&paste the sources files between
>kernel
>>> releases as the internal kernel API is
>>> a moving target.
>> 
>> 'ubinfo -a' returns to me "UBI version: 1" in its first line output. 
>Does it looks strange to you?  Thanks.
>
>This version is always 1.
>If we consider UBI Fastmap at some point rock stable _and_ make it
>default we'll change this version maybe to 2.

So, back to my original question, how do I know my UBI version? Just '1' in the case?  Thanks.

-woody, sent from mobile
