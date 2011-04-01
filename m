Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ftV-0002nA-75
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:04:13 +0000
Received: by ewy3 with SMTP id 3so1194879ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 08:04:11 -0700 (PDT)
Subject: Re: [PATCH 0/2] do not select KALLSYMS_ALL
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paulo Marques <pmarques@grupopie.com>
In-Reply-To: <1301669776.2789.92.camel@localhost>
References: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
	<4D948D52.4040708@grupopie.com>  <1301669776.2789.92.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 18:01:44 +0300
Message-ID: <1301670104.2789.94.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 17:56 +0300, Artem Bityutskiy wrote:
> Well, ok, I've measured how much is this "a lot". On an embedded arm
> platform this makes the kernel only 1.5% larger. 

But in absolute numbers this is 70KiB in my case, which is indeed
considerable amount. So, I agree that it makes sense to keep this as a
separate option.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
