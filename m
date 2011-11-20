Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RS2yF-0000dV-4q
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2011 08:41:52 +0000
Received: by bkat2 with SMTP id t2so6881927bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2011 00:41:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321743864.2167.6.camel@koala>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 20 Nov 2011 03:41:27 -0500
Message-ID: <CAMjpGUekg2RyJ-xR0x1KDLESyFV06ng-r0aP6i+_X7PyN9uNAg@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 19, 2011 at 18:04, Artem Bityutskiy wrote:
> On Sat, 2011-11-19 at 15:55 -0500, Mike Frysinger wrote:
>> how are you making the releases ? =C2=A0seems like this keeps coming up,=
 so
>> maybe we should have a `make dist` that takes care of this stuff
>> automatically to avoid future mistakes ...
>
> You are right. I've just created a simple shell script which should do
> cut a new release properly.

could you add it to the git repo ?  be easier to send fixes/tweaks :).
-mike
