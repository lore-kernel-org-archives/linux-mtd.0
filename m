Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NrWT2-0003pB-Rt
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 13:05:57 +0000
Subject: Re: CONFIG_MTD_DEBUG vs generic DEBUG support in kernel.h
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
In-Reply-To: <878w9swhlv.fsf@tac.ki.iif.hu>
References: <878w9swhlv.fsf@tac.ki.iif.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 16 Mar 2010 15:05:59 +0200
Message-ID: <1268744759.20017.58.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-16 at 13:55 +0100, Ferenc Wagner wrote:
> Hi,
> 
> include/linux/mtd/mtd.h contains the following snippet:
> 
> #ifdef CONFIG_MTD_DEBUG
> #define DEBUG(n, args...)                               \
>         do {                                            \
>                 if (n <= CONFIG_MTD_DEBUG_VERBOSE)      \
>                         printk(KERN_INFO args);         \
>         } while(0)
> 
> which conflicts with the generic debugging support in
> include/linux/kernel.h:
> 
> #ifdef DEBUG
> #define pr_devel(fmt, ...) \
>         printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
> 
> (that is, gcc emits redefinition warnings on modules which
> #define DEBUG on their own and also include mtd.h)
> Unfortunately, the DEBUG macro is used rather heavily under
> drivers/mtd.  Should we resolve this somehow or is it better
> to just live with it?
> 
> (Please keep me on Cc, I'm not subscribed.)

IMO, this MTD debug stuff is not very useful and could be just killed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
