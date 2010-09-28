Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0U15-0005Lb-KN
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2010 06:50:20 +0000
Received: by bwz19 with SMTP id 19so5423121bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Sep 2010 23:50:18 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: Use $(CURDIR) in place of $(PWD)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <90498d8ec2a6b99c34b3bc61cf5e6444@localhost>
References: <90498d8ec2a6b99c34b3bc61cf5e6444@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 09:48:29 +0300
Message-ID: <1285656509.2437.18.camel@localhost>
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

On Mon, 2010-09-27 at 17:22 -0700, Kevin Cernekee wrote:
> $(PWD) comes from the shell and may cause unexpected side effects when
> using "make -C".
> 
> $(CURDIR) is defined internally by GNU make.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>

Pushed, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
