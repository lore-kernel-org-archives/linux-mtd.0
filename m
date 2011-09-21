Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Mnx-0005jG-GM
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 13:25:38 +0000
Received: by wyi11 with SMTP id 11so230482wyi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 06:25:34 -0700 (PDT)
Subject: Re: mount options for jffs2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Folkert van Heusden <folkert.van.heusden@gmail.com>
Date: Wed, 21 Sep 2011 16:28:14 +0300
In-Reply-To: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316611702.4849.91.camel@sauron>
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

On Wed, 2011-09-21 at 11:19 +0200, Folkert van Heusden wrote:
> Hi,
> 
> While hunting a database (SQLite) corruption issue (on jffs2) I
> noticed that mount not only accepts barier=1 and data=journal but
> test123 and test456 as well.
> So I was wondering what mount options are supported for jffs2? I use
> linux kernel version 2.6.19.

I think jffs2 does not support any non-standard mount options - they are
ignored.

-- 
Best Regards,
Artem Bityutskiy
