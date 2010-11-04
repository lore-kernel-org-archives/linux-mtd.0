Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PDvqD-0004U6-6M
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2010 09:10:42 +0000
Received: by pwi3 with SMTP id 3so567078pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Nov 2010 02:10:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kyungmin78@gmail.com
In-Reply-To: <E1C7579D1379824DAE67858071C810383717438EEF@NOK-EUMSG-02.mgdnok.nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
	<AANLkTikUSTnPedgdP19_bNbhOtSdfApdyCLKMyn+6Ext@mail.gmail.com>
	<E1C7579D1379824DAE67858071C810383717438EEF@NOK-EUMSG-02.mgdnok.nokia.com>
Date: Thu, 4 Nov 2010 18:10:36 +0900
Message-ID: <AANLkTikrO1BC7LuUCzuNg7b3gAuC=DYLKLRnFh4rPoco@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program feature for 4kb
	page onenand
From: Kyungmin Park <kmpark@infradead.org>
To: roman.tereshonkov@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 4, 2010 at 5:58 PM,  <roman.tereshonkov@nokia.com> wrote:
>
> Hi,
>
>
> I used driver/mtd/tests and did not observe any warnings except a couple =
of bad blocks for some boards.
Yes in case of mtd_test* there's no messages.
>
> Can you discribe your test case for me to reproduce it. And show your ker=
nel log when it happens if possible?
> Is it for 2kb or 4kb page onenand?

Mount ubifs on OneNAND which has 4KiB pagesize and run fsstress -p 3
-n 1000000000 -d /ubifs

then you can or maybe see the UBI scrubbing message.

Thank you,
Kyungmin Park
>
>
> Regards
> Roman Tereshonkov
>
>
>>-----Original Message-----
>>From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On
>>Behalf Of ext Kyungmin Park
>>Sent: 04 November, 2010 03:15
>>To: Tereshonkov Roman (Nokia-MS/Helsinki)
>>Cc: linux-mtd@lists.infradead.org
>>Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program
>>feature for 4kb page onenand
>>
>>Hi,
>>
>>One concern is that after apply patch, there are some 1-bit ECC
>>warnings so UBI scrubbing messages are displayed.
>>
>>Are there these message at your board?
>>
>>Thank you,
>>Kyungmin Park
>>
>>On Wed, Nov 3, 2010 at 7:55 PM, Roman Tereshonkov
>><roman.tereshonkov@nokia.com> wrote:
>>> Implement cache program feature for 4KB page onenand.
>>> This feature improves the write data performance.
>>> The observed 128KB data program speed change is
>>> from 8827KB/s to 14156 KB/s when the feature is enabled.
>>>
>>> Roman Tereshonkov (3):
>>> =A0mtd: onenand: add option and variable for cache program feature
>>> =A0mtd: onenand: fix omap2 code to handle cache program feature
>>> =A0mtd: onenand: implement cache program feature for 4kb page onenand
>>>
>>> =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 +++++++++---
>>> =A0drivers/mtd/onenand/onenand_base.c | =A0 22 +++++++++++++++++++---
>>> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 12 ++++++++++++
>>> =A03 files changed, 40 insertions(+), 6 deletions(-)
>>>
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
