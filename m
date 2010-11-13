Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHEhU-0004ty-KD
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 11:55:21 +0000
Received: by bwz5 with SMTP id 5so3971775bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 03:55:14 -0800 (PST)
Subject: Re: [PATCH 01/10] mtd-utils: nanddump: Allow 64-bit lengths
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
References: <1288772847-8120-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 13:55:02 +0200
Message-ID: <1289649302.2218.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Jehan Bing <jehan@orb.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-03 at 01:27 -0700, Brian Norris wrote:
> We should allow the dump length to be 64-bit, especially since the value
> was read in as a "long long" by strtoll().
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I've pushed whole series, thanks a lot!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
