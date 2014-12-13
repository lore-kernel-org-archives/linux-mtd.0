Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzdOg-0008Sf-0h
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 03:29:34 +0000
Received: by mail-pd0-f179.google.com with SMTP id fp1so8315534pdb.38
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 19:29:13 -0800 (PST)
Date: Fri, 12 Dec 2014 19:29:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: tests: abort torturetest on erase errors
Message-ID: <20141213032910.GS21347@ld-irv-0074>
References: <1416594269-4647-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1416594269-4647-1-git-send-email-computersforpeace@gmail.com>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 21, 2014 at 10:24:29AM -0800, Brian Norris wrote:
> The torture test should quit once it actually induces an error in the
> flash. This step was accidentally removed during refactoring.
> 
> Without this fix, the torturetest just continues infinitely, or until
> the maximum cycle count is reached. e.g.:
> 
>    ...
>    [ 7619.218171] mtd_test: error -5 while erasing EB 100
>    [ 7619.297981] mtd_test: error -5 while erasing EB 100
>    [ 7619.377953] mtd_test: error -5 while erasing EB 100
>    [ 7619.457998] mtd_test: error -5 while erasing EB 100
>    [ 7619.537990] mtd_test: error -5 while erasing EB 100
>    ...
> 
> Fixes: 6cf78358c94f ("mtd: mtd_torturetest: use mtd_test helpers")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: <stable@vger.kernel.org>

Applied to l2-mtd.git.

Brian
