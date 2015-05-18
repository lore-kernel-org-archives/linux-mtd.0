Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuPI9-0008HV-OW
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 17:57:30 +0000
Received: by pacwv17 with SMTP id wv17so161207678pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 10:57:07 -0700 (PDT)
Date: Mon, 18 May 2015 10:57:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: Tracking flash IO activity?
Message-ID: <20150518175702.GO11598@ld-irv-0074>
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
 <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
 <20150516205354.GK6055@norris-Latitude-E6410>
 <CAFLxGvwrCO8BozRb3jkncWy+2w6y82zz+wtL2r_E9i3VT3N8HQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvwrCO8BozRb3jkncWy+2w6y82zz+wtL2r_E9i3VT3N8HQ@mail.gmail.com>
Cc: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 16, 2015 at 11:22:52PM +0200, Richard Weinberger wrote:
> On Sat, May 16, 2015 at 10:53 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > I don't know of any similar IO stats for MTDs, sorry.
> 
> I wonder how hard it would be to integrate mtd into our current block IO stats.
> It mtd is too low level we could also do it with UBI.

I'm not sure if blk-io's iostats would be sufficiently informative for
MTD/UBI anyway. Wouldn't we care about at least one extra
non-block-device stat: the erase stats?

Also (and this may be more like what Valent is asking for, though he
mentions JFFS2, not UBIFS) is there a readily-available tool for reading
the erase counter information from a UBI volume?

Brian
