Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OHJXR-00070H-Oa
	for linux-mtd@lists.infradead.org; Wed, 26 May 2010 16:33:02 +0000
Received: by mail-fx0-f49.google.com with SMTP id 15so4916906fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 May 2010 09:33:01 -0700 (PDT)
Subject: Re: UBIFS failed to recover master node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTincmuzSyvBHO6JSsV4aJjht_JXPId58Tk-bzHIJ@mail.gmail.com>
References: <AANLkTimPxrQzSS_n6CofW8ePwCKuE7sbENJZXUl1Yszl@mail.gmail.com>
	<1274763914.2106.1.camel@localhost>
	<AANLkTincmuzSyvBHO6JSsV4aJjht_JXPId58Tk-bzHIJ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 26 May 2010 19:32:21 +0300
Message-Id: <1274891541.2668.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2010-05-26 at 12:06 -0400, twebb wrote:
> > Please, enable all debugging messages, mount this flash again, and send
> > the messages.

> Should I enable CONFIG_UBIFS_FS_DEBUG_CHKS ?

You may enable checks as well, but I was talking about messages. And
enable them before mounting the corrupted flash, not when you are trying
to reproduce this.

Refer Documentation/filesystems/ubifs.txt

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
