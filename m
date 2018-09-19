Received: from lilium.sigma-star.at ([109.75.188.150])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Z7y-0000zo-LB
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 09:50:36 +0000
Subject: Re: [ubi-utils] - fixes for ubi-utils-klibc 2.0.2
To: Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org
References: <CAAQYJAvt7MU-ip9k1Vj9371P0G=1Nnw4zZ4Rs0SdGVMDzEfZKg@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <14d9642f-3106-39d7-2980-6307e1124236@sigma-star.at>
Date: Wed, 19 Sep 2018 11:50:15 +0200
MIME-Version: 1.0
In-Reply-To: <CAAQYJAvt7MU-ip9k1Vj9371P0G=1Nnw4zZ4Rs0SdGVMDzEfZKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

first of all, sorry for the delay. I was quite busy recently and wanted t=
o catch up
with mtd-utils related stuff last week, but unexpectedly ended up without=
 any internet
connection at the ALPSS conference.

Regarding the meta-initramfs patch set for mtd-utils:

 - The first patch should actually not be necessary. It adds a __KLIBC__ =
guard around the existing
   HAVE_EXECINFO_H guard to prevent inclusion of execinfo.h. If the heade=
r doesn't exist, autoconf
   should catch that and not define HAVE_EXECINFO_H in the first place. S=
o this is more of a
   workaround for a bug in the build system that should be addressed.
 - The patch number 2 regarding the PRI*off_t macros is marked as "Upstre=
am-Status: Submitted",
   but I somehow can't find it on the mailing list. If it was submitted a=
nd nobody had a problem
   with that, I would happily merge it, since those magic macros have bee=
n a constant source of
   problems so far.
 - Regarding patch number 4 that adds a guard around features.h: That sho=
uld IMO be done using
   a check in the configure script. Assuming that works (see comment for =
patch #1).
 - I have submitted a patch for the prompt() function that should make pa=
tch number 5 obsolete.
   See http://lists.infradead.org/pipermail/linux-mtd/2018-September/0840=
87.html

Thanks,

David
