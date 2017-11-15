Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eF4JE-0005FE-RP
 for linux-mtd@lists.infradead.org; Wed, 15 Nov 2017 20:29:23 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Wed, 15 Nov 2017 21:29:14 +0100
Message-ID: <7598033.H8v47AZKNl@blindfold>
In-Reply-To: <4fafb954-2b57-1b7a-cfc9-85d379c0aa57@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <f84e49bb-a870-c519-6224-cf15dce9ce24@colorfullife.com>
 <4fafb954-2b57-1b7a-cfc9-85d379c0aa57@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,

Am Mittwoch, 15. November 2017, 21:04:14 CET schrieb Manfred Spraul:
> Hi,
> 
> On 11/14/2017 07:49 PM, Manfred Spraul wrote:
> > Hi Richard,
> > 
> > On 11/13/2017 10:06 PM, Richard Weinberger wrote:
> >> No, the image that contains the first logical error.
> >> UBIFS can mount even if there are many problems with the structure.
> >> Therefore I need you to enable chk_fs.
> > 
> > Done - and I even found a 2nd instance where the image got bad:
> > https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/
> 
> Sorry for the self-reply, I did another test:
> I applied "ubifs: replay: Detect and kill orphaned xattrs", i.e.
> https://patchwork.ozlabs.org/patch/780667/.

I would be astonished if that patch would fix your issues, it is supposed
to fix a -ENOSPC problem.
 
> Finding 1: It does not help
> Finding 2: I get for some images lots of "UBIFS error (ubi0:0 pid
> 13670): ubifs_replay_journal: Expected ino node, got: 1/2/3"

1/2/3?

Is always "got 0xFF but expected something different"?
If so, it can be a problem with garbage collect.

> The last good image is e.g. 164908, the first image with such messages
> is 164909:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/kill_xattr/
> 
> And, perhaps it helps to understand the issues:
> The stress test is parallel, i.e. 4 parallel bash scripts that do
> something like "touch a b c ;rm c; mv a b;".

Hmm, nothing fancy. No O_TMPFILE, no xattr, no encryption. :-(
I hope I'll find some time during the weekend to inspect your images.

Thanks,
//richard
