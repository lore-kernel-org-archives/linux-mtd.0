Received: from 38plumes.fr ([37.187.67.249])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btLFk-0007D6-5C
 for linux-mtd@lists.infradead.org; Sun, 09 Oct 2016 21:03:24 +0000
To: richard@nod.at
Subject: Re: [PATCH] ubifs: implement POSIX Access Control Lists (ACLs)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sun, 09 Oct 2016 23:03:02 +0200
From: Pascal Eberhard <pascal.eberhard@gmail.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com>
References: <1476046382-19185-1-git-send-email-pascal.eberhard@gmail.com>
Message-ID: <c891c3af247c497863916319233be933@38plumes.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


On 2016-10-09 22:53, Pascal Eberhard wrote:
> This patch implements POSIX Access Control Lists (ACLs) in UBIFS.

The history of this patch might be of interest:
- I am running UBIFS with ACL for 2 years with kernel 3.2. The goal
   now is to -finally- get in sync with mainline.
   APIs evolved a lot since 3.2, so porting this initial code to
   mainline did not really make sense as 80% of the code is now
   implemented in a generic manner.
- As well, I was pleased to see Sheng Yong patch proposal in 2015 in
   ML archives, but it seems it has not been finalized.

So this work is based on actual btrfs implementation and 'inspired'
from Sheng Yong proposal, related discussions, as well as my 3.2
initial code.

This patch has been tested with:
- LTP fs/acl/tacl_xattr.sh (modified version),
- LTP fs/acls/acl_test01 (modified version),
- an ACL test suite made during initial 3.2 development.


Best regards,

Pascal
