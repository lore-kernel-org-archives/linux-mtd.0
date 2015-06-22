Received: from mail.hot-smoke.com ([178.17.37.181])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z6xuI-0002ux-2o
 for linux-mtd@lists.infradead.org; Mon, 22 Jun 2015 09:20:47 +0000
From: "David J Myers" <david.myers@amg-panogenics.com>
To: "'Richard Weinberger'" <richard.weinberger@gmail.com>
References: <5587c30b.a8c1420a.4df03.ffffae2aSMTPIN_ADDED_BROKEN@mx.google.com>
 <CAFLxGvxXisrEyApZChzNywPLjqSOOU-E3jajQFw2Ef5ouYPpdQ@mail.gmail.com>
In-Reply-To: <CAFLxGvxXisrEyApZChzNywPLjqSOOU-E3jajQFw2Ef5ouYPpdQ@mail.gmail.com>
Subject: RE: UBI-FS Master Node failure
Date: Mon, 22 Jun 2015 10:20:21 +0100
Message-ID: <002a01d0accc$aaacc6a0$000653e0$@myers@amg-panogenics.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-us
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Guys,
>> I have an embedded product running a system based on linux-2.6.29,=20
>> originally from the IC supplier, but patched and modified to our =
spec.

>That's a very old kernel. Did you backport *all* stable patches?

I only back-ported the two patches as shown previously. These seemed to =
be the only two relevant patches I could find. Do you know of any other =
relevant patches?

>> Recently we have had two units go down with the same UBI-FS Master=20
>> Node failure, both in LEB-2 at slightly different offsets. The =
console=20
>> log looks like this:-
>>
>> [    6.645845] UBIFS error (pid 1): ubifs_scan: corrupt empty space =
at LEB
>> 2:86016
>> [    6.653268] UBIFS error (pid 1): ubifs_scanned_corruption: =
corrupted data
>> at LEB 2:86016
>> [    6.668163] UBIFS error (pid 1): ubifs_scan: LEB 2 scanning failed
>> [    6.889661] UBIFS error (pid 1): ubifs_recover_master_node: failed =
to
>> recover master node
>> [    6.898497] List of all partitions:
>> [    6.902188] 1f00             128 mtdblock0 (driver?)
>> [    6.907218] 1f01             768 mtdblock1 (driver?)
>> [    6.912314] 1f02             128 mtdblock2 (driver?)
>> [    6.917318] 1f03            4096 mtdblock3 (driver?)
>> [    6.922395] 1f04            4096 mtdblock4 (driver?)
>> [    6.927397] 1f05           65536 mtdblock5 (driver?)
>> [    6.932464] 1f06          184320 mtdblock6 (driver?)
>> [    6.937455] No filesystem could mount root, tried:  ubifs
>> [    6.942988] Kernel panic - not syncing: VFS: Unable to mount root =
fs on
>> unknown-block(0,0)
>>
>> I found two patches to fs/ubifs/recovery.c since 2.6.29 which I=20
>> applied, but they did not fix the corrupted flash. These two patches=20
>> were this one:-

>I fear it is not that easy.  Maybe you're facing a different issue.
>And if the data is already corrupted there is no guarantee that a UBIFS =
recent UBIFS can fix it.

I was hoping these patches would recover the corrupt UBIFS, however I'll =
settle for preventing the same fault occurring in other units. Do you =
think this problem is fixed in the recent UBIFS implementations? How can =
I test this?

Many thanks.

--
Thanks,
//richard
