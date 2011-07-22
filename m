Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QkAtZ-0001Nm-L3
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2011 08:15:42 +0000
Received: by pzk1 with SMTP id 1so3314587pzk.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jul 2011 01:15:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: tests: fix '&&' and '||' warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 22 Jul 2011 11:16:53 +0300
In-Reply-To: <1311180822-6226-1-git-send-email-computersforpeace@gmail.com>
References: <1311180822-6226-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1311322617.20707.9.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-20 at 09:53 -0700, Brian Norris wrote:
> Commit 3db343a094c876efc64a267a6968cfd5a6f93965
> ("mtd: tests: ignore corrected bitflips in OOB on mtd_readtest")
> introduces a compiler warning:
> 
>   CC [M]  drivers/mtd/tests/mtd_readtest.o
>   drivers/mtd/tests/mtd_readtest.c: In function ‘read_eraseblock_by_page’:
>   drivers/mtd/tests/mtd_readtest.c:79: warning: suggest parentheses around ‘&&’ within ‘||’
> 
> [Note: the commit hash above is only valid if l2-mtd-2.6 is not rebased
> too much. You can just squash this patch into the commit that produced
> this warning if you'd like.]

Folded into the original patch, thank you!

-- 
Best Regards,
Artem Bityutskiy
