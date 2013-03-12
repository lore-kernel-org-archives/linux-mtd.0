Received: from mail-ve0-f182.google.com ([209.85.128.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFZ0o-0000SB-Kf
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2013 23:53:43 +0000
Received: by mail-ve0-f182.google.com with SMTP id ox1so329426veb.27
 for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2013 16:53:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363086855-2847-11-git-send-email-dedekind1@gmail.com>
References: <1363086855-2847-1-git-send-email-dedekind1@gmail.com>
 <1363086855-2847-11-git-send-email-dedekind1@gmail.com>
Date: Tue, 12 Mar 2013 16:53:41 -0700
Message-ID: <CAN8TOE93RTGWwmypHWtTSoWjVrN2s12zavw38rOozR-TmgX-kQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] mtd: remove the mbx860 map driver
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I think you got the subject line and commit message mixed up with
another patch. This patch looks like the ixp2000 driver, not mbx860.
Might want to get the engraving on the tombstone right, eh? :)

On Tue, Mar 12, 2013 at 4:14 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> This driver depends on CONFIG_MBX

s/CONFIG_MBX/CONFIG_ARCH_IXP2000

> which is not defined anywhere, which means
> this driver is dead.
>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Brian
