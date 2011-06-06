Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTV0V-0006Al-R4
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:17:56 +0000
Received: by fxm14 with SMTP id 14so3327386fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:17:54 -0700 (PDT)
Subject: Re: [PATCH 050/104] physmap_of: separate parse_obsolete_partitions
	to separate parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307347880.3135.35.camel@localhost>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>
	<1307347330.3135.29.camel@localhost>  <4DEC8B45.1020900@gmail.com>
	<1307347880.3135.35.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 11:13:38 +0300
Message-ID: <1307348018.3135.36.camel@localhost>
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

On Mon, 2011-06-06 at 11:11 +0300, Artem Bityutskiy wrote:
> I understand your desire to keep physmap_of nice and shiny and have all
> the crap separate, but that is really too small amount of code to even a
> separate file. And after all, that's physmap_of's crap, 

Or rather s/phusmap_of/ofpart/

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
