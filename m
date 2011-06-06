Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWe8-0000lN-Ta
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:02:57 +0000
Received: by yxk30 with SMTP id 30so281779yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 03:02:54 -0700 (PDT)
Subject: Re: ubifs_decompress: cannot decompress ...
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <BANLkTimsanbjqD8ZqJ26wcp42iQWt+vFdw@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
	<BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
	<BANLkTinyQ1hoRDzJ8QKNZYP1m8X+AyPUGQ@mail.gmail.com>
	<BANLkTim+sNbXG3yk_DGZk4=+0Za+gb65BA@mail.gmail.com>
	<BANLkTimyNmXpKeCP3oHwx1SV2gdb4r7oNg@mail.gmail.com>
	<1306914686.4405.53.camel@localhost>
	<BANLkTi=ATYnYKrRvZLyFPxfbW0_RVwTROA@mail.gmail.com>
	<BANLkTimsanbjqD8ZqJ26wcp42iQWt+vFdw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 12:58:36 +0300
Message-ID: <1307354316.3112.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ben Gardiner <bengardiner@nanometrics.ca>,
	MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 14:59 -0400, Matthew L. Creech wrote: 
> On Thu, Jun 2, 2011 at 12:30 AM, Matthew L. Creech <mlcreech@gmail.com> wrote:
> >
> > As for this specific error (ubifs_decompress): tomorrow I'll try to
> > gather & post additional log data for this device.  Thanks!
> >
> 
> Here is a console dump with more information enabled:
> 
> http://mcreech.com/work/ubifs-decompress-err.txt
> 
> I turned on mount & recovery debug messages, although it seems to
> mount & recover correctly, so presumably any info from past recovery
> actions is long gone.  The error actually occurs later on, when our
> main application accesses SQLite databases.
> 
> I dumped out the corrupted node data in 3 places:
> 
> 1. In ubifs_decompress(), I dumped the data buffer, prefixed with
> "compressed node" (redundant with #3, really)
> 
> 2. In read_block(), I page-align the starting offset & size, re-fetch
> the pertinent pages from flash, and dump those with corresponding OOB
> info, prefixed with "data" and "oob" respectively
> 
> 3. There's already a dbg_dump_node() call in read_block(), so I
> enabled that as well

So the corruption starts exactly at the NAND page boundary. This makes
me believe that the reason is most probably power cut recovery. But you
say your client ensures there were none...

Yes, you are right that info from past is gone... What I'd like to see
is a dump of the whole LEB. Could you please add 'dbg_dump_leb()' -
basically I want to look if this LEB was passed through GC.

Because my theory is:

1. You have LEB A which contains this data node, but it is not corrupted
   yet. Let's call this data node X.
2. GC moves valid data from LEB A to LEB B (lnum 3479).
3. We get a power cut while moving the data. We end up with node X
   corrupted in B.
4. UBIFS recovery has a bug and it decides that the copy of node X in
   LEB B is OK, commits, and LEB A is erased at some point.
5. And we are in your situation...

But this is just a theory.

I actually worked on power cut emulation testing improvements lately,
and the current state is that "integck -p" fails sometimes. I need to
investigate it - might turn out to be a bug which cases the effect you
see.

Basically, I've improved UBIFS power cut testing and corrupt the buffer
with random data, not only with 0xFFs, and now integck -p starts
failing. See this commit:

http://git.infradead.org/ubifs-2.6.git/commit/96c32bb596c5a74362a6a825f66fde68b6c3487c

It contains several unrelated changes. Ignore the simple random part,
only the changes in 'cut_data()' are interesting.

But I'll split that change on several changes.

And I'll try to investigate the issue - it might turn out to be
integck's issue, will see.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
