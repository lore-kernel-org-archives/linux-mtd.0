Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTXdJ-0002Cb-C9
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 11:06:10 +0000
Received: by fxm14 with SMTP id 14so3432586fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 04:06:06 -0700 (PDT)
Subject: Re: [PATCH 1/2] nanddump: add --skipbad option for bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307125501-32558-1-git-send-email-computersforpeace@gmail.com>
References: <1307125501-32558-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 14:01:50 +0300
Message-ID: <1307358110.3112.36.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 11:25 -0700, Brian Norris wrote:
> This patch adds a new option "--skipbad" to nanddump. It is subtly
> different than "--omitbad". The following description was included in
> the help message to attempt to clarify the differences.
> 
>  Notes on --omitbad and --skipbad:
>    With either option, we stop dumping data when we encounter a bad block
>    and resume dumping at the next good block. However, with --omitbad, we
>    count the bad block as part of the total dump length, whereas with
>    --skipbad, the bad block is 'skipped,' that is, not counted toward the
>    total dump length.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed both to mtd-utils.git, thank you!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
