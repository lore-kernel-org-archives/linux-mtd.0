Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTWhl-0004R3-3L
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 07:57:41 +0000
Received: by bwz19 with SMTP id 19so16652bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jul 2009 00:57:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A66C209.7060305@nokia.com>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
	<4A66B547.6020207@nokia.com>
	<71cd59b00907220012pe8200e6od143f2561501bd0f@mail.gmail.com>
	<4A66C209.7060305@nokia.com>
Date: Wed, 22 Jul 2009 09:57:33 +0200
Message-ID: <71cd59b00907220057s6dbbdcb0vc23526836939aa97@mail.gmail.com>
Subject: Re: UBI FS mounting time
From: Corentin Chary <corentin.chary@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Bosi Daniele <Daniele.Bosi@mta.it>, Brijesh Singh <brij.singh@samsung.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 22, 2009 at 9:38 AM, Adrian Hunter<adrian.hunter@nokia.com> wro=
te:
> Corentin Chary wrote:
>>
>> On Wed, Jul 22, 2009 at 8:44 AM, Adrian Hunter<adrian.hunter@nokia.com>
>> wrote:
>>>
>>> Bosi Daniele wrote:
>>>>
>>>> We have a UBI+UBIFS 1GB partition on a NAND chip, which takes around 6=
s
>>>> to
>>>> mount.
>>>>
>>>> We'd like to have the data available at least read-only earlier than
>>>> that.
>>>>
>>>> We know UBI on principle needs to read the map of all blocks in order =
to
>>>> rebuild the logical view of the memory, but maybe there's another way
>>>> around
>>>> it to make it available earlier...
>>>>
>>>> Someone know how?
>>>
>>> Some options are:
>>>
>>>
>>> a) Use another smaller partition that can mount first and provide some
>>> functionality while the larger partition mounts.
>>> b) Reduce the number of eraseblocks by combining them into larger logic=
al
>>> blocks.
>>> c) Change UBI to write its mapping table when it is unloaded, so it can
>>> be
>>> read quickly when loading (still have to scan if UBI was not unloaded
>>> cleanly).
>>
>> Do you know if someone is trying to implement that ?
>
> Not that particular approach. =A0Some Samsung people have looked at
> creating a scalable version of UBI.
>
>> I did some test, and using lzo/zlib it should be possible to store
>> such a mapping
>> store in only one PEB.
>> Then we can choose this PEB to be near the beginning of the
>> flash to speed up scanning (using ec and pnum to calculate a "score").
>> This is also possible to use an "anchor".
>
> Yes, it is better to use anchor blocks. =A0Probably just one is enough if
> it is only updated twice per mount.

Do you think it would be better to fix the position of the anchor
(first 2 good peb,
ideally 0 and 1), or try to get a "good" position using ec and pnum ?

With a fixed position at the beginning, the scan process would be easier,
because there is no need to reset if we find the anchor after normal blocks=
.
But is does not sound very "wear leveling".

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
