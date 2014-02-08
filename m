Received: from mail-ea0-f179.google.com ([209.85.215.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCGyV-00036m-By
 for linux-mtd@lists.infradead.org; Sat, 08 Feb 2014 23:06:16 +0000
Received: by mail-ea0-f179.google.com with SMTP id q10so1900926ead.24
 for <linux-mtd@lists.infradead.org>; Sat, 08 Feb 2014 15:05:17 -0800 (PST)
From: "Piergiorgio Beruto" <piergiorgio.beruto@gmail.com>
To: "'Richard Weinberger'" <richard@nod.at>,
	"'Willy Tarreau'" <w@1wt.eu>
References: <1391027881-8354-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1391027881-8354-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAFLxGvyPUTg+4SLAyN8UYGr8DmjdyjUmQOP++t_JVRM5Usd1yQ@mail.gmail.com>
 <20140208225149.GA22376@1wt.eu> <52F6B602.3030905@nod.at>
In-Reply-To: <52F6B602.3030905@nod.at>
Subject: RE: [PATCH 1/1] ubi: Introduce block devices for UBI volumes
Date: Sun, 9 Feb 2014 00:05:12 +0100
Message-ID: <000001cf2522$3a39b550$aead1ff0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Thomas Petazzoni' <thomas.petazzoni@free-electrons.com>,
 'Mike Frysinger' <vapier@gentoo.org>, 'Artem Bityutskiy' <dedekind1@gmail.com>,
 'Michael Opdenacker' <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org, 'Tim Bird' <tim.bird@am.sony.com>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>,
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

Hello,
I am one of the early testers of ubi block.

In my design, which is pretty common for embedded systems, I use ubiblk in
read-only mode (and no caching since squashfs already provides it).
For updating the squash I use ubiupdatevol, as shown in this code snippet
(double bank handling).

swrel_update() {
   swrel_loadst || return
   if [ -z "$FILE" ] ; then
      echo "error: you must specify a valid image file with -f option"
      return 1
   fi

   if [ -z "$BANK" ] ; then
      # search for an active bank to update
      # valid state is when at least one bank is standby
      [ "$SWREL2_STATE" != "active" ] && [ "$SWREL2_STATE" != "committed" ]
&& BANK=2
      [ "$SWREL1_STATE" != "active" ] && [ "$SWREL1_STATE" != "committed" ]
&& BANK=1

      if [ -z "$BANK" ] ; then
         decho "swrel_update: cannot find a standby bank to update"
         exit 2
      fi
   fi

   decho "swrel_update: updating bank #$BANK with file \"$FILE\""

   dev="/dev/ubi-app${BANK}w"
   ubiupdatevol $dev "$FILE" || return

   # if there are no committed banks, commit the updating one automatically
   if [ "$SWREL1_STATE" != "committed" ] && [ "$SWREL2_STATE" != "committed"
] ; then
      decho "swrel_update: committing bank #$BANK as no committed banks were
found"
      swrel_commit
   fi
}

If I had to go for a RW filesystem I would use ubifs instead of ubiblk in RW
mode.
But of course this is my very personal need.

Regards,
PIergiorgio

-----Original Message-----
From: Richard Weinberger [mailto:richard@nod.at] 
Sent: Saturday, February 8, 2014 11:56 PM
To: Willy Tarreau
Cc: Ezequiel Garcia; linux-mtd@lists.infradead.org; Thomas Petazzoni; Mike
Frysinger; Artem Bityutskiy; Michael Opdenacker; Tim Bird; Piergiorgio
Beruto; Brian Norris; David Woodhouse
Subject: Re: [PATCH 1/1] ubi: Introduce block devices for UBI volumes

Am 08.02.2014 23:51, schrieb Willy Tarreau:
> On Sat, Feb 08, 2014 at 10:37:19PM +0100, Richard Weinberger wrote:
>>> +config MTD_UBI_BLOCK_WRITE_SUPPORT
>>> +       bool "Enable write support (DANGEROUS)"
>>> +       default n
>>> +       depends on MTD_UBI_BLOCK
>>> +       select MTD_UBI_BLOCK_CACHED
>>> +       help
>>> +          This is a *very* dangerous feature. Using a regular
block-oriented
>>> +          filesystem might impact heavily on a flash device wear.
>>> +          Use with extreme caution.
>>> +
>>> +          If in doubt, say "N".
>>
>> I really vote for dropping write support at all.
> 
> Why ? When you put a read-only filesystem there such as squashfs, the 
> only writes you'll have will be updates, and write support will be the 
> only way to update the filesystem. So removing write support seriously 
> impacts the usefulness of the feature itself.

So almost everyone has to enable MTD_UBI_BLOCK_WRITE_SUPPORT?
I thought there is another way to fill the volume with data...

Thanks,
//richard
