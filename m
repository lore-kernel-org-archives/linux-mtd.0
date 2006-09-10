Received: from nf-out-0910.google.com ([64.233.182.188])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GMEyZ-0008V7-KP
	for linux-mtd@lists.infradead.org; Sun, 10 Sep 2006 03:23:16 +0100
Received: by nf-out-0910.google.com with SMTP id l37so1070463nfc
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Sep 2006 19:22:13 -0700 (PDT)
Message-ID: <625fc13d0609091922m42a1caeagfa4e87bc18f2a8d6@mail.gmail.com>
Date: Sat, 9 Sep 2006 21:22:13 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: State of UBI
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Where are we with UBI?  It seems Artem has been steadily committing
fixes to the ubi git tree.  There's supposedly still interest from
other projects.  Yet it hasn't been reviewed very much, for which I'm
partly to blame.  So where should we go from here?

I think a good start would be to list what's missing.  I know that it
needs a patch to allow double page writes on NAND.  There's also the
missing JFFS2 integration, or rather two competing versions of it.  Is
there anything else?  Something documented in a TODO list would be
good.

Then there's a matter of when should it be merged.  As it stands right
now, UBI is in limbo and I'd hate to see something with good potential
just sit around rotting.  Having a merge goal would perhaps provide
some motivation.  It could be a date or a kernel version, but it
should be realistic.

So lets come up with some kind of plan to get it reviewed, tested, and
merged.  My hope would be that all involved so far, or even those that
want to help out, could reply with their thoughts.  I'm afraid some
won't for various reasons.  Perhaps if some of us are going to LCA we
could get together and hash some things out more in detail, but I'd
rather not wait until then to get things moving.

josh
