Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVFwc-0004ny-BN
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 13:13:28 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Thomas Gleixner
 <tglx@linutronix.de>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Subject: RE: [EXT] Re: [PATCH RFC] mtd: rawnand: Cure MICRON NAND partial
 erase issue
Date: Fri, 7 Dec 2018 13:12:56 +0000
Message-ID: <BYASPR01MB00310C7F883FF6E06A2DA5C5DBAA0@BYASPR01MB0031.namprd08.prod.outlook.com>
References: <alpine.DEB.2.21.1811292207570.1657@nanos.tec.linutronix.de>
 <20181202082918.3b5f303a@bbrezillon>
In-Reply-To: <20181202082918.3b5f303a@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>+Bean,
>
>Hi Thomas,
>
>First of all, I'd like to thank you for sharing this patch. I'm pretty sur=
e this will
>save days of painful debug sessions to a lot of people.
>
>On Thu, 29 Nov 2018 22:12:50 +0100 (CET) Thomas Gleixner
><tglx@linutronix.de> wrote:
>
>> On some Micron NAND chips block erase fails occasionaly despite the
>> chip claiming that it succeeded. The flash block seems to be not
>> completely erased and subsequent usage of the block results in hard to
>> decode and very subtle failures or corruption.
>>
>> The exact reason is unknown, but experimentation has shown that it is
>> only happening when erasing an erase block which is partially written.
>> Partially written erase blocks are not uncommon with UBI/UBIFS.  Note,
>> that this does not always happen. It's a rare and random, but eventually
>fatal failure.
>>
>> For now, just blindly write 6 pages to 0. Again experimentation has
>> shown that it's not sufficient to write pages at the beginning of the
>> erase block. There need to be pages written in the second half of the
>> erase block as well. So write 3 pages before and past the middle of the =
block.
>>
>> Less than 6 pages might be sufficient, but it might even be necessary
>> to write more pages to make sure that it's completely cured. Two pages
>> still failed, but the 6 held up in a stress test scenario.
>>
>> This should be optimized by keeping track of writes, but that needs
>> proper information about the issue.
>>
>> As it's just observation and experimentation based, it's probably wise
>> to hold off on this until there is proper clarification about the root
>> cause of the problem. The patch is for reference so others can avoid
>> to decode this again, but there is no guarantee that it actually fixes
>> the issue completely.
>
>I agree. I Cc-ed Bean from Micron. Maybe he can provide more information
>on this issue.
>
>>
>> Therefore:
>>
>> Not-yet-signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>>
>> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Cc: Richard Weinberger <richard@nod.at>
>>
>> ---
>>
>> P.S.: This was debugged on an older kernel version (sigh) and ported
>>       forward without actual testing on mainline. My MTD foo is a bit
>>       rusty, so I won't be surprised if there are better ways to do that=
.
>
>Let's first wait for Bean's feedback before discussing implementation deta=
ils.
>BTW, do you remember the part number(s) of the flash(es) impacted by this
>problem in your case?
>
Thanks, let me know this issue, I will look at this

>Thanks,
>
>Boris
>
