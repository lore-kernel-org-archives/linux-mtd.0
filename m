Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QcBGn-0003Vj-QH
	for linux-mtd@lists.infradead.org; Thu, 30 Jun 2011 07:02:38 +0000
Received: by iwn35 with SMTP id 35so2089352iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Jun 2011 00:02:26 -0700 (PDT)
Subject: Re: [PATCH v2] mtdinfo: remove -m leftovers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 30 Jun 2011 10:03:13 +0300
In-Reply-To: <1309363769-7904-1-git-send-email-computersforpeace@gmail.com>
References: <1309327350.23597.96.camel@sauron>
	<1309363769-7904-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309417402.23597.141.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-29 at 09:09 -0700, Brian Norris wrote:
> From: Artem Bityutskiy <dedekind1@gmail.com>
> 
> Looks OK to me, except it seems you did everything but actually removing
> the field in struct args :) So here's a quick v2 from me...
> 
> From: Artem Bityutskiy <dedekind1@gmail.com>
> Date: Wed, 29 Jun 2011 08:56:39 +0300
> Subject: [PATCH v2] mtdinfo: remove -m leftovers
> 
> We have removed the -m option, but did not remove args.mtdn which represents
> the -m parameters. Kill args.mtdn as well.
> 
> Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed, thanks you!

-- 
Best Regards,
Artem Bityutskiy
