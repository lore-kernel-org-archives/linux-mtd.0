Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8CIr-0000bp-Ib
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 14:04:50 +0000
Received: by eyh6 with SMTP id 6so1195026eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 07:04:48 -0700 (PDT)
Subject: Re: ubiformat: libmtd: error 12 (Cannot allocate memory): on
	system with limited RAM
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian.Ruppert@sewerin.de
In-Reply-To: <OF8FD344E7.A0857714-ONC125786B.003837F9-C125786B.0038E3D1@sewerin.de>
References: <OF8FD344E7.A0857714-ONC125786B.003837F9-C125786B.0038E3D1@sewerin.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Apr 2011 17:02:00 +0300
Message-ID: <1302271320.2834.28.camel@localhost>
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

On Thu, 2011-04-07 at 12:20 +0200, Bastian.Ruppert@sewerin.de wrote:
> Hello,
> 
> i have problems writing an image with ubiformat in an environment with 
> limited RAM.

BTW, this fix was pushed to my l2 tree, you can find it here:
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

"mtd: retry large buffer allocations"

Please, test and let us know if it helps you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
