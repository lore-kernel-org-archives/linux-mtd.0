From: Stefan Roese <sr@denx.de>
To: "Eric Holmberg" <Eric_Holmberg@trimble.com>
Subject: Re: UBIFS Corrupt during power failure
Date: Fri, 15 May 2009 09:16:53 +0200
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239979018.3390.298.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200905150916.54091.sr@denx.de>
Cc: Jamie Lokier <jamie@shareable.org>, Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd@lists.infradead.org, Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eric,

On Saturday 18 April 2009 01:49:52 Eric Holmberg wrote:
> > Yeah, let's wait for Eric's results and then will work on
> > extending MTD device model with this parameter.
>
> As suggested, I patched my 2.6.27 kernel with the latest from
> http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git (includes all
> updates up to and including fhe fix-recovery bug,
> http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=commit;h=e14
> 4c1c037f1c6f7c687de5a2cd375cb40dfe71e).
>
> I have the unit running with a maximum write buffer of 8 bytes (the NOR
> flash chip is capable of 64 bytes).

How exactly did you do this? In cfi_cmdset_0002.c?

> I was seeing 4 different failure scenarios with the base 2.6.27 code,
> but now I am only seeing one remaining failure after 30+ hours of power
> cycling.  I added a stack dump this afternoon that will let me pinpoint
> exactly what is happening, but haven't seen the failure, yet.
>
> The failure happens when I get two corrupt empty LEB's.  I believe the
> scenario is that an erase is interrupted and on the next boot, while the
> file system is being recovered, another power failure occurs.
>
> I can erase one of the LEB's manually in U-Boot and the file system
> recovers properly.
>
> I'm going to leave the units running over the weekend and see what is
> waiting for me Monday morning.

Do you have an update for this? What's the current status on your system now? 
Which patches did you apply to work reliably with the Spansion FLASH?

I'm asking since we are seeing a similar issue on one of our boards equipped 
with the S29GL512P. This simple script triggers problems upon the next mount:

---
mount -t ubifs ubi0:testvolume /mnt
sync
reboot -n -f
---

The next mount will result most of the time in this:

UBIFS: recovery needed
UBIFS error (pid 406): ubifs_scan: corrupt empty space at LEB 3:130320
UBIFS error (pid 406): ubifs_scanned_corruption: corrupted data at LEB 
3:130320
UBIFS error (pid 406): ubifs_scan: LEB 3 scanning failed
UBIFS error (pid 406): ubifs_recover_leb: corrupt empty space at LEB 3:32
UBIFS error (pid 406): ubifs_scanned_corruption: corrupted data at LEB 3:32
UBIFS error (pid 406): ubifs_recover_leb: LEB 3 scanning failed
mount: Structure needs cleaning

This is without the patch from this thread included (in recovery.c). With this 
patch included the recovery is successful all the time, as far as we can see 
right now. But I'm wondering if we really need to disable the write buffer in 
the CFI driver or reduce the write buffer to 8.

Thanks.

Best regards,
Stefan

=====================================================================
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
=====================================================================
