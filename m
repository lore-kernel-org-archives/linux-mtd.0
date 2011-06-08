Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUOwx-0003HO-0W
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 20:01:59 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-mtd@lists.infradead.org
Subject: nanddump badblock options
Date: Wed, 8 Jun 2011 13:01:24 -0700
Message-ID: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have some ideas to implement in nanddump regarding the variety of bad block
handling options. I thought I'd at least get some feedback before working up a
full patch, so please comment on my ideas.

(1) The comments in nandwrite say that nandwrite is an "inverse operation" to
nanddump. However, take, for example, the following command:

   nandwrite --length=131072 /dev/mtd1 myfile

Then, if we consider that there may be bad blocks at the beginning of the
device, nandwrite may skip to the second block in order to write this data.
Now, the default behavior of nanddump does not at all fit the "inverse" of this
very simple nandwrite operation. While you might expect the following to be an
inverse:

   nanddump --length=131072 /dev/mtd1 --file=myfile.dump

you in fact will not get the same data that you wrote from the original file.
Instead, you will get all 0xFF since by default nanddump substitutes 0xFF for
all the data of the bad block. I call this (unwanted) behavior `padding'.

Thus, in short, I'm recommending that nanddump default to using --skipbad as
a default option, with a new `padbad' option to cover the original behavior.
Perhaps the "default" nanddump should have a warning over a period of time,
before changing the default operation? See (3), Deprecation schedule.

(2) There are now (with my addition of `skipbad', and the current default
`padbad') four methods used for handling bad blocks we come across when dumping
flash data. I think they'd be cleaner if they were all grouped under a single
option that would work something like:

   --bb=METHOD

where METHOD could be `padbad', `dumpbad', `skipbad', and `omitbad'. Notice the
renaming of --noskipbad to --bb=dumpbad, since --noskipbad seems like an
inverse to --skipbad, which it is not. See (5), Summary table.

I think eventually, we would just drop both the short and long options for the
--omitbad, --noskipbad, and --skipbad options.

(3) Deprecation schedule:

Assuming the above is agreeable to everyone, how soon can we:
   * drop the --noskipbad, --skipbad, --omitbad (pluse -b, -k, -N) flags in
     favor of --bb=METHOD?
   * change the default behavior from `padbad' to `skipbad'?

I was thinkig the old methods (--omitbad, --noskipbad, --skipbad) should remain
for the time being, with a warning to tell of their deprecation/removal in next
release.

Additionally, we could perhaps include a warning when nanddump is called
without an explicit BB handling option, alerting users that the default will be
changing to --bb=skipbad in the next release.

(4) Can Mike provide a good explanation for --bb=omitbad in the table below? I
personally don't understand it's exact use, nor do I know how to describe it
best (to provide contrast against the other options), but I understand that you
would like to keep the option. I would appreciate some help.

(5) Summary table:

-----------------------------------------------------------------------------------------------------------------
 Old option         New option                   Comment
-----------------------------------------------------------------------------------------------------------------
 <default>     =>   --bb=padbad                  dump flash data, substituting 0xFF for any bad blocks
 --noskipbad   =>   --bb=dumpbad                 dump flash data, including any bad blocks
 --skipbad     =>   --bb=skipbad, <default>      dump good data, completely skipping any bad blocks (new default)
 --omitbad     =>   --bb=omitbad                 (dump flash data, substituting nothing for any bad blocks?)

Thanks,
Brian
