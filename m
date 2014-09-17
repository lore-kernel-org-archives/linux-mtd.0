Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUAqL-0005jJ-S2
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 08:44:06 +0000
Message-ID: <1410943421.28850.93.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix possible deadlock in erase_worker()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 17 Sep 2014 11:43:41 +0300
In-Reply-To: <541948E3.3080602@nod.at>
References: <1410853702-11616-1-git-send-email-richard@nod.at>
 <1410942507.28850.78.camel@sauron.fi.intel.com> <541948E3.3080602@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-09-17 at 10:40 +0200, Richard Weinberger wrote:
> /*
>  * nested locking. NOTE: rwsems are not allowed to recurse
>  * (which occurs if the same task tries to acquire the same
>  * lock instance multiple times), but multiple locks of the
>  * same lock class might be taken, if the order of the locks
>  * is always the same. This ordering rule can be expressed
>  * to lockdep via the _nested() APIs, but enumerating the
>  * subclasses that are used. (If the nesting relationship is
>  * static then another method for expressing nested locking is
>  * the explicit definition of lock class keys and the use of
>  * lockdep_set_class() at lock initialization time.
>  * See Documentation/lockdep-design.txt for more details.)
>  */
> 
> In this case the same task is taking the same lock multiple times,
> which is not allowed according to rwsem.h.

Yes, this part was missed, thanks.

-- 
Best Regards,
Artem Bityutskiy
