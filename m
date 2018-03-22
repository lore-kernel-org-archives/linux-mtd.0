Received: from mail-he1eur01on0720.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::720]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ez0jR-0004gX-Qz
 for linux-mtd@lists.infradead.org; Thu, 22 Mar 2018 13:58:21 +0000
Subject: Re: UBI assert failed in ubi_wl_init
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Richard Weinberger <richard@sigma-star.at>, linux-mtd@lists.infradead.org
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <2543021.LZhlqz2gkU@blindfold>
 <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
 <63275670.WCUj5TjS3v@blindfold>
 <180bb6ee-51db-ddff-207b-e76580dab687@exertus.fi>
 <CAFLxGvx35u-5Z83m_21Q73QPf7e8ZeoMsxU-B2jdzY2-BrWamw@mail.gmail.com>
 <7002f6eb-f177-0929-79da-62f42551459f@exertus.fi>
 <CAFLxGvwyxJT8BtuPTJRonPhNnJ5mRtqda3H3u7bDTOsx7cRvtw@mail.gmail.com>
From: Timo Ketola <timo@exertus.fi>
Message-ID: <f18eea07-c2c5-cb61-e8d9-73b0b654645c@exertus.fi>
Date: Thu, 22 Mar 2018 15:57:57 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvwyxJT8BtuPTJRonPhNnJ5mRtqda3H3u7bDTOsx7cRvtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.03.2018 00:02, Richard Weinberger wrote:
> Timo,
> 
> On Fri, Mar 16, 2018 at 2:34 PM, Timo Ketola <timo@exertus.fi> wrote:
>> On 18.02.2018 22:31, Richard Weinberger wrote:
>>> Okay. That's a bit odd. Maybe my analysis is wrong. Can you try the
>>> following, replay the image to your NAND and attach again.
>>> Then you should get the same UBI assert a second time.
>>
>> Of course I can but what would be the difference to simple rebooting? I
>> get the assertion failure on every boot from the second one onwards.
>> Before I commit to that one, let's look what I found recently.
>>
>> I already tried the replay but bumped into ECC errors. Due to that and
>> other things I switched the kernel to Freescale IMX 4.9.74 with Boundary
>> fixes. I reduced the size of the user partition to 1800M and got rid of
>> the 'could not get any free erase block' and 'Unable to write new
>> fastmap' errors. The assertion failures from the second boot onwards
>> remained.
>>
>> I wondered why I'm not seeing the same issue with my smaller 64M system
>> mtd. Then I reduced the user partition to 48M and the mtd to 64M and the
>> issue vanished. Then I kept the partition at 48M but restored the mtd
>> size to 1800M and the issue returned. If I make the mtd size 0x4e680000
>> or smaller there is no issue. If I make it 0x4e6a0000 or larger the
>> issue is there. Every time I erased the NAND and burned a fresh image.
>>
>> What do you want me to do next?
> 
> Did you verify the image or not? :)
> I asked you do to so because the image you sent me does not make sense
> and I'm not sure whether I can trust it.
> Hence I asked for a double-check.

Ok, sorry.

Here is a dump after the second boot:

https://drive.google.com/open?id=1oa2lV_OB_tC-SX_c4jylnMXK6x1xhj2o

After I dumped it I erased the whole mtd, wrote the dump back there,
dumped another dump and verified that it was identical with the first
one. Then I rebooted and observed that the issue was still there just as
before.

--

Timo
