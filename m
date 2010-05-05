Subject: Re: [PATCHv2] nanddump: Support 4096+218 and 4096+224 page sizes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <947e853e5d1ba35a67546703267b0fabe59af110@localhost.localdomain>
References: <947e853e5d1ba35a67546703267b0fabe59af110@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 14:26:34 +0300
Message-ID: <1273058794.3702.177.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-03 at 22:10 -0700, Kevin Cernekee wrote:
> Tested with Samsung K9GAG08U0D (4096+218).
> 
> This fixes three additional problems found after the initial patch
> submission:
> 
> 1) oobbuf was only 128B.  Needs to be 256B now.
> 
> 2) Random OOB data is output when nanddump hits a bad block, because
> the code was initializing readbuf instead.
> 
> 3) When using "-p", random data is displayed for bytes 218-223 since
> the OOB does not end on a 16B boundary.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Does not apply to the latest mtd-utils:

Applying: nanddump: Support 4096+218 and 4096+224 page sizes
error: patch failed: nanddump.c:209
error: nanddump.c: patch does not apply
Patch failed at 0001 nanddump: Support 4096+218 and 4096+224 page sizes
When you have resolved this problem run "git am -i --resolved".
If you would prefer to skip this patch, instead run "git am -i --skip".
To restore the original branch and stop patching run "git am -i --abort".
[dedekind@eru mtd-utils]$ patch -p1 < .git/rebase-apply/patch 
patching file nanddump.c
Hunk #2 FAILED at 212.
Hunk #3 succeeded at 359 (offset 2 lines).
1 out of 3 hunks FAILED -- saving rejects to file nanddump.c.rej

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
