Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaPfQ-0004by-8Q
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 11:05:16 +0000
Received: by werc12 with SMTP id c12so1550256wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2012 04:05:13 -0700 (PDT)
Date: Fri, 1 Jun 2012 14:04:45 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: mtd nand erase and bad block
Message-ID: <20120601140445.346e322e@halley>
In-Reply-To: <1338540121.2536.150.camel@sauron.fi.intel.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com>
 <1338540121.2536.150.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 01 Jun 2012 11:42:01 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-06-01 at 09:29 +0100, Angus CLARK wrote:
> > I have to do this regularly for testing new NAND drivers.  After getting fed up
> > with doing temporary hacks all the time, I ended up adding a
> > 'nand_erasebadblock' entry to debugfs, which overrides the check in
> > nand_erase_nand():
> > ...
> > 	if (!nand_erasebadblock &&
> > 	    nand_block_checkbad(mtd, ((loff_t) page) <<
> > 				chip->page_shift, 0, allowbbt)) {
> > ...
> > 
> > The sequence in userspace would then be something like:
> > 
> > 	target% echo 1 > /sys/kernel/debug/nand_erasebadblock
> > 	target% flash_erase -N /dev/mtd6 0x00200000 1
> > 	target% echo 0 > /sys/kernel/debug/nand_erasebadblock
> > 

> > 
> > Typically, debugfs is only enabled in development environments, and even then it
> > requires explicit user action, so this method of enabling erasing bad blocks is
> > safe enough for our needs.
> 
> Sounds ok to me, especially if you send the patch together with a piece
> of doc for the mtd web-site. I just think it is important to document
> this feature. Is this doable?

I think we should prefer a local "allow erase bad blocks" policy than a
global one.

This is because when the global debugfs flag is on, *every* mtd erase
operation might lead to erasure of bad blocks - not necessarily those
triggered by the user which set the flag prior issuing his 'flash_erase'
command.

Meaning, other MTD users (ubi, various ffs) which currently work on
other mtd partitions, are suddenly relaxed and allowed to erase bad
blocks - which is probably not what user intented.

I suggest to be more restrictive and have the "allow erase bad blocks"
propery be local policy, that is - per an erase request.

And since we'll probably need this thing only for userspace erase
calls (e.g. flash_erase) - I suggest placing it into the MEMERASE ioctl.

Comments?

Regards,
Shmulik
