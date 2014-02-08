Date: Sun, 9 Feb 2014 00:13:08 +0100
From: Willy Tarreau <w@1wt.eu>
To: Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Message-ID: <20140208231308.GF22376@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
 <000001cf2522$3a39b550$aead1ff0$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001cf2522$3a39b550$aead1ff0$@gmail.com>
Cc: 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>,
 'Mike Frysinger' <vapier@gentoo.org>, 'Artem Bityutskiy' <dedekind1@gmail.com>,
 'Richard Weinberger' <richard@nod.at>, linux-mtd@lists.infradead.org,
 'Tim Bird' <tim.bird@am.sony.com>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>,
 'Michael Opdenacker' <michael.opdenacker@free-electrons.com>,
 'Brian Norris' <computersforpeace@gmail.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Piergiorgio,

On Sun, Feb 09, 2014 at 12:05:12AM +0100, Piergiorgio Beruto wrote:
> Hello,
> I am one of the early testers of ubi block.
> 
> In my design, which is pretty common for embedded systems, I use ubiblk in
> read-only mode (and no caching since squashfs already provides it).
> For updating the squash I use ubiupdatevol, as shown in this code snippet
> (double bank handling).
> 
> swrel_update() {
>    swrel_loadst || return
>    if [ -z "$FILE" ] ; then
>       echo "error: you must specify a valid image file with -f option"
>       return 1
>    fi
> 
>    if [ -z "$BANK" ] ; then
>       # search for an active bank to update
>       # valid state is when at least one bank is standby
>       [ "$SWREL2_STATE" != "active" ] && [ "$SWREL2_STATE" != "committed" ]
> && BANK=2
>       [ "$SWREL1_STATE" != "active" ] && [ "$SWREL1_STATE" != "committed" ]
> && BANK=1
> 
>       if [ -z "$BANK" ] ; then
>          decho "swrel_update: cannot find a standby bank to update"
>          exit 2
>       fi
>    fi
> 
>    decho "swrel_update: updating bank #$BANK with file \"$FILE\""
> 
>    dev="/dev/ubi-app${BANK}w"
>    ubiupdatevol $dev "$FILE" || return
> 
>    # if there are no committed banks, commit the updating one automatically
>    if [ "$SWREL1_STATE" != "committed" ] && [ "$SWREL2_STATE" != "committed"
> ] ; then
>       decho "swrel_update: committing bank #$BANK as no committed banks were
> found"
>       swrel_commit
>    fi
> }
> 
> If I had to go for a RW filesystem I would use ubifs instead of ubiblk in RW
> mode.

I've been using ubifs for rootfs, but for a config FS, I'd rather use something
simple like ext2. Ubifs has unfortunately failed too many times on me and there
is no fsck to recover it after a failure. While I don't mind this for a rootfs
which is supposed to be easy to rebuild on an embedded device, it can be
problematic for some other parts like config and/or extra data that need to
be read once per boot and written very rarely. Anyway, squashfs guarantees me
that the FS I'm using matches what I think it should be.

> But of course this is my very personal need.

Yes and that's very interesting to all share our respective needs!

Regards,
Willy
