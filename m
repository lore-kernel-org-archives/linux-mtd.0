Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVfZ-0006n9-Vp
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:00:22 +0000
Received: by fxm14 with SMTP id 14so3352540fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:00:19 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: remove unnecessary TODO
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1307039906-6462-1-git-send-email-computersforpeace@gmail.com>
References: <1307039906-6462-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 11:56:03 +0300
Message-ID: <1307350563.3135.42.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <ffainelli@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 11:38 -0700, Brian Norris wrote:
> I believe this TODO was unnecessary back when it was introduced:
> 	commit d1e1f4e42b5df063712ca2926e50c07b95c96b96
> 	mtd: nand: add support for reading ONFI parameters...
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed  to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
