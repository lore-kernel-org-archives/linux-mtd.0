Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mgtpa-0007uk-6z
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 05:17:02 +0000
Subject: Re: [PATCH v5] [MTD] BCMRING: mtd nand umi driver support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
In-Reply-To: <20090827183558.GB4222@broadcom.com>
References: <20090821221701.GF14815@broadcom.com>
	<20090827183558.GB4222@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 28 Aug 2009 08:16:22 +0300
Message-Id: <1251436582.3514.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-27 at 11:35 -0700, Leo (Hao) Chen wrote:
> Hi,
> 
> As our bcmring code have been merged by Russell into linux-next repo, we really
> need this mtd driver be merged into the kenrel as well to get a
> working system.
> So, I just want to know if our patch for bcmring mtd driver is accepted or not.
> If not, what shall we improve? If yes, when can we get our code into linux-next repos?
> Or we have to submit the patch to any tracking system?
> 

You should bug David Woodhouse. I've added your driver to my l2-mtd-2.6
tree, so he should take a look at it at some point:
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/eef42e4b8b0de71f3fdac4577c0eea0537ce0386

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
