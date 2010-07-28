In-Reply-To: <AANLkTikLNgDGSiAWyCasr53gax6wDOjSWPmJvO=Ri+5G@mail.gmail.com>
References: <AANLkTin+3QMqZvMNgvKTH0F_ZngY9ooBR7sSKW5cdJUq@mail.gmail.com>	<1280237995.3021.2.camel@localhost.localdomain>
	<AANLkTikLNgDGSiAWyCasr53gax6wDOjSWPmJvO=Ri+5G@mail.gmail.com>
Subject: Re: mkfs.ubifs gives corrupt images/crc errors
To: Leo Barnes <barnes.leo@gmail.com>
Message-ID: <OF90F48E8B.8BB76BF9-ONC125776E.00432BEE-C125776E.0043537D@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 28 Jul 2010 14:15:22 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> > Could you please find the commit which moves CRC support out of
> > mtd-utils/mkfs.ubifs and investigate what changed please? I think you
> > will find the reason quite quickly.
> >
> > I'm on holiday, cannot look at this now.
>
> I have now identified the first broken commit to be:
>
> commit 2d40ed7b415bcb6a358c9f221160c4a419f01f19
> Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date:   Sat Jul 17 09:43:08 2010 +0300
>
>     libs: make crc32 and fec to be libraries
>
>
> When looking at what this commit does, I can't understand why it
> breaks the CRC-calculation for mkfs.ubifs since all it seems to do is
> to create a library archive out of the crc files (after renaming them)
> and change the crc32() function from being static inline to normal. No
> function calls in mkfs.ubifs are changed, and the new crc32() function
> seems to do exactly the same thing as the old.
>
> Has anyone else noticed this problem, or is my device more susceptible
> to this for some odd reason?

two ideas, either you need to clean out old object files
or mkfs.ubifs picks up another impl. of crc32
