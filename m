Received: from ozlabs.org ([2402:b800:7003:1:1::1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlE3I-0000Sn-Vu
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2012 06:54:42 +0000
From: Rusty Russell <rusty@ozlabs.org>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 11/11] UBI: Fastmap: Add a module parameter to enable
 fastmap
In-Reply-To: <1340982869-77042-12-git-send-email-richard@nod.at>
References: <1340982869-77042-1-git-send-email-richard@nod.at>
 <1340982869-77042-12-git-send-email-richard@nod.at>
Date: Sun, 01 Jul 2012 15:58:12 +0930
Message-ID: <87vci8xaf7.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: nyoushchenko@mvista.com, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, adrian.hunter@intel.com,
 Heinz.Egger@linutronix.de, thomas.wucher@linutronix.de,
 shmulik.ladkani@gmail.com, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 Jun 2012 17:14:29 +0200, Richard Weinberger <richard@nod.at> wrote:
> The new parameter, ubi.fm_auto is per default 0.

...
> +module_param(fm_auto, bool, 000);

Hmm, do you really not want to see this in sysfs?  Or set it?

Cheers,
Rusty.
