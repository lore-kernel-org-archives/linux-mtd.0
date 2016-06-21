Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFRGl-0001aI-RY
 for linux-mtd@lists.infradead.org; Tue, 21 Jun 2016 19:23:33 +0000
Subject: Re: [PATCH] ubifs-next: make xattr structures static
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@lists.codethink.co.uk
References: <1466527843-1163-1-git-send-email-ben.dooks@codethink.co.uk>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <57699415.7060603@nod.at>
Date: Tue, 21 Jun 2016 21:23:01 +0200
MIME-Version: 1.0
In-Reply-To: <1466527843-1163-1-git-send-email-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.06.2016 um 18:50 schrieb Ben Dooks:
> Fix sparse warnings from the use of "struct xattr_handler"
> structures that are not exported by making them static. Fixes
> the following sparse warnings:
> 
> /fs/ubifs/xattr.c:595:28: warning: symbol 'ubifs_user_xattr_handler' was not declared. Should it be static?
> /fs/ubifs/xattr.c:601:28: warning: symbol 'ubifs_trusted_xattr_handler' was not declared. Should it be static?
> /fs/ubifs/xattr.c:607:28: warning: symbol 'ubifs_security_xattr_handler' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Makes sense!

Thanks,
//richard
