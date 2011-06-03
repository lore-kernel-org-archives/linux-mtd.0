Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUo6-0005Hp-6D
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:52:59 +0000
Received: by ewy3 with SMTP id 3so850990ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 06:52:55 -0700 (PDT)
Subject: Re: [PATCH 05/10] UBIFS: fix shrinker object count reports
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1307109001-19761-6-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
	<1307109001-19761-6-git-send-email-dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 16:48:46 +0300
Message-ID: <1307108926.3069.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 16:49 +0300, Artem Bityutskiy wrote:
> +		/*
> +		 * Due to the way UBIFS updates the clean znode counter it may
> +		 * temporarily be negative.
> +		 */
> +		return clean_zn_cnt > 0 ?: 1;

Oh, this should be  clean_zn_cnt >= 0 ?: 1;

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
