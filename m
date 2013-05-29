Received: from mail-vc0-f172.google.com ([209.85.220.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhlbO-0005TT-DE
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 19:00:03 +0000
Received: by mail-vc0-f172.google.com with SMTP id hf12so6816295vcb.3
 for <linux-mtd@lists.infradead.org>; Wed, 29 May 2013 11:59:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAASVbFFj2U3L95JbiUf+m6UgFN0nasiMh0wYdMr4rxcJjpvuXg@mail.gmail.com>
References: <CAASVbFFj2U3L95JbiUf+m6UgFN0nasiMh0wYdMr4rxcJjpvuXg@mail.gmail.com>
Date: Wed, 29 May 2013 11:59:39 -0700
Message-ID: <CAN8TOE8JUR1O9XvOzVt6CTji5fWHmQAEArDqoWg=4G66iY6wRA@mail.gmail.com>
Subject: Re: Updating JFFS2 port to eCos for NOR-ECC support
From: Brian Norris <computersforpeace@gmail.com>
To: Max Seidenstuecker <naturally-aligned@web.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Max,

On Fri, May 24, 2013 at 11:13 AM, Max Seidenstuecker
<naturally-aligned@web.de> wrote:
> I am in the process of bringing the current JFFS2 to eCos to support
> NOR-ECC flash that is not supported in its current version.
...
> Any advice is greatly appreciated. Maybe thre are good reasons why
> JFFS2 in eCos has not been updated in a while. Please let me know
> anything you know about it.

JFFS2 is not actively supported in Linux. Most developers (and users?)
have moved on to UBI(FS). This probably explains why no one has really
worked on JFFS2 for eCos.

Brian
