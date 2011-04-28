Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFUmr-0001IW-3e
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 17:13:57 +0000
Received: by ewy3 with SMTP id 3so1045723ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 10:13:56 -0700 (PDT)
Subject: Re: hardware ecc support in ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amit Pundir <pundiramit@gmail.com>
In-Reply-To: <BANLkTimt+yL47W-eJ5YuwCGsEhyzX5R7jg@mail.gmail.com>
References: <BANLkTimt+yL47W-eJ5YuwCGsEhyzX5R7jg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Apr 2011 20:09:39 +0300
Message-ID: <1304010579.2737.1.camel@localhost>
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

On Wed, 2011-04-27 at 15:20 +0530, Amit Pundir wrote:
> Hi,
> 
> Does UBIFS support 1-bit h/w ECC?

The MTD laye is taking care of ECC. And just in case, neither UBI nor
UBIFS use OOB.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
