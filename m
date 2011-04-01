Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5hDe-0003qq-Ul
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 16:29:07 +0000
Received: by ewy3 with SMTP id 3so1224420ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 09:29:05 -0700 (PDT)
Subject: Re: Mtd alignment bug affecting 1.4.X including current git
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kelly Anderson <kelly@silka.with-linux.com>
In-Reply-To: <4D9594B9.1020402@silka.with-linux.com>
References: <4D9091B1.80002@silka.with-linux.com>
	<1301645767.2789.25.camel@localhost>
	<4D9594B9.1020402@silka.with-linux.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 19:26:36 +0300
Message-ID: <1301675196.2789.118.camel@localhost>
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

On Fri, 2011-04-01 at 03:02 -0600, Kelly Anderson wrote:
> On 04/01/11 02:16, Artem Bityutskiy wrote:
> > On Mon, 2011-03-28 at 07:48 -0600, Kelly Anderson wrote:
> >> If you create a patch I'll test it for you.
> > Kelly, would you please test the following patch:
> 
> Seems to work fine.

Thanks, pushed to the mtd-utils tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
