Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvkSH-0002fr-CW
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 06:27:22 +0000
Received: by ywp17 with SMTP id 17so5035931ywp.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 23:27:17 -0700 (PDT)
Subject: Re: [PATCH 00/10] nandwrite: clean out old ioctls
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 23 Aug 2011 09:29:04 +0300
In-Reply-To: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
References: <1313773676-12879-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1314080949.2645.64.camel@sauron>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
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

On Fri, 2011-08-19 at 10:07 -0700, Brian Norris wrote:
> Hello,
> 
> This series cleans up some coding style, but it primarily deals with
> several options to nandwrite that have rotted. Mostly, this deals with
> MEMSETOOBSEL, which hasn't existed since kernel 2.6.17 - see commit:

Thanks for cleaning the crap which others wouldn't touch with a 10 foot
pole :-)

Pushed with pleasure to mtd-utils.

-- 
Best Regards,
Artem Bityutskiy
