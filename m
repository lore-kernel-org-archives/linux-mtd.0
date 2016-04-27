Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avLmY-0006PF-7d
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 09:29:18 +0000
Subject: Re: [PATCH 3/8] mtd-utils: Add flash torture test utility
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Richard Weinberger <richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
 <1461622409-14970-4-git-send-email-richard@nod.at>
 <CAAEAJfCP1Lsxe+9r1vp-iaZsJhjfa+uZi+=kPpocSpc-zaA_cg@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <5130ded8-10e2-584b-a7a2-ebc0cdaa1ad8@sigma-star.at>
Date: Wed, 27 Apr 2016 11:28:57 +0200
MIME-Version: 1.0
In-Reply-To: <CAAEAJfCP1Lsxe+9r1vp-iaZsJhjfa+uZi+=kPpocSpc-zaA_cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/26/2016 04:34 PM, Ezequiel Garcia wrote:
> mtd_torture seems to print its own message when the torture fails:
> 
> normsg("PEB %d passed torture test, do not mark it a bad", eb);
> 
> Isn't confusing to print "do not mark it a bad" (sic) in the torture test?
> I mean: this would imply that the test would mark as bad if the torture fails?
> 
Presumably mtd_torture was specifically written for ubiformat or moved over from
the ubiformat utility to libmtd, judging from the kind of diagnostics it generates
on its own.

It would probably be better to move these kinds of those diagnostics back/over to
ubiformat that uses the function to determine if it should mark a block as bad.


David
