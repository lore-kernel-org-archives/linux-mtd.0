Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIin5-0001Gr-Du
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 18:01:08 +0000
Received: by mail-ie0-f178.google.com with SMTP id ar20so1006945iec.9
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2014 10:00:46 -0800 (PST)
Date: Wed, 26 Feb 2014 10:00:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maximintegrated.com>
Subject: Re: SOLVED: [Q] `ubiattach: ioctl 0x40186f40 failed: Inappropriate
 ioctl for device' - What changed?
Message-ID: <20140226180043.GH4194@ld-irv-0074>
References: <4790760.yeQTJBGPZK@laclwks004>
 <20140226072141.GA13420@norris-Latitude-E6410>
 <3376417.FgNKArDazm@laclwks004> <3384625.n7jGnVRFVi@laclwks004>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3384625.n7jGnVRFVi@laclwks004>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Artem

Replying just to get the message through to the mailing list

On Wed, Feb 26, 2014 at 10:54:02AM +0100, Brian Foster wrote:
> On Tuesday 25-February-2014 23:42:11 Brian Foster wrote:
> > On Tuesday 25-February-2014 23:21:41 Brian Norris wrote:
> > >[...]
> > 
> >  Another guess: We are using a static /dev/ubi_ctrl
> >  node.  However, that is a dynamic minor misc device,
> >  so I am currently _guessing_ the v3.10 system assigned
> >  a different minor number than the v2.6.36 system usually
> >  does (and the FAE's system also picked a different minor
> >  for some currently unknown reason).   I will check this
> >  possibility as soon as I can ....
> 
>  Yep, that's the problem.  The “failing” systems have allocated
>  a different minor device number (according to /proc/misc) than
>  that of the static /dev/ubi_ctrl node.
> 
> cheers!
> 	-blf-
> 
> p.s.  I am not sure if this will go to the list or into
>      moderation, as my previous attempt to reply to myself
>      went into moderation ....   ;-\    (Brian Norris,
>      please feel free to re-send this to the list if it
>      doesn't make it, or kick the moderator  ;-)  or ....)

The moderator is thinking of turning some of the problematic filtering
off. You are not the only one who has ever been stopped by this.

> -- 
> Brian Foster
> Principal MTS, Software        |  La Ciotat, France
> Office:  +33 (0)4 42 98 15 35  |  Fax:  +33 (0)4 42 08 33 19
> Maxim Integrated               |  http://www.maximintegrated.com/
> 

Brian
