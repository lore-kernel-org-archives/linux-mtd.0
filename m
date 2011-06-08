Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEjA-000759-Qc
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:07:06 +0000
Received: by fxm14 with SMTP id 14so231691fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:07:03 -0700 (PDT)
Subject: Re: [PATCH 05/44] mtd: bfin-async-flash.c: use
	mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307523682.31223.32.camel@localhost>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-6-git-send-email-dbaryshkov@gmail.com>
	<1307523682.31223.32.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 12:02:45 +0300
Message-ID: <1307523765.31223.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 12:01 +0300, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
> > +       mtd_device_parse_register(state->mtd, part_probe_types, 0,
> > +                       pdata->parts, pdata->nr_parts);
> 
> How about checking the return code? :-)

Ok, you did not do it because the original function did not do it. Fair
enough, this is a separate thing.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
