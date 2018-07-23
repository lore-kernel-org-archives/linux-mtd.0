Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhjF5-0003yG-CB
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 22:23:50 +0000
From: NeilBrown <neil@brown.name>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 24 Jul 2018 08:23:27 +1000
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Subject: Re: [PATCH] mtd: spi-nor: clear Extended Address Reg on switch to
 3-byte addressing.
In-Reply-To: <CAN8TOE-+XpeQ0eLEW3YdAGGtuw5reeuJRZvnMb+QquJycJWLQA@mail.gmail.com>
References: <874lkmw54j.fsf@notabene.neil.brown.name>
 <61e255fa-ece4-5566-d63a-730aaa25f18c@gmail.com>
 <87sh85uzu3.fsf@notabene.neil.brown.name>
 <a3bb28f9-1185-3dbb-1a1f-1bfe03a8798c@gmail.com>
 <87efjnvpjl.fsf@notabene.neil.brown.name>
 <CAN8TOE9Pr2i4tXu8mGuY7xSY5bU_r7UhQ9SxfqYg_M4YDUt0ew@mail.gmail.com>
 <87tvoppqwa.fsf@notabene.neil.brown.name>
 <CAN8TOE-+XpeQ0eLEW3YdAGGtuw5reeuJRZvnMb+QquJycJWLQA@mail.gmail.com>
Message-ID: <87lga1pp5s.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Mon, Jul 23 2018, Brian Norris wrote:

> Hi Neil,
>
> On Mon, Jul 23, 2018 at 2:45 PM, NeilBrown <neil@brown.name> wrote:
>> On Mon, Jul 23 2018, Brian Norris wrote:
>>> On Mon, Apr 9, 2018 at 6:05 PM, NeilBrown <neil@brown.name> wrote:
>>>> On Mon, Apr 09 2018, Marek Vasut wrote:
>>>>> On 04/08/2018 11:56 PM, NeilBrown wrote:
>>>>>> were added to Linux.  They appear to be designed to address a very
>>>>>> similar situation to mine.  Unfortunately they aren't complete as the
>>>>>> code to disable 4-byte addressing doesn't follow documented requirements
>>>>>> (at least for winbond) and doesn't work as intended (at least in one
>>>>>> case - mine). This code should either be fixed (e.g. with my patch), or removed.
>>>
>>> I would (and already did) vote for removal. The shutdown() hook just
>>> papers over bugs and leads people to think that it is a good solution.
>>> There's a reason we rejected such patches repeatedly in the past. This
>>> one slipped through.
>>
>> Hi Brian,
>>  thanks for your thoughts.
>>  Could you just clarify what you see as the end-game.
>>  Do you have an alternate approach which can provide reliability for the
>>  various hardware which currently seems to need these patches?
>>  Or do you propose that people with this hardware should suffer
>>  a measurably lower level of reliability than they currently enjoy?
>
> I'd suggest following the original thread, which I resurrected:
>
> [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when exiting
> https://lkml.org/lkml/2018/7/23/1207
> https://patchwork.ozlabs.org/patch/845022/

Thanks for the links.

>
> I suppose I could CC you on future replies...

No need (though I wouldn't object).  Thanks for the heads-up!

>
> My current summary: I'd prefer the hack be much more narrowly applied,
> with a big warning, if we apply it at all. But if we don't merge
> something to narrow the use of the hack, then yes, I'd prefer a
> degraded experience for crappy products over today's status quo.
>
I'm strongly against degrading experience - partly because it could be
my experiences, partly because it seems to go against the pragmatic
basis of Linux - we build this thing because it is useful.
I don't object to highly focuses handling of specific "quirks" - that
seems to be an established pattern in Linux.

Thanks,
NeilBrown

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAltWVV8ACgkQOeye3VZi
gbm8Mw//fiJVOzAYnlgDpxWdpKCNi5tZJdrgb6F/Q/blclyGYdT3OgjUh49Cke8b
/lixlGRbVM5nRDyLMB0TgeU6Jkb6IeVCA0rC6Vtdizo/kXy61taINap/TysuIrka
HOlkIBzVYW8FQtsQ1BLNHheLRTMKUUrHJrG4aKfMqGi+rzJ6Xw0HL2F3QwtQL4Hy
BXNXLUaLJf+HPhTuOgn9/rOICSnJkv0AQIwNc8w6gfyxdOjycGLirCrLFr5fWEcm
kn/+IY8Esv1uZCJHVwvniawwuMclJUz/kYsyK7B3fEBtlxS4WyKEL1wC7j+cy5WT
W/CWXRRHK2uMd0qigAweCwHUcURqG/tmGtQ0IdIDs/f96Rv46JBTH50+gssR+wkj
x5bWxbNCksPD9fKaie0KcdSXA99N3RwA1Y+0wtYEirBjtFeWg/W9oOK1toEf8RPF
49d/GqtPaXjDGJCgnhDSCke6WVr0CrDHQvXk0tf7jD37f8A2QNkTs/LtTFSGgNJ5
Ztrwbhz2Bmid99NzvcTfVpDJEKPMHBrXHLFtFE9lfdaYL2k7/VW9/uh7p0j2Wsxt
YsRbTvLpTz+Wsjl1vNqnVNO9XyNK8vfMAmZC930F6MrERzNlBMW1TMGkk7QwiiIJ
V53UoIdxDS53mQ+q9P/UAkfYkLeZ3ok/nV/pGVi23jgC0f++o3U=
=yw0/
-----END PGP SIGNATURE-----
--=-=-=--
