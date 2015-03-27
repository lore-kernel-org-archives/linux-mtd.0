Received: from mail-la0-x22c.google.com ([2a00:1450:4010:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbWjB-0004xg-R8
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 16:03:22 +0000
Received: by lahp7 with SMTP id p7so54998579lah.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Mar 2015 09:02:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55157648.9020907@rempel-privat.de>
References: <CAPDOMVgj0qaqfEdZRNHKRqwCbuUZTRu3GcSuAqknhUYa4u9crg@mail.gmail.com>
 <551560BB.3050607@rempel-privat.de>
 <3BA9F386-DDC1-4C9E-855A-5D28B45BDD0B@gmail.com>
 <55157648.9020907@rempel-privat.de>
Date: Fri, 27 Mar 2015 12:02:59 -0400
Message-ID: <CAPDOMVh4YMVew=b9-HkDxbLG3C3gz4HT5m0e-NT38vivJOUyYA@mail.gmail.com>
Subject: Re: Help Out
From: Nick Krause <xerofoify@gmail.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 27, 2015 at 11:24 AM, Oleksij Rempel <linux@rempel-privat.de> w=
rote:
> Am 27.03.2015 um 15:20 schrieb Nicholas Krause:
>>
>>
>> On March 27, 2015 9:52:59 AM EDT, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>>> Am 27.03.2015 um 14:22 schrieb Nick Krause:
>>>> Greetings All,
>>>> I have been reading this list for the last few weeks and was
>>> wondering
>>>> how I can start contributing.
>>>> Further more I have some understanding of kernel internals and file
>>>> systems related to Linux so
>>>> helping out would be no problem, if there are any requests for where
>>> I
>>>> should start please let me
>>>> known.
>>>> Thanks,
>>>> Nick
>>>
>>> Just get some hardware and start play with it. Try to brake it or write
>>> a new driver. After some work you will see how match work is needed :)
>> Olaf,
>> That's the issue,  I don't know where to
>> purchase a board with mtd flash on it.
>> If you can point to where I can purchase a rather inexpensive board for =
this that would be great. Furthermore I was interested in how we are doing =
with fixing the issue relating to handling data concisely if there is a  po=
wer failure when writing to the flash on the system.
>> Nick
>
> Not sure if i can suggest you exact board. Probably i can give you some
> direction. Since you wish to play with file system, then you probably
> need some think bigger then 8MB of storage. In this case NAND will be
> better choice.
> You will need a SOC/Board with:
> - NAND controller
> - as match open as possible - you will need to work with latest vanilla
> kernel source.
>
> - MIPS Creator CI20
> - ASM9260t eval board (i work on upstreaming. if you wish to work on
> this, we can talk about it)
>
> Other options with nand on board? Or other suggestions?
>
> --
> Regards,
> Oleksij
>
I would be glad to help you upstream the board you are working on.
Cheers,
Nick
