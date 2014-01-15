Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3ZiQ-0006qW-IK
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 23:17:43 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v6 4/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page detection for BCHx_HW ECC schemes
Date: Wed, 15 Jan 2014 23:17:13 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6217B@DBDE04.ent.ti.com>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
 <1388803698-26252-5-git-send-email-pekon@ti.com>
 <20140114042531.GC8919@ld-irv-0074>
In-Reply-To: <20140114042531.GC8919@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Balbi, Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Brian,


>From: Brian Norris [mailto:computersforpeace@gmail.com]
[...]
>>
>> This patch solves following problems in ECC correction for BCHx_HW ecc-s=
chemes.
>> Problem: Current implementation depends on a specific byte-position (res=
erved
>>          as 0x00) in ecc-layout to differentiate between programmed-page=
s v/s
>>          erased-pages.
>>       1) All ecc-scheme layouts do not have such Reserved byte marker to
>>          differentiate between erased-page v/s programmed-page. Thus thi=
s is a
>>          customized solution.
>>       2) Reserved byte can itself be subjected to bit-flips causing eras=
ed-page
>>          to be misunderstood as programmed-page.
>>
>> Solution: This patch removes dependency on single byte-position ini ecc-=
layout
>>          to differentiating between erased-page v/s programeed-page.
>>          This patch 'assumes' any page to be 'erased':
>> 		(a) if        all(read_ecc)  =3D=3D 0xff
>> 		(b) else if   all(read_data) =3D=3D 0xff
>
>Your assumptions break down if somebody intentionally programmed a page
>with 0xff data. Then the ECC region will not be 0xff, but the data area
>may be all 0xff. Isn't this a major problem? (You can try testing this
>with nandwrite/nanddump using a page of 0xff.)
>
I thought of this much, but I found that UBI doesn't really differentiate b=
etween
 (a) page intentionally programmed with 0xff data.
 (b) page left blank.
This is why we have 'white-space-fixup' feature in UBIFS, which re-erased t=
he
page which it thinks are blank. For UBI, any blocks which has 'vid-header'
is assumed to contain some user-data.
Example: When UBI image is flashed using 'nand write' command from u-boot.
u-boot writes 0xff as data along with its OOB into empty pages.
But when UBIFS scans all the blocks it considers the blocks without 'vid-he=
ader'
as erased, in spite the fact that the pages is programmed with 0xff data.
(However, Artem can confirm this more)..


>>
>> Reasons for (a)
>>       -  An abrupt termination of page programming (like power failure)
>>          may result in partial write, leaving page in corrupted state wi=
th
>>          un-stable bits. As OOB region is programmed after the data-regi=
on,
>>          so if read_ecc[] =3D=3D 0xff, then a page should treadted as er=
ased.
>>
>>       -  Also, as ECC is not present, any bitflips in page cannot be det=
ected.
>>
>> Reasons for (b)
>>       - Due to architecture of NAND cell, bit-flips cannot change progra=
mmed
>>         value from '0' -> '1'. So if all(read_data) =3D=3D 0xff then its=
 confirmed
>>         that there is 'no bit-flips in data-region'. Hence, read_data[] =
=3D=3D 0xff
>>         can be safely returned.
>>
I think this is a valid assumption, because converting all the programmed b=
its
back to '1' (s) requires erase operation, which internally is done at sligh=
tly
higher voltage (as per my understanding of flash cell & floating-gate archi=
tecture).


>>       - if page was programmed-page with 0xff and 'calc_ecc[] !=3D 0x00'=
 then
>>         it means that page has bit-flips in OOB-region.
>>
Sorry, yes may be I wrote this incorrectly .. (please ignore this)


>>       - if page was erased-page and 'read_ecc[] !=3D ecc_of_all_0xff' th=
en
>>         it  mean that there are bit-flips in OOB-region of page.
Sorry there is a typo here.. it should be calc_ecc[] !=3D ecc_of_all_0xff.
	If (OOB =3D=3D all(0xff) /* page is erased */
		If (calc_ecc[] !=3D ecc_of_all_0xff)  /* erased-page has bit-flips */

So, I think above assumption is also correct ??
(And this has been already followed in existing OMAP driver, refer bch8_vec=
tor)


>
>I think several assumptions and statements you are making are flawed,
>and (unless I'm wrong) you probably need to rethink the approach in this
>patch and the previous one.
>
>Are you mainly trying to (1) improve performance and (2) remove reliance
>on a single byte marker? I think the first point may be misguided and
>not important in this case, but the second looks like you can solve it
>well. What do you think of trying to tackle (2) without (1)? You would
>be keeping much of the existing hweight()-related code for determining
>bitflips across the whole data+OOB, but you could still have a smaller
>ECC-only check to perform a faster first pass.
>
Yes, I want to solve (2) "remove reliance on a single byte marker".
That's on priority.=20
But recently I have come across some MLC and new technology NAND
devices, which have very high bit-flip rates.=20
(a) Almost every page has bit-flips. And some pages have stuck bits too.
   But all this is within correctable range so performance will certainly h=
it.
(b) Even the erased-pages are having lot of bit-flips in OOB area, so
  it's difficult to differentiate between erased-page v/s programmed-page.
(c) And due to the bit-flips in erased-pages the 'faster' ECC-only check wi=
ll
   mostly fail, and so we fall back to comparing each byte with 0xFF. Thus
   performance falls further.

I'm unable to find a proper solution for avoiding (2) and still able to mee=
t (b).
So, in this patch I just did two checks
- compare all OOB with 0xff to see if the page is programmed.
- compare all data with 0xff to see if data is present.
If either of the two returns as true, then I consider the page as erased.
because UBIFS does not distinguish between erased-page and
programmed-page having all(0xff) data.


[...]

>> +			/* (a) page can be 'assumed' erased if
>> +			 * all(read_ecc) =3D=3D 0xff */
>
>Can you fix your comment style please? Note the multiline style used by
>the comments you are deleting.
>
Ok.. But these are wasting 2 lines :-)


with regards, pekon
