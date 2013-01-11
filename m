Received: from cluster-a.mailcontrol.com ([85.115.52.190])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TtaTT-0004ch-Em
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 09:00:28 +0000
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'Norbert van Bolhuis'" <nvbolhuis@aimvalley.nl>
Date: Fri, 11 Jan 2013 10:00:02 +0100
Subject: R: UBI corruption on a NOR flash
Message-ID: <BE7AFD5DB9EB17418CAAAEEA76697290190E878AAB@mta-mail.MTA.INT>
In-Reply-To: <50EE97D5.5060906@aimvalley.nl>
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Norbert,
thank you very much for your quick support.
I've downloaded the ubifs-v2.6.32.git linux as you suggested us, but I see =
a lot a differences regarding UBI with our very old 2.6.24.6 kernel.

Do you think this is the only work we can do? Are there other possible solu=
tions to fix the issue we have? (Like for example applying the patch showed=
 in http://lists.infradead.org/pipermail/linux-mtd/2010-December/033322.htm=
l) ?

Thank you again
Daniele Bosi

-----Messaggio originale-----
Da: Norbert van Bolhuis [mailto:nvbolhuis@aimvalley.nl]
Inviato: gioved=EC 10 gennaio 2013 11.29
A: Bosi Daniele
Cc: 'linux-mtd@lists.infradead.org'
Oggetto: Re: UBI corruption on a NOR flash

On 01/09/13 14:43, Bosi Daniele wrote:
> Hello List,
> we are working on an embedded device running on Linux 2.6.24.6.
> We had some devices returned from the field with corrupted UBI partitions=
 on a NOR flash.
> The corruption was probably caused by a power cut, but we aren't sure abo=
ut the root cause of the failure.
>
> We found a similar issue in an old thread from the mailing list where Art=
em said that UBI on NOR could have some bugs that can lead to such a failur=
e (http://lists.infradead.org/pipermail/linux-mtd/2009-May/025737.html), bu=
t no final statements was given on that thread.
>
> Any help would be appreciated, thank you.
>


I believe the final statement of the referred thread was that one
of the problems was UBI/UBIFS assumes a (CFI) write buffer size of
8 bytes. This is often not the case with NOR flash. It did not lead
to kernel patches though.

Lateron this problem was found (again) by Anatolij Gustschin
(see the thread "UBIFS partition on NOR flash not mountable after power cut=
 test"
from december 2010) and he fixed it properly. His patches ended up in the m=
ainline.

Btw. it could be your problem is another or a related ubi/ubifs NOR flash p=
ower
cut problem. Some other problem have been found and solved as well (mostly =
by Artem
and Anatolij).

If you update to the ubi/ubifs backported linux-2.6.32 (this is the oldest =
one
still available) which can be found here:
http://git.infradead.org/users/dedekind/ubifs-v2.6.32.git
you'll probably be fine.

hth,
Norbert van Bolhuis
