Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDo6-00046D-BO
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:53:11 +0000
Received: by wgbdt11 with SMTP id dt11so8419483wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:53:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323723000.2297.4.camel@koala>
References: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
 <1323723000.2297.4.camel@koala>
Date: Mon, 12 Dec 2011 13:53:08 -0800
Message-ID: <CAN8TOE9C9VEi7htM=-jypt29y23Ex3CCnYBOW3+OkTs1Zcra1A@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: write bad block marker even with BBT
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Jim Quinlan <jim2101024@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 12, 2011 at 12:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Wed, 2011-12-07 at 13:08 -0800, Brian Norris wrote:
>> Add and option (NAND_BBT_WRITE_BBM) for writing bad block markers to
>> proper OOB area on each block in addition to flash-based BBT. This is
>> useful when:
>>
>> =A0* bootloader cannot read the flash-based BBT format
>> =A0* BBT is corrupted and the flash must be rescanned for bad
>> =A0 =A0blocks; we want to remember bad blocks that were marked from Linu=
x
>>
>> Adapted from code by Matthieu CASTET.
>>
>> Cc: Matthieu CASTET <matthieu.castet@parrot.com>
>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> 2 questions, perhaps silly, but still:
>
> 1. Why wouldn't you make this the only and the default behavior? Why
> adding more options instead?

Personally, I'd like it to be default behavior. I guessed that it may
cause incompatibility with some other system which depended on the
current behavior, but if that's not a realistic concern, then I don't
mind dropping the option. It's also possible to add a flag to restore
the old behavior if needed in the future.

> 2. Would the case of inconsistency between BBT and OOB markers be
> possible to fix-up after the power cut?

Not trivially :) I suppose we could assume that any bad block markers
in the OOB are in the BBT (when it exists) but not vice versa, then
when we rebuild the BBT at boot time, we rescan the OOB only on the
bad blocks, rewriting to OOB if necessary. Eventually, this kind of
degrades to usefulness of the BBT though, if you're always checking
back with the OOB markers.

Brian
