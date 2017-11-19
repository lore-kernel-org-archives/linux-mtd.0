Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eGWaA-00013C-Qj
 for linux-mtd@lists.infradead.org; Sun, 19 Nov 2017 20:52:53 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Sun, 19 Nov 2017 21:52:44 +0100
Message-ID: <3046677.dsXx11Gx8o@blindfold>
In-Reply-To: <c0730b1f-861b-6c3d-b3aa-77825a5d4470@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <7598033.H8v47AZKNl@blindfold>
 <c0730b1f-861b-6c3d-b3aa-77825a5d4470@colorfullife.com>
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

Am Donnerstag, 16. November 2017, 17:51:26 CET schrieb Manfred Spraul:
> Hi Richard,
> 
> (2nd mail, forced as non-html)
> 
> On 11/15/2017 09:29 PM, Richard Weinberger wrote:
> > Manfred,
> > 
> > Am Mittwoch, 15. November 2017, 21:04:14 CET schrieb Manfred Spraul:
> >> Hi,
> >> 
> >> On 11/14/2017 07:49 PM, Manfred Spraul wrote:
> >>> Hi Richard,
> >>> 
> >>> On 11/13/2017 10:06 PM, Richard Weinberger wrote:
> >>>> No, the image that contains the first logical error.
> >>>> UBIFS can mount even if there are many problems with the structure.
> >>>> Therefore I need you to enable chk_fs.
> >>> 
> >>> Done - and I even found a 2nd instance where the image got bad:
> >>> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/
> >> 
> >> Sorry for the self-reply, I did another test:
> >> I applied "ubifs: replay: Detect and kill orphaned xattrs", i.e.
> >> https://patchwork.ozlabs.org/patch/780667/.
> > 
> > I would be astonished if that patch would fix your issues, it is supposed
> > to fix a -ENOSPC problem.
> 
> After enabling chk_fs, the result was
> 
> > UBIFS error (ubi0:0 pid 5104): dbg_check_filesystem: inode 39012 nlink is
> > 1, but calculated nlink is 0
> and link count 1 instead of 0 sounded a bit like a leak.
> 
> dmesg:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/result-1680
> 78.txt/download image:
> https://sourceforge.net/projects/calculix-rpm/files/ubifs/chk_fs/image-16807
> 8.bin/download
> 
> Thus I decided that it might make sense to try a patch that should
> improve the behavior with leaks.
> And it did not take much time.

Hmmm, maybe we confuse UBIFS that much that it fails differently in your case.

Anyway, let's reconsider.
If you're facing the problem which should be solved by the said patch, we can 
do a check.

1. Do you face the issue without ecryptfs?
2. Does it also happen without xattrs being used at all? Hence also without 
ecryptfs?
 
I'm afraid that the patch has still problems (it is not merged for reasons).
So, please keep on a stock kernel for now.

Thanks,
//richard
