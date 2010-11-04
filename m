Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PDveO-00045D-HH
	for linux-mtd@lists.infradead.org; Thu, 04 Nov 2010 08:58:29 +0000
From: <roman.tereshonkov@nokia.com>
To: <kyungmin.park@samsung.com>
Date: Thu, 4 Nov 2010 09:58:07 +0100
Subject: RE: [PATCHv2 0/3] mtd: onenand: add cache program feature for 4kb
	page onenand
Message-ID: <E1C7579D1379824DAE67858071C810383717438EEF@NOK-EUMSG-02.mgdnok.nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
	<AANLkTikUSTnPedgdP19_bNbhOtSdfApdyCLKMyn+6Ext@mail.gmail.com>
In-Reply-To: <AANLkTikUSTnPedgdP19_bNbhOtSdfApdyCLKMyn+6Ext@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,


I used driver/mtd/tests and did not observe any warnings except a couple of=
 bad blocks for some boards.

Can you discribe your test case for me to reproduce it. And show your kerne=
l log when it happens if possible?
Is it for 2kb or 4kb page onenand?


Regards
Roman Tereshonkov


>-----Original Message-----
>From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On=20
>Behalf Of ext Kyungmin Park
>Sent: 04 November, 2010 03:15
>To: Tereshonkov Roman (Nokia-MS/Helsinki)
>Cc: linux-mtd@lists.infradead.org
>Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program=20
>feature for 4kb page onenand
>
>Hi,
>
>One concern is that after apply patch, there are some 1-bit ECC
>warnings so UBI scrubbing messages are displayed.
>
>Are there these message at your board?
>
>Thank you,
>Kyungmin Park
>
>On Wed, Nov 3, 2010 at 7:55 PM, Roman Tereshonkov
><roman.tereshonkov@nokia.com> wrote:
>> Implement cache program feature for 4KB page onenand.
>> This feature improves the write data performance.
>> The observed 128KB data program speed change is
>> from 8827KB/s to 14156 KB/s when the feature is enabled.
>>
>> Roman Tereshonkov (3):
>> =A0mtd: onenand: add option and variable for cache program feature
>> =A0mtd: onenand: fix omap2 code to handle cache program feature
>> =A0mtd: onenand: implement cache program feature for 4kb page onenand
>>
>> =A0drivers/mtd/onenand/omap2.c =A0 =A0 =A0 =A0| =A0 12 +++++++++---
>> =A0drivers/mtd/onenand/onenand_base.c | =A0 22 +++++++++++++++++++---
>> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0| =A0 12 ++++++++++++
>> =A03 files changed, 40 insertions(+), 6 deletions(-)
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
>=
