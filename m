Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R6Mq6-0005mz-Ld
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2011 13:27:51 +0000
Received: by eyd9 with SMTP id 9so1114396eyd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Sep 2011 06:27:49 -0700 (PDT)
Subject: Re: mount options for jffs2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Folkert van Heusden <folkert.van.heusden@gmail.com>
Date: Wed, 21 Sep 2011 16:30:32 +0300
In-Reply-To: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
References: <CAFDOyVAi_++e_sBpeJyL5Dy2GwP+y=BV25dJ4_9GpCo532tdnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1316611838.4849.93.camel@sauron>
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
> Also: anyone got experience with sqlite on jffs2? If so: how did you
> solve these nasty corruptions?

Start with validating your drivers using mtd tests, which are not
available in 2.6.16, though, but you can try Adrian's ancient repo,
which you'll find here:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

-- 
Best Regards,
Artem Bityutskiy
