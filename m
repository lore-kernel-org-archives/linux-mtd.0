Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qt19t-0006uy-Cy
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2011 17:41:06 +0000
Received: by wwf10 with SMTP id 10so3686697wwf.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Aug 2011 10:41:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313422279.8691.9.camel@sauron>
References: <CAN8TOE9mWEmS5YJqNrS9OrG=t+emeLcXNpKR1BiZ6VDJW7_c=A@mail.gmail.com>
	<1312328310-18003-1-git-send-email-computersforpeace@gmail.com>
	<1313422279.8691.9.camel@sauron>
Date: Mon, 15 Aug 2011 10:41:03 -0700
Message-ID: <CAN8TOE-di_=kg1CXsZ8iPKTXef4Z4Vfh7Z48+MJCPxz5j0aFNA@mail.gmail.com>
Subject: Re: [PATCH] mtd: cafe_nand: register master MTD at most once
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, dsd@laptop.org,
	Jamie Iles <jamie@jamieiles.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 15, 2011 at 8:31 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Thanks for the fix! For some reason David missed the last merge window
> and did not merge the MTD stuff. So we still have a possibility to fix
> the original commit, so I folded this into commit 0f7451bea.

OK, good.

Speaking of the folding, missing merge window, rebasing, etc., I think
you now have a commit in l2-mtd-2.6.git that refers to a hash that
doesn't exist in your tree anymore. For fear of continuing the trend
of having archived messages referring to holes in history, I will
simply list the name (not hash) of the commit whose description
probably should be edited:

"mtd: plat-nand: Fixup kerneldoc for struct platform_nand_chip"

Brian
