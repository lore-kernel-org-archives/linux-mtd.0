Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSWmV-0002Fv-Sy
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:59:28 +0000
Received: by ewy3 with SMTP id 3so903167ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:59:25 -0700 (PDT)
Subject: Re: [RFC PATCH 000/104] mtd: cleanup partition parsing interface
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:55:15 +0300
Message-ID: <1307116515.3069.24.camel@localhost>
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

On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> This is an RFC for a huge serie of patches converting most mtd drivers to use
> single instance of code for managing mtd partitions parsing and handling.
> 
> Currently each driver responsible for partitions implements this part of code
> on it's own, resulting in memory leaks, possible frees of non-allocated memory,
> etc. As the patch serie is huge, I'm posting only patches I consider
> "interesting", i. e. from the subserie doing the same cleanup for different
> drivers I post only first patch. Rest are available through the gitweb.
> 
> Only one driver still uses parse_mtd_partitions after this serie (edb7312),
> as it registers both parsed partitions and the whole mtd device and I ain't
> sure how to behave at this case.
> 
> If the idea seems find to be commited, I'll post the whole serie for full
> review.

Hi, sure this is interesting. I'll try to find time and go through this
and push to l2 tree. But then please, ping dwmw2 to look at this,
because otherwise it will not get to linux-next till the end of the next
merge window.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
